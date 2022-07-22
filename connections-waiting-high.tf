locals {
  connections_waiting_high_filter = coalesce(
    var.connections_waiting_high_filter_override,
    var.filter_str
  )
}

module "connections_waiting_high" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name  = "Connections Waiting High"
  query = "avg(${var.connections_waiting_high_evaluation_period}):sum:kong.connections_waiting{${local.connections_waiting_high_filter}} by {cluster_name} > ${var.connections_waiting_high_critical}"

  # alert specific configuration
  require_full_window = false
  alert_message       = "Connections waiting is high ({{ value }}) in {{ service }} exceeds {{ threshold }}"
  recovery_message    = "Connections waiting ({{ value }}) in {{ service }} has recovered"

  # monitor level vars
  enabled            = var.connections_waiting_high_enabled
  alerting_enabled   = var.connections_waiting_high_alerting_enabled
  warning_threshold  = var.connections_waiting_high_warning
  critical_threshold = var.connections_waiting_high_critical
  priority           = min(var.connections_waiting_high_priority + var.priority_offset, 5)
  docs               = var.connections_waiting_high_docs
  note               = var.connections_waiting_high_note

  # module level vars
  env                  = var.env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
