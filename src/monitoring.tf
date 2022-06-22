
locals {
  threshold_backlog_bytes = var.monitoring_configuration.backlog_bytes_above

  metrics = {
    "backlog_bytes" = {
      metric   = "pubsub.googleapis.com/subscription/backlog_bytes"
      resource = "pubsub_subscription"
    }
  }
}
module "alarm_channel" {
  source      = "github.com/massdriver-cloud/terraform-modules//gcp-alarm-channel?ref=cafdc89"
  md_metadata = var.md_metadata
}

module "topic_bytes_alarm" {
  source                  = "github.com/massdriver-cloud/terraform-modules//gcp-monitoring-utilization-threshold?ref=8997456"
  notification_channel_id = module.alarm_channel.id
  md_metadata             = var.md_metadata
  display_name            = "Message Backlog"
  message                 = "PubSub Subscription ${var.md_metadata.name_prefix} is above backlogBytes threshold of ${local.threshold_backlog_bytes}"
  alarm_name              = "${google_pubsub_subscription.main.id}-backlogBytes"
  metric_type             = local.metrics["backlog_bytes"].metric
  resource_type           = local.metrics["backlog_bytes"].resource
  threshold               = local.threshold_backlog_bytes
  period                  = 60
  duration                = 60
}
