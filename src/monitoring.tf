
locals {
  threshold_backlog_bytes = var.monitoring_configuration.backlog_bytes_above

  metrics = {
    "backlog_bytes" = {
      metric   = "pubsub.googleapis.com/subscription/backlog_bytes"
      resource = "pubsub_subscription"
    }
  }
}

module "topic_bytes_alarm" {
  count                          = var.monitoring_configuration.enabled ? 1 : 0
  source                         = "github.com/massdriver-cloud/terraform-modules//google-monitoring-utilization-threshold?ref=9201b9f"
  md_metadata                    = var.md_metadata
  message                        = "PubSub Subscription ${var.md_metadata.name_prefix} is above backlogBytes threshold of ${local.threshold_backlog_bytes}"
  alarm_notification_channel_grn = var.md_metadata.observability.alarm_channels.gcp.id
  alarm_name                     = "${google_pubsub_subscription.main.id}-backlogBytes"
  metric_type                    = local.metrics["backlog_bytes"].metric
  resource_type                  = local.metrics["backlog_bytes"].resource
  threshold                      = local.threshold_backlog_bytes
  period                         = 60
  duration                       = 60
}
