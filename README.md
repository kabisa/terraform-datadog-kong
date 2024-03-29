
![Datadog](https://imgix.datadoghq.com/img/about/presskit/logo-v/dd_vertical_purple.png)

[//]: # (This file is generated. Do not edit, module description can be added by editing / creating module_description.md)

# Terraform module for Datadog Kong

This module can be used to monitor the Kong system, modules have been build based on advice we've got from Kong.
Not in scope (yet?) are monitors for the applications hosted behind Kong.
It also has the option to monitor the docker containers with the embedded [docker module](https://registry.terraform.io/modules/kabisa/docker-container/datadog/latest)

This module is part of a larger suite of modules that provide alerts in Datadog.
Other modules can be found on the [Terraform Registry](https://registry.terraform.io/search/modules?namespace=kabisa&provider=datadog)

We have two base modules we use to standardise development of our Monitor Modules:
- [generic monitor](https://github.com/kabisa/terraform-datadog-generic-monitor) Used in 90% of our alerts
- [service check monitor](https://github.com/kabisa/terraform-datadog-service-check-monitor)

Modules are generated with this tool: https://github.com/kabisa/datadog-terraform-generator

# Example Usage

```terraform
module "kong" {
  source = "kabisa/kong/datadog"

  notification_channel = "@mail@example.com"
  service              = "Kong"
  env                  = "prd"
  filter_str           = "cluster_name:kong"
  service_check_include_tags = [
    "cluster_name:kong",
  ]

  runs_in_k8s                         = true
  docker_container_monitoring_enabled = true
}

```


[Module Variables](#module-variables)

Monitors:

| Monitor name    | Default enabled | Priority | Query                  |
|-----------------|------|----|------------------------|
| [Active Connections High](#active-connections-high) | True | 3  | `avg(last_10m):sum:kong.connections_active{tag:xxx} by {cluster_name} > 2000` |
| [Active Connections Low](#active-connections-low) | True | 3  | `avg(last_10m):sum:kong.connections_active{tag:xxx} by {cluster_name} < 2` |
| [Connections Waiting High](#connections-waiting-high) | True | 3  | `avg(last_10m):sum:kong.connections_waiting{tag:xxx} by {cluster_name} > 1000` |
| [Db Connectivity](#db-connectivity) | True | 3  | `avg(last_10m):avg:network.tcp.can_connect{tag:xxx} by {host,cluster_name} <= 0.5` |
| [Disk Space](#disk-space) | True | 2  | `avg(${var.disk_free_percent_evaluation_period}):100 * min:system.disk.free{${local.disk_free_percent_filter}} by {host,device} / min:system.disk.total{${local.disk_free_percent_filter}} by {host,device} < ${var.disk_free_percent_critical}` |
| [Dns Response Time Google](#dns-response-time-google) | True | 3  | `avg(last_5m):avg:dns.response_time{tag:xxx} by {host,cluster_name} > 2` |
| [Dns Response Time](#dns-response-time) | True | 3  | `avg(last_5m):avg:dns.response_time{tag:xxx} by {host} > 1` |
| [Error Response Percentage](#error-response-percentage) | True | 3  | `sum(last_30m):${local.error_count} * 100 / (${local.success_count} + ${local.error_count} + ${var.error_response_percentage_offset}) > 3` |
| [Ntp Drift](#ntp-drift) | True | 2  | `avg(last_15m):abs(avg:ntp.offset{tag:xxx} by {host,cluster_name}) > 30` |
| [Swap Percent Free](#swap-percent-free) | True | 3  | `avg(last_5m):min:system.swap.pct_free{tag:xxx} by {host,cluster_name} * 100 < 10` |
| [System Entropy](#system-entropy) | True | 3  | `avg(last_15m):min:system.entropy.available{tag:xxx} by {host,cluster_name} < 250` |

# Getting started developing
[pre-commit](http://pre-commit.com/) was used to do Terraform linting and validating.

Steps:
   - Install [pre-commit](http://pre-commit.com/). E.g. `brew install pre-commit`.
   - Run `pre-commit install` in this repo. (Every time you clone a repo with pre-commit enabled you will need to run the pre-commit install command)
   - That’s it! Now every time you commit a code change (`.tf` file), the hooks in the `hooks:` config `.pre-commit-config.yaml` will execute.

## Active Connections High

Query:
```terraform
avg(last_10m):sum:kong.connections_active{tag:xxx} by {cluster_name} > 2000
```

| variable                                  | default  | required | description                      |
|-------------------------------------------|----------|----------|----------------------------------|
| active_connections_high_enabled           | True     | No       |                                  |
| active_connections_high_warning           | 1500     | No       |                                  |
| active_connections_high_critical          | 2000     | No       |                                  |
| active_connections_high_evaluation_period | last_10m | No       |                                  |
| active_connections_high_note              | ""       | No       |                                  |
| active_connections_high_docs              | ""       | No       |                                  |
| active_connections_high_filter_override   | ""       | No       |                                  |
| active_connections_high_alerting_enabled  | True     | No       |                                  |
| active_connections_high_no_data_timeframe | None     | No       |                                  |
| active_connections_high_notify_no_data    | False    | No       |                                  |
| active_connections_high_ok_threshold      | None     | No       |                                  |
| active_connections_high_name_prefix       | ""       | No       |                                  |
| active_connections_high_name_suffix       | ""       | No       |                                  |
| active_connections_high_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Active Connections Low

Query:
```terraform
avg(last_10m):sum:kong.connections_active{tag:xxx} by {cluster_name} < 2
```

| variable                                 | default  | required | description                      |
|------------------------------------------|----------|----------|----------------------------------|
| active_connections_low_enabled           | True     | No       |                                  |
| active_connections_low_warning           | 5        | No       |                                  |
| active_connections_low_critical          | 2        | No       |                                  |
| active_connections_low_evaluation_period | last_10m | No       |                                  |
| active_connections_low_note              | ""       | No       |                                  |
| active_connections_low_docs              | ""       | No       |                                  |
| active_connections_low_filter_override   | ""       | No       |                                  |
| active_connections_low_alerting_enabled  | True     | No       |                                  |
| active_connections_low_no_data_timeframe | None     | No       |                                  |
| active_connections_low_notify_no_data    | False    | No       |                                  |
| active_connections_low_ok_threshold      | None     | No       |                                  |
| active_connections_low_name_prefix       | ""       | No       |                                  |
| active_connections_low_name_suffix       | ""       | No       |                                  |
| active_connections_low_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Connections Waiting High

Query:
```terraform
avg(last_10m):sum:kong.connections_waiting{tag:xxx} by {cluster_name} > 1000
```

| variable                                   | default  | required | description                      |
|--------------------------------------------|----------|----------|----------------------------------|
| connections_waiting_high_enabled           | True     | No       |                                  |
| connections_waiting_high_warning           | 750      | No       |                                  |
| connections_waiting_high_critical          | 1000     | No       |                                  |
| connections_waiting_high_evaluation_period | last_10m | No       |                                  |
| connections_waiting_high_note              | ""       | No       |                                  |
| connections_waiting_high_docs              | ""       | No       |                                  |
| connections_waiting_high_filter_override   | ""       | No       |                                  |
| connections_waiting_high_alerting_enabled  | True     | No       |                                  |
| connections_waiting_high_no_data_timeframe | None     | No       |                                  |
| connections_waiting_high_notify_no_data    | False    | No       |                                  |
| connections_waiting_high_ok_threshold      | None     | No       |                                  |
| connections_waiting_high_name_prefix       | ""       | No       |                                  |
| connections_waiting_high_name_suffix       | ""       | No       |                                  |
| connections_waiting_high_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Datadog Agent

Returns CRITICAL if Datadog is agent is not running or reporting data for %d minutes

| variable                        | default                                  | required | description                                                              |
|---------------------------------|------------------------------------------|----------|--------------------------------------------------------------------------|
| datadog_agent_enabled           | True                                     | No       |                                                                          |
| datadog_agent_critical          | 1                                        | No       |                                                                          |
| datadog_agent_evaluation_period | last(2)                                  | No       |                                                                          |
| datadog_agent_priority          | 2                                        | No       |                                                                          |
| datadog_agent_note              | ""                                       | No       |                                                                          |
| datadog_agent_docs              | Returns CRITICAL if Datadog is agent is not running or reporting data for %d minutes | No       |                                                                          |
| datadog_agent_filter_override   | ""                                       | No       |                                                                          |
| datadog_agent_alerting_enabled  | True                                     | No       |                                                                          |
| datadog_agent_no_data_timeframe | 2                                        | No       | Timeframe in minutes after which we send alerts if a host is unavailable |


## Db Connectivity

Query:
```terraform
avg(last_10m):avg:network.tcp.can_connect{tag:xxx} by {host,cluster_name} <= 0.5
```

| variable                          | default  | required | description                      |
|-----------------------------------|----------|----------|----------------------------------|
| db_connectivity_enabled           | True     | No       |                                  |
| db_connectivity_warning           | None     | No       |                                  |
| db_connectivity_critical          | 0.5      | No       |                                  |
| db_connectivity_evaluation_period | last_10m | No       |                                  |
| db_connectivity_note              | ""       | No       |                                  |
| db_connectivity_docs              | ""       | No       |                                  |
| db_connectivity_filter_override   | ""       | No       |                                  |
| db_connectivity_alerting_enabled  | True     | No       |                                  |
| db_connectivity_no_data_timeframe | None     | No       |                                  |
| db_connectivity_notify_no_data    | False    | No       |                                  |
| db_connectivity_ok_threshold      | None     | No       |                                  |
| db_connectivity_name_prefix       | ""       | No       |                                  |
| db_connectivity_name_suffix       | ""       | No       |                                  |
| db_connectivity_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Disk Space

Query:
```terraform
avg(${var.disk_free_percent_evaluation_period}):100 * min:system.disk.free{${local.disk_free_percent_filter}} by {host,device} / min:system.disk.total{${local.disk_free_percent_filter}} by {host,device} < ${var.disk_free_percent_critical}
```

| variable                            | default  | required | description                      |
|-------------------------------------|----------|----------|----------------------------------|
| disk_free_percent_enabled           | True     | No       |                                  |
| disk_free_percent_warning           | 20       | No       |                                  |
| disk_free_percent_critical          | 15       | No       |                                  |
| disk_free_percent_evaluation_period | last_15m | No       |                                  |
| disk_free_percent_note              | ""       | No       |                                  |
| disk_free_percent_docs              | ""       | No       |                                  |
| disk_free_percent_filter_override   | ""       | No       |                                  |
| disk_free_percent_alerting_enabled  | True     | No       |                                  |
| disk_free_percent_no_data_timeframe | None     | No       |                                  |
| disk_free_percent_notify_no_data    | False    | No       |                                  |
| disk_free_percent_ok_threshold      | None     | No       |                                  |
| disk_free_percent_name_prefix       | ""       | No       |                                  |
| disk_free_percent_name_suffix       | ""       | No       |                                  |
| disk_free_percent_priority          | 2        | No       | Number from 1 (high) to 5 (low). |


## Dns Response Time Google

Query:
```terraform
avg(last_5m):avg:dns.response_time{tag:xxx} by {host,cluster_name} > 2
```

| variable                                   | default  | required | description                      |
|--------------------------------------------|----------|----------|----------------------------------|
| dns_response_time_google_enabled           | True     | No       |                                  |
| dns_response_time_google_warning           | 1.5      | No       |                                  |
| dns_response_time_google_critical          | 2        | No       |                                  |
| dns_response_time_google_evaluation_period | last_5m  | No       |                                  |
| dns_response_time_google_note              | ""       | No       |                                  |
| dns_response_time_google_docs              | ""       | No       |                                  |
| dns_response_time_google_filter_override   | ""       | No       |                                  |
| dns_response_time_google_alerting_enabled  | True     | No       |                                  |
| dns_response_time_google_no_data_timeframe | None     | No       |                                  |
| dns_response_time_google_notify_no_data    | False    | No       |                                  |
| dns_response_time_google_ok_threshold      | None     | No       |                                  |
| dns_response_time_google_name_prefix       | ""       | No       |                                  |
| dns_response_time_google_name_suffix       | ""       | No       |                                  |
| dns_response_time_google_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Dns Response Time

Query:
```terraform
avg(last_5m):avg:dns.response_time{tag:xxx} by {host} > 1
```

| variable                            | default  | required | description                      |
|-------------------------------------|----------|----------|----------------------------------|
| dns_response_time_enabled           | True     | No       |                                  |
| dns_response_time_warning           | 0.75     | No       |                                  |
| dns_response_time_critical          | 1        | No       |                                  |
| dns_response_time_evaluation_period | last_5m  | No       |                                  |
| dns_response_time_note              | ""       | No       |                                  |
| dns_response_time_docs              | ""       | No       |                                  |
| dns_response_time_filter_override   | ""       | No       |                                  |
| dns_response_time_alerting_enabled  | True     | No       |                                  |
| dns_response_time_no_data_timeframe | None     | No       |                                  |
| dns_response_time_notify_no_data    | False    | No       |                                  |
| dns_response_time_ok_threshold      | None     | No       |                                  |
| dns_response_time_name_prefix       | ""       | No       |                                  |
| dns_response_time_name_suffix       | ""       | No       |                                  |
| dns_response_time_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Error Response Percentage

Query:
```terraform
sum(last_30m):${local.error_count} * 100 / (${local.success_count} + ${local.error_count} + ${var.error_response_percentage_offset}) > 3
```

| variable                                    | default  | required | description                                                                                          |
|---------------------------------------------|----------|----------|------------------------------------------------------------------------------------------------------|
| error_response_percentage_offset            | 100      | No       | An off set to make sure if only a single requests gets in we don't immediately compute error rate to 100%. The formula is: error_count * 100 / (error_count + success_count + offset) |
| error_response_percentage_enabled           | True     | No       |                                                                                                      |
| error_response_percentage_warning           | 2        | No       |                                                                                                      |
| error_response_percentage_critical          | 3        | No       |                                                                                                      |
| error_response_percentage_evaluation_period | last_30m | No       |                                                                                                      |
| error_response_percentage_note              | ""       | No       |                                                                                                      |
| error_response_percentage_docs              | ""       | No       |                                                                                                      |
| error_response_percentage_filter_override   | ""       | No       |                                                                                                      |
| error_response_percentage_alerting_enabled  | True     | No       |                                                                                                      |
| error_response_percentage_no_data_timeframe | None     | No       |                                                                                                      |
| error_response_percentage_notify_no_data    | False    | No       |                                                                                                      |
| error_response_percentage_ok_threshold      | None     | No       |                                                                                                      |
| error_response_percentage_name_prefix       | ""       | No       |                                                                                                      |
| error_response_percentage_name_suffix       | ""       | No       |                                                                                                      |
| error_response_percentage_priority          | 3        | No       | Number from 1 (high) to 5 (low).                                                                     |


## Integration

Returns CRITICAL if Datadog is unable to connect to the monitored Kong instance(s). Returns OK otherwise.

| variable                          | default                                  | required | description  |
|-----------------------------------|------------------------------------------|----------|--------------|
| integration_enabled               | True                                     | No       |              |
| integration_critical              | 1                                        | No       |              |
| integration_evaluation_period     | last(2)                                  | No       |              |
| integration_priority              | 2                                        | No       |              |
| integration_note                  | ""                                       | No       |              |
| integration_docs                  | Returns CRITICAL if Datadog is unable to connect to the monitored Kong instance(s). Returns OK otherwise. | No       |              |
| integration_include_tags_override | None                                     | No       |              |
| integration_exclude_tags_override | None                                     | No       |              |
| integration_alerting_enabled      | True                                     | No       |              |


## Ntp Drift

Query:
```terraform
avg(last_15m):abs(avg:ntp.offset{tag:xxx} by {host,cluster_name}) > 30
```

| variable                    | default  | required | description                      |
|-----------------------------|----------|----------|----------------------------------|
| ntp_drift_enabled           | True     | No       |                                  |
| ntp_drift_warning           | 20       | No       |                                  |
| ntp_drift_critical          | 30       | No       |                                  |
| ntp_drift_evaluation_period | last_15m | No       |                                  |
| ntp_drift_note              | ""       | No       |                                  |
| ntp_drift_docs              | ""       | No       |                                  |
| ntp_drift_filter_override   | ""       | No       |                                  |
| ntp_drift_alerting_enabled  | True     | No       |                                  |
| ntp_drift_no_data_timeframe | None     | No       |                                  |
| ntp_drift_notify_no_data    | False    | No       |                                  |
| ntp_drift_ok_threshold      | None     | No       |                                  |
| ntp_drift_name_prefix       | ""       | No       |                                  |
| ntp_drift_name_suffix       | ""       | No       |                                  |
| ntp_drift_priority          | 2        | No       | Number from 1 (high) to 5 (low). |


## Swap Percent Free

Query:
```terraform
avg(last_5m):min:system.swap.pct_free{tag:xxx} by {host,cluster_name} * 100 < 10
```

| variable                            | default  | required | description                      |
|-------------------------------------|----------|----------|----------------------------------|
| swap_percent_free_enabled           | True     | No       |                                  |
| swap_percent_free_warning           | 25       | No       |                                  |
| swap_percent_free_critical          | 10       | No       |                                  |
| swap_percent_free_evaluation_period | last_5m  | No       |                                  |
| swap_percent_free_note              | ""       | No       |                                  |
| swap_percent_free_docs              | ""       | No       |                                  |
| swap_percent_free_filter_override   | ""       | No       |                                  |
| swap_percent_free_alerting_enabled  | True     | No       |                                  |
| swap_percent_free_no_data_timeframe | None     | No       |                                  |
| swap_percent_free_notify_no_data    | False    | No       |                                  |
| swap_percent_free_ok_threshold      | None     | No       |                                  |
| swap_percent_free_name_prefix       | ""       | No       |                                  |
| swap_percent_free_name_suffix       | ""       | No       |                                  |
| swap_percent_free_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## System Entropy

Entropy is the randomness collected by an operating system or application for use in cryptography or other uses that require random data. This randomness is often collected from hardware sources (variance in fan noise or HDD), either pre-existing ones such as mouse movements or specially provided randomness generators. A lack of entropy can have a negative impact on performance and security.

Query:
```terraform
avg(last_15m):min:system.entropy.available{tag:xxx} by {host,cluster_name} < 250
```

| variable                         | default                                  | required | description                      |
|----------------------------------|------------------------------------------|----------|----------------------------------|
| system_entropy_enabled           | True                                     | No       |                                  |
| system_entropy_warning           | 500                                      | No       |                                  |
| system_entropy_critical          | 250                                      | No       |                                  |
| system_entropy_evaluation_period | last_15m                                 | No       |                                  |
| system_entropy_note              | ""                                       | No       |                                  |
| system_entropy_docs              | Entropy is the randomness collected by an operating system or application for use in cryptography or other uses that require random data. This randomness is often collected from hardware sources (variance in fan noise or HDD), either pre-existing ones such as mouse movements or specially provided randomness generators. A lack of entropy can have a negative impact on performance and security. | No       |                                  |
| system_entropy_filter_override   | ""                                       | No       |                                  |
| system_entropy_alerting_enabled  | True                                     | No       |                                  |
| system_entropy_no_data_timeframe | None                                     | No       |                                  |
| system_entropy_notify_no_data    | False                                    | No       |                                  |
| system_entropy_ok_threshold      | None                                     | No       |                                  |
| system_entropy_name_prefix       | ""                                       | No       |                                  |
| system_entropy_name_suffix       | ""                                       | No       |                                  |
| system_entropy_priority          | 3                                        | No       | Number from 1 (high) to 5 (low). |


## Module Variables

| variable                            | default  | required | description                                                             |
|-------------------------------------|----------|----------|-------------------------------------------------------------------------|
| filter_str                          |          | Yes      |                                                                         |
| env                                 |          | Yes      |                                                                         |
| service                             | Kong     | No       |                                                                         |
| notification_channel                |          | Yes      |                                                                         |
| additional_tags                     | []       | No       |                                                                         |
| locked                              | False    | No       |                                                                         |
| name_prefix                         | ""       | No       |                                                                         |
| name_suffix                         | ""       | No       |                                                                         |
| service_check_include_tags          |          | Yes      | Tags to be included in the \"over\" section of a service check query    |
| service_check_exclude_tags          | []       | No       | Tags to be included in the \"exclude\" section of a service check query |
| docker_container_monitoring_enabled |          | Yes      |                                                                         |
| docker_filter_str                   | None     | No       |                                                                         |
| runs_in_k8s                         |          | Yes      | Determines whether or not we also do group by on cluster_name           |
| priority_offset                     | 0        | No       | For non production workloads we can +1 on the priorities                |


