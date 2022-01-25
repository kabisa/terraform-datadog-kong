locals {
  db_connectivity_filter = coalesce(
    var.db_connectivity_filter_override,
    var.filter_str
  )
}

module "db_connectivity" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.7.0"

  name  = "DB Connectivity"
  query = "avg(${var.db_connectivity_evaluation_period}):avg:network.tcp.can_connect{${local.db_connectivity_filter}} by {host,cluster_name} <= ${var.db_connectivity_critical}"

  # alert specific configuration
  require_full_window = false
  alert_message       = "DB Connectivity ({{ value }}) in {{ service }} exceed {{ threshold }}"
  recovery_message    = "DB Connectivity ({{ value }}) in {{ service }} has recovered"

  # module level vars
  env                  = var.env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix

  # monitor level vars
  enabled            = var.db_connectivity_enabled
  alerting_enabled   = var.db_connectivity_alerting_enabled
  warning_threshold  = var.db_connectivity_warning
  critical_threshold = var.db_connectivity_critical
  priority           = var.db_connectivity_priority
  docs               = var.db_connectivity_docs
  note               = var.db_connectivity_note
}
