resource "google_monitoring_notification_channel" "main" {
  display_name = var.md_metadata.name_prefix
  type         = "webhook_tokenauth"
  labels = {
    url = var.md_metadata.observability.alarm_webhook_url
  }
  # Legacy default tags have no md-instance, only md-package (the name_prefix).
  user_labels = try({ "md-instance" = var.md_metadata.default_tags["md-instance"] }, { "md-package" = var.md_metadata.default_tags["md-package"] })
}
