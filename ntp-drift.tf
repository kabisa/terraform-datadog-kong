locals {
  ntp_drift_filter = coalesce(
    var.ntp_drift_filter_override,
    var.filter_str
  )
}

module "ntp_drift" {
  source  = "kabisa/generic-monitor/datadog"
  version = "1.0.0"

  name  = "System - NTP Drift"
  query = "avg(${var.ntp_drift_evaluation_period}):abs(avg:ntp.offset{${local.ntp_drift_filter}} by {host,cluster_name}) > ${var.ntp_drift_critical}"

  # alert specific configuration
  require_full_window = false
  alert_message       = "NTP Drift, the NTP difference between {{host.name}} and its NTP server is {{value}} (>{{threshold}})"
  recovery_message    = "NTP Drift has recovered"

  # monitor level vars
  enabled            = var.ntp_drift_enabled
  alerting_enabled   = var.ntp_drift_alerting_enabled
  warning_threshold  = var.ntp_drift_warning
  critical_threshold = var.ntp_drift_critical
  priority           = min(var.ntp_drift_priority + var.priority_offset, 5)
  docs               = var.ntp_drift_docs
  note               = var.ntp_drift_note

  # module level vars
  env                  = var.env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
