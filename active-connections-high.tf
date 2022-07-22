locals {
  active_connections_high_filter = coalesce(
    var.active_connections_high_filter_override,
    var.filter_str
  )
}

module "active_connections_high" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name  = "Active Connections High"
  query = "avg(${var.active_connections_high_evaluation_period}):sum:kong.connections_active{${local.active_connections_high_filter}} by {cluster_name} > ${var.active_connections_high_critical}"

  # alert specific configuration
  require_full_window = false
  alert_message       = "Active connections is high ({{ value }}) in {{ service }} exceed {{ threshold }}"
  recovery_message    = "Active connections ({{ value }}) in {{ service }} has recovered"

  # using this alert as a check if the cluster is returning data
  notify_no_data = true

  # monitor level vars
  enabled            = var.active_connections_high_enabled
  alerting_enabled   = var.active_connections_high_alerting_enabled
  warning_threshold  = var.active_connections_high_warning
  critical_threshold = var.active_connections_high_critical
  priority           = min(var.active_connections_high_priority + var.priority_offset, 5)
  docs               = var.active_connections_high_docs
  note               = var.active_connections_high_note

  # module level vars
  env                  = var.env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
