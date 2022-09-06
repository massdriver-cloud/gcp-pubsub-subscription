[![Massdriver][logo]][website]

# gcp-pubsub-subscription

[![Release][release_shield]][release_url]
[![Contributors][contributors_shield]][contributors_url]
[![Forks][forks_shield]][forks_url]
[![Stargazers][stars_shield]][stars_url]
[![Issues][issues_shield]][issues_url]
[![MIT License][license_shield]][license_url]


GCP subscription to a PubSub Topic


---

## Design

For detailed information, check out our [Operator Guide](operator.mdx) for this bundle.

## Usage

Our bundles aren't intended to be used locally, outside of testing. Instead, our bundles are designed to be configured, connected, deployed and monitored in the [Massdriver][website] platform.

### What are Bundles?

Bundles are the basic building blocks of infrastructure, applications, and architectures in [Massdriver][website]. Read more [here](https://docs.massdriver.cloud/concepts/bundles).

## Bundle


<!-- COMPLIANCE:START -->

Security and compliance scanning of our bundles is performed using [Bridgecrew](https://www.bridgecrew.cloud/). Massdriver also offers security and compliance scanning of operational infrastructure configured and deployed using the platform.

| Benchmark | Description |
|--------|---------------|
| [![Infrastructure Security](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/gcp-pubsub-subscription/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Fgcp-pubsub-subscription&benchmark=INFRASTRUCTURE+SECURITY) | Infrastructure Security Compliance |
| [![CIS GCP](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/gcp-pubsub-subscription/cis_gcp)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Fgcp-pubsub-subscription&benchmark=CIS+GCP+V1.1) | Center for Internet Security, GCP Compliance |
| [![PCI-DSS](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/gcp-pubsub-subscription/pci)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Fgcp-pubsub-subscription&benchmark=PCI-DSS+V3.2) | Payment Card Industry Data Security Standards Compliance |
| [![NIST-800-53](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/gcp-pubsub-subscription/nist)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Fgcp-pubsub-subscription&benchmark=NIST-800-53) | National Institute of Standards and Technology Compliance |
| [![ISO27001](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/gcp-pubsub-subscription/iso)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Fgcp-pubsub-subscription&benchmark=ISO27001) | Information Security Management System, ISO/IEC 27001 Compliance |
| [![SOC2](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/gcp-pubsub-subscription/soc2)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Fgcp-pubsub-subscription&benchmark=SOC2)| Service Organization Control 2 Compliance |
| [![HIPAA](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/gcp-pubsub-subscription/hipaa)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Fgcp-pubsub-subscription&benchmark=HIPAA) | Health Insurance Portability and Accountability Compliance |

<!-- COMPLIANCE:END -->

### Params

Form input parameters for configuring a bundle for deployment.

<details>
<summary>View</summary>

<!-- PARAMS:START -->
## Properties

- **`ack_deadline_seconds`** *(integer)*: This value is the maximum time after a subscriber receives a message before the subscriber should acknowledge the message. Minimum: `10`. Maximum: `600`. Default: `20`.
- **`enable_message_ordering`** *(boolean)*: Ensures that messages are delivered in the same order they are received. Default: `False`.
- **`message_retention_duration_seconds`** *(integer)*: How long to retain unacknowledged messages in the subscription's backlog, from the moment a message is published. Minimum: `600`. Maximum: `604800`. Default: `600`.
- **`minimum_backoff_seconds`** *(integer)*: The minimum delay between consecutive deliveries of a given message. Value should be between 0 and 600 seconds. Minimum: `0`. Maximum: `600`. Default: `10`.
- **`monitoring_configuration`** *(object)*: Enable and configure monitoring for your PubSub subscription.
  - **`backlog_bytes_above`** *(integer)*: Minimum: `0`. Maximum: `1000000`. Default: `1000`.
- **`retain_acked_messages`** *(boolean)*: Indicates whether to retain acknowledged messages. If true, then messages are not expunged from the subscription's backlog, even if they are acknowledged, until they fall out of the messageRetentionDuration window. Default: `False`.
## Examples

  ```json
  {
      "__name": "Development",
      "ack_deadline_seconds": 10,
      "enable_message_ordering": false
  }
  ```

  ```json
  {
      "__name": "Production",
      "ack_deadline_seconds": 30,
      "enable_message_ordering": true,
      "message_retention_duration_seconds": 800,
      "monitoring_configuration": {
          "enabled": true
      }
  }
  ```

<!-- PARAMS:END -->

</details>

### Connections

Connections from other bundles that this bundle depends on.

<details>
<summary>View</summary>

<!-- CONNECTIONS:START -->
## Properties

- **`gcp_authentication`** *(object)*: GCP Service Account. Cannot contain additional properties.
  - **`data`** *(object)*
    - **`auth_provider_x509_cert_url`** *(string)*: Auth Provider x509 Certificate URL. Default: `https://www.googleapis.com/oauth2/v1/certs`.

      Examples:
      ```json
      "https://example.com/some/path"
      ```

      ```json
      "https://massdriver.cloud"
      ```

    - **`auth_uri`** *(string)*: Auth URI. Default: `https://accounts.google.com/o/oauth2/auth`.

      Examples:
      ```json
      "https://example.com/some/path"
      ```

      ```json
      "https://massdriver.cloud"
      ```

    - **`client_email`** *(string)*: Service Account Email.

      Examples:
      ```json
      "jimmy@massdriver.cloud"
      ```

      ```json
      "service-account-y@gmail.com"
      ```

    - **`client_id`** *(string)*: .
    - **`client_x509_cert_url`** *(string)*: Client x509 Certificate URL.

      Examples:
      ```json
      "https://example.com/some/path"
      ```

      ```json
      "https://massdriver.cloud"
      ```

    - **`private_key`** *(string)*: .
    - **`private_key_id`** *(string)*: .
    - **`project_id`** *(string)*: .
    - **`token_uri`** *(string)*: Token URI. Default: `https://oauth2.googleapis.com/token`.

      Examples:
      ```json
      "https://example.com/some/path"
      ```

      ```json
      "https://massdriver.cloud"
      ```

    - **`type`** *(string)*: . Default: `service_account`.
  - **`specs`** *(object)*
    - **`gcp`** *(object)*: .
      - **`project`** *(string)*
      - **`region`** *(string)*: GCP region. Must be one of: `['us-east1', 'us-east4', 'us-west1', 'us-west2', 'us-west3', 'us-west4', 'us-central1']`.

        Examples:
        ```json
        "us-west2"
        ```

      - **`resource`** *(string)*
      - **`service`** *(string)*
      - **`zone`** *(string)*: GCP Zone.

        Examples:
- **`subnetwork`** *(object)*: A region-bound network for deploying GCP resources. Cannot contain additional properties.
  - **`data`** *(object)*
    - **`infrastructure`** *(object)*
      - **`cidr`** *(string)*

        Examples:
        ```json
        "10.100.0.0/16"
        ```

        ```json
        "192.24.12.0/22"
        ```

      - **`gcp_global_network_grn`** *(string)*: GCP Resource Name (GRN).

        Examples:
        ```json
        "projects/my-project/global/networks/my-global-network"
        ```

        ```json
        "projects/my-project/regions/us-west2/subnetworks/my-subnetwork"
        ```

        ```json
        "projects/my-project/topics/my-pubsub-topic"
        ```

        ```json
        "projects/my-project/subscriptions/my-pubsub-subscription"
        ```

        ```json
        "projects/my-project/locations/us-west2/instances/my-redis-instance"
        ```

        ```json
        "projects/my-project/locations/us-west2/clusters/my-gke-cluster"
        ```

      - **`grn`** *(string)*: GCP Resource Name (GRN).

        Examples:
        ```json
        "projects/my-project/global/networks/my-global-network"
        ```

        ```json
        "projects/my-project/regions/us-west2/subnetworks/my-subnetwork"
        ```

        ```json
        "projects/my-project/topics/my-pubsub-topic"
        ```

        ```json
        "projects/my-project/subscriptions/my-pubsub-subscription"
        ```

        ```json
        "projects/my-project/locations/us-west2/instances/my-redis-instance"
        ```

        ```json
        "projects/my-project/locations/us-west2/clusters/my-gke-cluster"
        ```

  - **`specs`** *(object)*
    - **`gcp`** *(object)*: .
      - **`project`** *(string)*
      - **`region`** *(string)*: GCP region. Must be one of: `['us-east1', 'us-east4', 'us-west1', 'us-west2', 'us-west3', 'us-west4', 'us-central1']`.

        Examples:
        ```json
        "us-west2"
        ```

      - **`resource`** *(string)*
      - **`service`** *(string)*
      - **`zone`** *(string)*: GCP Zone.

        Examples:
- **`topic`** *(object)*: GCP PubSub Topic. Cannot contain additional properties.
  - **`data`** *(object)*: Cannot contain additional properties.
    - **`infrastructure`** *(object)*: PubSub topic configuration. Cannot contain additional properties.
      - **`grn`** *(string)*: GCP Resource Name (GRN).

        Examples:
        ```json
        "projects/my-project/global/networks/my-global-network"
        ```

        ```json
        "projects/my-project/regions/us-west2/subnetworks/my-subnetwork"
        ```

        ```json
        "projects/my-project/topics/my-pubsub-topic"
        ```

        ```json
        "projects/my-project/subscriptions/my-pubsub-subscription"
        ```

        ```json
        "projects/my-project/locations/us-west2/instances/my-redis-instance"
        ```

        ```json
        "projects/my-project/locations/us-west2/clusters/my-gke-cluster"
        ```

    - **`security`** *(object)*: GCP Security Configuration. Cannot contain additional properties.
      - **`iam`** *(object)*: IAM Roles And Conditions. Cannot contain additional properties.
        - **`^[a-z-/]+$`** *(object)*
          - **`condition`** *(string)*: GCP IAM Condition.
          - **`role`**: GCP Role.

            Examples:
            ```json
            "roles/owner"
            ```

            ```json
            "roles/redis.editor"
            ```

            ```json
            "roles/storage.objectCreator"
            ```

            ```json
            "roles/storage.legacyObjectReader"
            ```

  - **`specs`** *(object)*
    - **`topic`** *(object)*: . Cannot contain additional properties.
      - **`distribution`** *(string)*: Must be one of: `['pubsub']`.
<!-- CONNECTIONS:END -->

</details>

### Artifacts

Resources created by this bundle that can be connected to other bundles.

<details>
<summary>View</summary>

<!-- ARTIFACTS:START -->
## Properties

- **`subscription`** *(object)*: GCP PubSub Subscription. Cannot contain additional properties.
  - **`data`** *(object)*: Cannot contain additional properties.
    - **`infrastructure`** *(object)*: PubSub subscription configuration. Cannot contain additional properties.
      - **`grn`** *(string)*: GCP Resource Name (GRN).

        Examples:
        ```json
        "projects/my-project/global/networks/my-global-network"
        ```

        ```json
        "projects/my-project/regions/us-west2/subnetworks/my-subnetwork"
        ```

        ```json
        "projects/my-project/topics/my-pubsub-topic"
        ```

        ```json
        "projects/my-project/subscriptions/my-pubsub-subscription"
        ```

        ```json
        "projects/my-project/locations/us-west2/instances/my-redis-instance"
        ```

        ```json
        "projects/my-project/locations/us-west2/clusters/my-gke-cluster"
        ```

    - **`security`** *(object)*: GCP Security Configuration. Cannot contain additional properties.
      - **`iam`** *(object)*: IAM Roles And Conditions. Cannot contain additional properties.
        - **`^[a-z-/]+$`** *(object)*
          - **`condition`** *(string)*: GCP IAM Condition.
          - **`role`**: GCP Role.

            Examples:
            ```json
            "roles/owner"
            ```

            ```json
            "roles/redis.editor"
            ```

            ```json
            "roles/storage.objectCreator"
            ```

            ```json
            "roles/storage.legacyObjectReader"
            ```

  - **`specs`** *(object)*
    - **`subscription`** *(object)*: . Cannot contain additional properties.
      - **`distribution`** *(string)*: Must be one of: `['pubsub']`.
<!-- ARTIFACTS:END -->

</details>

## Contributing

<!-- CONTRIBUTING:START -->

### Bug Reports & Feature Requests

Did we miss something? Please [submit an issue](https://github.com/massdriver-cloud/gcp-pubsub-subscription/issues) to report any bugs or request additional features.

### Developing

**Note**: Massdriver bundles are intended to be tightly use-case scoped, intention-based, reusable pieces of IaC for use in the [Massdriver][website] platform. For this reason, major feature additions that broaden the scope of an existing bundle are likely to be rejected by the community.

Still want to get involved? First check out our [contribution guidelines](https://docs.massdriver.cloud/bundles/contributing).

### Fix or Fork

If your use-case isn't covered by this bundle, you can still get involved! Massdriver is designed to be an extensible platform. Fork this bundle, or [create your own bundle from scratch](https://docs.massdriver.cloud/bundles/development)!

<!-- CONTRIBUTING:END -->

## Connect

<!-- CONNECT:START -->

Questions? Concerns? Adulations? We'd love to hear from you!

Please connect with us!

[![Email][email_shield]][email_url]
[![GitHub][github_shield]][github_url]
[![LinkedIn][linkedin_shield]][linkedin_url]
[![Twitter][twitter_shield]][twitter_url]
[![YouTube][youtube_shield]][youtube_url]
[![Reddit][reddit_shield]][reddit_url]

<!-- markdownlint-disable -->

[logo]: https://raw.githubusercontent.com/massdriver-cloud/docs/main/static/img/logo-with-logotype-horizontal-400x110.svg
[docs]: https://docs.massdriver.cloud/?utm_source=github&utm_medium=readme&utm_campaign=gcp-pubsub-subscription&utm_content=docs
[website]: https://www.massdriver.cloud/?utm_source=github&utm_medium=readme&utm_campaign=gcp-pubsub-subscription&utm_content=website
[github]: https://github.com/massdriver-cloud?utm_source=github&utm_medium=readme&utm_campaign=gcp-pubsub-subscription&utm_content=github
[slack]: https://massdriverworkspace.slack.com/?utm_source=github&utm_medium=readme&utm_campaign=gcp-pubsub-subscription&utm_content=slack
[linkedin]: https://www.linkedin.com/company/massdriver/?utm_source=github&utm_medium=readme&utm_campaign=gcp-pubsub-subscription&utm_content=linkedin



[contributors_shield]: https://img.shields.io/github/contributors/massdriver-cloud/gcp-pubsub-subscription.svg?style=for-the-badge
[contributors_url]: https://github.com/massdriver-cloud/gcp-pubsub-subscription/graphs/contributors
[forks_shield]: https://img.shields.io/github/forks/massdriver-cloud/gcp-pubsub-subscription.svg?style=for-the-badge
[forks_url]: https://github.com/massdriver-cloud/gcp-pubsub-subscription/network/members
[stars_shield]: https://img.shields.io/github/stars/massdriver-cloud/gcp-pubsub-subscription.svg?style=for-the-badge
[stars_url]: https://github.com/massdriver-cloud/gcp-pubsub-subscription/stargazers
[issues_shield]: https://img.shields.io/github/issues/massdriver-cloud/gcp-pubsub-subscription.svg?style=for-the-badge
[issues_url]: https://github.com/massdriver-cloud/gcp-pubsub-subscription/issues
[release_url]: https://github.com/massdriver-cloud/gcp-pubsub-subscription/releases/latest
[release_shield]: https://img.shields.io/github/release/massdriver-cloud/gcp-pubsub-subscription.svg?style=for-the-badge
[license_shield]: https://img.shields.io/github/license/massdriver-cloud/gcp-pubsub-subscription.svg?style=for-the-badge
[license_url]: https://github.com/massdriver-cloud/gcp-pubsub-subscription/blob/main/LICENSE


[email_url]: mailto:support@massdriver.cloud
[email_shield]: https://img.shields.io/badge/email-Massdriver-black.svg?style=for-the-badge&logo=mail.ru&color=000000
[github_url]: mailto:support@massdriver.cloud
[github_shield]: https://img.shields.io/badge/follow-Github-black.svg?style=for-the-badge&logo=github&color=181717
[linkedin_url]: https://linkedin.com/in/massdriver-cloud
[linkedin_shield]: https://img.shields.io/badge/follow-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&color=0A66C2
[twitter_url]: https://twitter.com/massdriver?utm_source=github&utm_medium=readme&utm_campaign=gcp-pubsub-subscription&utm_content=twitter
[twitter_shield]: https://img.shields.io/badge/follow-Twitter-black.svg?style=for-the-badge&logo=twitter&color=1DA1F2
[discourse_url]: https://community.massdriver.cloud?utm_source=github&utm_medium=readme&utm_campaign=gcp-pubsub-subscription&utm_content=discourse
[discourse_shield]: https://img.shields.io/badge/join-Discourse-black.svg?style=for-the-badge&logo=discourse&color=000000
[youtube_url]: https://www.youtube.com/channel/UCfj8P7MJcdlem2DJpvymtaQ
[youtube_shield]: https://img.shields.io/badge/subscribe-Youtube-black.svg?style=for-the-badge&logo=youtube&color=FF0000
[reddit_url]: https://www.reddit.com/r/massdriver
[reddit_shield]: https://img.shields.io/badge/subscribe-Reddit-black.svg?style=for-the-badge&logo=reddit&color=FF4500

<!-- markdownlint-restore -->

<!-- CONNECT:END -->
