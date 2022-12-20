locals {
  data_infrastructure = {
    grn = google_pubsub_subscription.main.id
  }

  data_security = {
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
  name                 = var.md_metadata.name_prefix
  artifact             = jsonencode(local.artifact_subscription)
}
