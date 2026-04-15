resource "google_monitoring_notification_channel" "main" {
  display_name = var.md_metadata.name_prefix
  type         = "webhook_tokenauth"
  labels = {
    url = var.md_metadata.observability.alarm_webhook_url
  }
  user_labels = {
    md-package = var.md_metadata.name_prefix
  }
}
