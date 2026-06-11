locals {
  infrastructure = {
    grn = google_pubsub_subscription.main.id
  }

  security = {
    iam = {
      subscriber = {
        role = "roles/pubsub.subscriber"
        # intentionally left blank, using a condition here causes issues
        condition = ""
      }
    }
  }

  specs_subscription = {
    distribution = "pubsub"
  }

  artifact_subscription = {
    infrastructure = local.infrastructure
    security       = local.security
    specs = {
      subscription = local.specs_subscription
    }
  }
}

resource "massdriver_artifact" "subscription" {
  field    = "subscription"
  name     = "GCP PubSub Subscription ${var.md_metadata.name_prefix}"
  artifact = jsonencode(local.artifact_subscription)
}
