locals {
  active_connections_low_filter = coalesce(
    var.active_connections_low_filter_override,
    var.filter_str
  )
}

module "active_connections_low" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.7.0"

  name  = "Active Connections Low"
  query = "avg(${var.active_connections_low_evaluation_period}):sum:kong.connections_active{${local.active_connections_low_filter}} by {cluster_name} < ${var.active_connections_low_critical}"

  # alert specific configuration
  require_full_window = false
  alert_message       = "Active connections is low ({{ value }}) in {{ service }} is lower than {{ threshold }}"
  recovery_message    = "Active connections ({{ value }}) in {{ service }} has recovered"

  # monitor level vars
  enabled            = var.active_connections_low_enabled
  alerting_enabled   = var.active_connections_low_alerting_enabled
  warning_threshold  = var.active_connections_low_warning
  critical_threshold = var.active_connections_low_critical
  priority           = var.active_connections_low_priority
  docs               = var.active_connections_low_docs
  note               = var.active_connections_low_note

  # module level vars
  env                  = var.env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
