## Google Cloud Pub/Sub Subscription

Google Cloud Pub/Sub is a messaging service that allows you to send and receive messages between independent applications. This decoupling of sender and receiver applications enables more scalable and flexible system designs.

### Design Decisions

1. **Resource Naming**: The subscription resource name includes a prefix to ensure unique identification.
2. **Message Retention**: The message retention duration is configurable and defaults to retaining acknowledged messages for operational flexibility.
3. **Ack Deadline**: The acknowledgment deadline can be set based on your service requirements.
4. **Expiration Policy**: Explicitly setting the TTL to blank ensures the subscription does not expire due to inactivity.
5. **Retry Policy**: Configurable retry policy to handle message processing failures.
6. **Monitoring and Alarms**: Integrates a monitoring threshold for backlog bytes, triggering alarms when thresholds are breached.

### Runbook

#### Subscription Expiring Unexpectedly

You may experience your subscription expiring, causing it to be deleted.

Check the expiration policy settings:

```sh
gcloud pubsub subscriptions describe SUBSCRIPTION_NAME --format="value(expirationPolicy)"
```

This should return an empty TTL if set correctly.

#### Messages Not Being Received

If your subscription is not receiving messages, it might be an issue with permissions or topic configuration.

Check for permissions issues:

```sh
gcloud projects get-iam-policy YOUR_PROJECT_ID
```

Ensure that the `roles/pubsub.subscriber` role is correctly assigned to your service account.

Validate subscription configuration:

```sh
gcloud pubsub subscriptions describe SUBSCRIPTION_NAME
```

Examine the output for any misconfigurations in fields such as `topic` or `ackDeadlineSeconds`.

#### High Message Backlog

A high message backlog might indicate your subscribers are not processing messages quickly enough.

Check subscription metrics for backlog bytes:

```sh
gcloud pubsub subscriptions describe SUBSCRIPTION_NAME --format="value(backlogBytes)"
```

Review your subscribers' performance and consider scaling them up if necessary.

Check stackdriver metrics:

```sh
gcloud monitoring metrics list --filter="pubsub_subscription"
```

### Redis ACL Issues

Redis ACL (Access Control List) anomalies can prevent successful connections and operations.

Verify ACL configurations:

```sh
redis-cli ACL LIST
```

Check for specific user permissions:

```sh
redis-cli ACL GETUSER USERNAME
```

#### Common Redis Commands

If there are latency or performance issues, further Redis inspection might be necessary.

Check Redis latency:

```sh
redis-cli --latency
```

Review slow logs:

```sh
redis-cli SLOWLOG GET
```

These logs can provide insights into slow operations causing delays in message processing.

For Redis internal keyspace information:

```sh
redis-cli INFO keyspace
```

Examine the keyspace statistics to ensure no unexpected growth in managed memory or keys.

