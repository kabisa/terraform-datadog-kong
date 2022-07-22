locals {
  swap_percent_free_filter = coalesce(
    var.swap_percent_free_filter_override,
    var.filter_str
  )
}

module "swap_percent_free" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name  = "System - Swap percent free"
  query = "avg(${var.swap_percent_free_evaluation_period}):min:system.swap.pct_free{${local.swap_percent_free_filter}} by {host,cluster_name} * 100 < ${var.swap_percent_free_critical}"

  # alert specific configuration
  require_full_window = false
  alert_message       = "System - Swap percent free ({{ value }}) in {{ service }} is lower than {{ threshold }}"
  recovery_message    = "System - Swap percent free ({{ value }}) in {{ service }} has recovered"

  # monitor level vars
  enabled            = var.swap_percent_free_enabled
  alerting_enabled   = var.swap_percent_free_alerting_enabled
  warning_threshold  = var.swap_percent_free_warning
  critical_threshold = var.swap_percent_free_critical
  priority           = min(var.swap_percent_free_priority + var.priority_offset, 5)
  docs               = var.swap_percent_free_docs
  note               = var.swap_percent_free_note

  # module level vars
  env                  = var.env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
