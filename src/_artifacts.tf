locals {
  data_infrastructure = {
    grn = google_pubsub_subscription.main.id
  }

  data_security = {
  }

  specs_subscription = {
    distribution = "pubsub"
  }

  artifact_subscription = {
    data = {
      infrastructure = local.data_infrastructure
      security       = local.data_security
    }
    specs = {
      subscription = local.specs_subscription
    }
  }
}

resource "massdriver_artifact" "subscription" {
  field                = "subscription"
  provider_resource_id = google_pubsub_subscription.main.id
  type                 = "gcp-pubsub-subscription"
  name                 = "GCP PubSub Subscription ${var.md_metadata.name_prefix} (${google_pubsub_subscription.main.id})"
  artifact             = jsonencode(local.artifact_subscription)
}
