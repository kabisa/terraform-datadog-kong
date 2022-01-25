locals {
  integration_filter = coalesce(
    var.integration_filter_override,
    var.filter_str
  )
}


module "integration" {
  source = "git@github.com:kabisa/terraform-datadog-service-check-monitor.git?ref=1.4.0"

  name        = "Status of Kong Cluster Integration"
  metric_name = "kong.can_connect"

  # alert specific configuration  
  require_full_window = false
  alert_message       = "The Kong Cluster Integration is broken / faulty"
  recovery_message    = "The Kong Cluster Integration is functioning correctly"
  by_tags             = ["host"]
  include_tags        = var.service_check_include_tags
  exclude_tags        = var.service_check_exclude_tags

  # monitor level vars
  enabled            = var.integration_enabled
  alerting_enabled   = var.integration_alerting_enabled
  critical_threshold = var.integration_critical
  priority           = var.integration_priority
  docs               = var.integration_docs
  note               = var.integration_note

  # module level vars
  env                  = var.env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
