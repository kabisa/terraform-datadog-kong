
module "docker" {
  source  = "kabisa/docker-container/datadog"
  version = "2.0.1"

  count                = var.docker_container_monitoring_enabled ? 1 : 0
  runs_in_k8s          = var.runs_in_k8s
  env                  = var.env
  filter_str           = var.docker_filter_str
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  service              = var.service
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix

  thread_count_enabled          = true
  thread_count_alerting_enabled = false

  thread_count_critical    = 5
  disk_io_read_warning     = 7500000  # 7.5MB/s
  disk_io_read_critical    = 10000000 # 10MB/s
  disk_io_write_warning    = 7500000  # 7.5MB/s
  disk_io_write_critical   = 10000000 # 10MB/s
  egress_traffic_warning   = 7500000  # 7.5MB/s
  egress_traffic_critical  = 10000000 # 10MB/s
  ingress_traffic_warning  = 7500000  # 7.5MB/s
  ingress_traffic_critical = 10000000 # 10MB/s
}
