locals {
  datadog_agent_filter = coalesce(
    var.datadog_agent_filter_override,
    var.filter_str
  )
}


module "datadog_agent" {
  source = "git@github.com:kabisa/terraform-datadog-service-check-monitor.git?ref=1.4.0"

  name                          = "Status of Kong Cluster Datadog Agent"
  metric_name                   = "datadog.agent.up"
  notify_no_data                = true
  track_as_cluster_level_status = var.runs_in_k8s
  no_data_timeframe             = var.datadog_agent_no_data_timeframe

  # alert specific configuration  
  require_full_window = false
  alert_message       = "Datadog agent is not responding for {{ service }}"
  recovery_message    = "Datadog agent has recovered for {{ service }}"
  by_tags             = var.runs_in_k8s ? ["cluster_name"] : ["host"]
  include_tags        = var.service_check_include_tags
  exclude_tags        = var.service_check_exclude_tags

  # monitor level vars
  enabled            = var.datadog_agent_enabled
  alerting_enabled   = var.datadog_agent_alerting_enabled
  critical_threshold = var.datadog_agent_critical
  priority           = var.datadog_agent_priority
  # format the alert string, it shows the number of minutes we set the threshold to
  docs = format(var.datadog_agent_docs, var.datadog_agent_no_data_timeframe)
  note = var.datadog_agent_note

  # module level vars
  env                  = var.env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
