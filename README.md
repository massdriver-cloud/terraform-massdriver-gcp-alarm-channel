# GCP Alarm Channel Terraform module

Terraform module that creates a GCP Monitoring Notification Channel for forwarding Google Cloud Monitoring alarm events to [Massdriver](https://www.massdriver.cloud/).

This module is designed to be used alongside [`terraform-massdriver-gcp-metric-alarm`](https://github.com/massdriver-cloud/terraform-massdriver-gcp-metric-alarm), which creates Cloud Monitoring alert policies that notify through the channel created here.

## Features

- Enables the Cloud Monitoring API automatically
- Creates a webhook-based Monitoring Notification Channel pointing at the Massdriver alarm webhook endpoint
- Outputs the notification channel ID for use with `terraform-massdriver-gcp-metric-alarm`

## Usage

```hcl
module "alarm_channel" {
  source = "massdriver-cloud/gcp-alarm-channel/massdriver"

  md_metadata = var.md_metadata
}

module "cpu_alarm" {
  source = "massdriver-cloud/gcp-metric-alarm/massdriver"

  notification_channel_id = module.alarm_channel.id
  md_metadata             = var.md_metadata
  ...
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 7.28.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_monitoring_notification_channel.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_notification_channel) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_md_metadata"></a> [md\_metadata](#input\_md\_metadata) | Massdriver package metadata object | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Alarm Channel Monitoring Notification Channel ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module is maintained by [Massdriver, Inc.](https://www.massdriver.cloud/)

## License

Apache 2 Licensed. See [LICENSE](LICENSE) for full details.
