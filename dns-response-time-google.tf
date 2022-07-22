locals {
  dns_response_time_google_filter = coalesce(
    var.dns_response_time_google_filter_override,
    var.filter_str
  )
}

module "dns_response_time_google" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name  = "DNS Response time Google lookup"
  query = "avg(${var.dns_response_time_google_evaluation_period}):avg:dns.response_time{${local.dns_response_time_google_filter}} by {host,cluster_name} > ${var.dns_response_time_google_critical}"

  # alert specific configuration
  require_full_window = false
  alert_message       = "DNS Response time Google lookup ({{ value }}) in {{ service }} exceed {{ threshold }}"
  recovery_message    = "DNS Response time Google lookup ({{ value }}) in {{ service }} has recovered"

  # module level vars
  env                  = var.env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix

  # monitor level vars
  enabled            = var.dns_response_time_google_enabled
  alerting_enabled   = var.dns_response_time_google_alerting_enabled
  warning_threshold  = var.dns_response_time_google_warning
  critical_threshold = var.dns_response_time_google_critical
  priority           = min(var.dns_response_time_google_priority + var.priority_offset, 5)
  docs               = var.dns_response_time_google_docs
  note               = var.dns_response_time_google_note
}
