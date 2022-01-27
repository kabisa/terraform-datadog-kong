locals {
  disk_free_percent_filter = coalesce(
    var.disk_free_percent_filter_override,
    var.filter_str
  )
}

# Didn't want to pull in the entire system monitoring just yet
module "disk_free_percent" {
  source = "git@github.com:kabisa/terraform-datadog-generic-monitor.git?ref=0.7.0"

  name  = "System - Disk Free (percentage)"
  query = "avg(${var.disk_free_percent_evaluation_period}):100 * min:system.disk.free{${local.disk_free_percent_filter}} by {host,device} / min:system.disk.total{${local.disk_free_percent_filter}} by {host,device} < ${var.disk_free_percent_critical}"

  # alert specific configuration
  require_full_window = false
  alert_message       = "Available disk volume {{device.name}} on {{host.name}} for service ${var.service} has dropped below {{threshold}} ( {{device.name}}  has {{value}}% available on {{host.name}} )"
  recovery_message    = "Available disk volume {{device.name}} on {{host.name}} for service ${var.service} has recovered ( {{device.name}}  has {{value}}% available on {{host.name}} )"

  # monitor level vars
  enabled            = var.disk_free_percent_enabled
  alerting_enabled   = var.disk_free_percent_alerting_enabled
  warning_threshold  = var.disk_free_percent_warning
  critical_threshold = var.disk_free_percent_critical
  priority           = var.disk_free_percent_priority
  docs               = var.disk_free_percent_docs
  note               = var.disk_free_percent_note

  # module level vars
  env                  = var.env
  service              = var.service
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  locked               = var.locked
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
}
