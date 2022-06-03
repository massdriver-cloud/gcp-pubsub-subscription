resource "google_pubsub_subscription" "main" {
  name                       = var.md_metadata.name_prefix
  topic                      = var.topic.data.infrastructure.grn
  labels                     = var.md_metadata.default_tags
  message_retention_duration = "${var.message_retention_duration_seconds}s"
  retain_acked_messages      = var.retain_acked_messages
  ack_deadline_seconds       = var.ack_deadline_seconds

  # https://cloud.google.com/pubsub/docs/subscriber#lifecycle
  # this is set to blank explicity! otherwise the subscription
  # will expire without activity (and be deleted)
  expiration_policy {
    ttl = ""
  }
  retry_policy {
    minimum_backoff = "${var.minimum_backoff_seconds}s"
  }

  enable_message_ordering = var.enable_message_ordering
}
