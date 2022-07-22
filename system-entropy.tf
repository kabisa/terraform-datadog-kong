locals {
  system_entropy_filter = coalesce(
    var.system_entropy_filter_override,
    var.filter_str
  )
}

module "system_entropy" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name  = "System - Entropy"
  query = "avg(${var.system_entropy_evaluation_period}):min:system.entropy.available{${local.system_entropy_filter}} by {host,cluster_name} < ${var.system_entropy_critical}"

  # alert specific configuration
  require_full_window = false
  alert_message       = "System - Entropy ({{ value }}) in {{ service }} exceeds {{ threshold }}"
  recovery_message    = "System - Entropy ({{ value }}) in {{ service }} has recovered"

  # monitor level vars
  enabled            = var.system_entropy_enabled
  alerting_enabled   = var.system_entropy_alerting_enabled
  warning_threshold  = var.system_entropy_warning
  critical_threshold = var.system_entropy_critical
  priority           = min(var.system_entropy_priority + var.priority_offset, 5)
  docs               = var.system_entropy_docs
  note               = var.system_entropy_note

  # module level vars
  env                  = var.env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
