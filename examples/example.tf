module "kong" {
  source = "kabisa/kong/datadog"

  notification_channel = "mail@example.com"
  service              = "Kong"
  env                  = "prd"
  filter_str           = "cluster_name:kong"
  service_check_include_tags = [
    "cluster_name:kong",
  ]

  runs_in_k8s                         = true
  docker_container_monitoring_enabled = true
}