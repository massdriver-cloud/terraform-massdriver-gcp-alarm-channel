locals {
  # Organizations with custom default tags always have `md-instance`. Legacy organizations
  # only have `md-package`, which carries the name_prefix. Massdriver accepts either.
  instance_label = contains(keys(var.md_metadata.default_tags), "md-instance") ? "md-instance" : "md-package"
}

resource "google_monitoring_notification_channel" "main" {
  display_name = var.md_metadata.name_prefix
  type         = "webhook_tokenauth"
  labels = {
    url = var.md_metadata.observability.alarm_webhook_url
  }
  user_labels = {
    (local.instance_label) = var.md_metadata.default_tags[local.instance_label]
  }
}
