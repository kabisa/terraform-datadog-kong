locals {
  error_response_percentage_filter = coalesce(
    var.error_response_percentage_filter_override,
    var.filter_str
  )
  success_count = "ewma_10(exclude_null(sum:kong_internal.request.count{status:2*,${local.error_response_percentage_filter}} by {workspace}.as_count()))"
  error_count   = "ewma_10(exclude_null(sum:kong_internal.request.count{status:5*,${local.error_response_percentage_filter}} by {workspace}.as_count()))"
}

module "error_response_percentage" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.7.0"

  name  = "Error response percentage"
  query = "sum(${var.error_response_percentage_evaluation_period}):${local.error_count} * 100 / (${local.success_count} + ${local.error_count} + ${var.error_response_percentage_offset}) > ${var.error_response_percentage_critical}"

  # alert specific configuration
  require_full_window = false
  alert_message       = "Error response percentage ({{ value }}) in {{ service }} exceeds {{ threshold }}"
  recovery_message    = "Error response percentage ({{ value }}) in {{ service }} has recovered"

  # module level vars
  env                  = var.env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix

  # monitor level vars
  enabled            = var.error_response_percentage_enabled
  alerting_enabled   = var.error_response_percentage_alerting_enabled
  warning_threshold  = var.error_response_percentage_warning
  critical_threshold = var.error_response_percentage_critical
  priority           = var.error_response_percentage_priority
  docs               = var.error_response_percentage_docs
  note               = var.error_response_percentage_note
}
