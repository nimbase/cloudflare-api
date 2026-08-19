# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[asyncdispatch]
import unittest
import pkg/openparser/json as openjson
import cloudflare
import ./common

suite "queue serialization":
  test "round-trips MqConsumerRequest":
    let obj = newMqConsumerRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MqConsumerRequest)) == openjson.toJson(obj)

  test "round-trips MqApiV4Success":
    let obj = newMqApiV4Success()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MqApiV4Success)) == openjson.toJson(obj)

  test "round-trips MqQueueBatch":
    let obj = newMqQueueBatch()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MqQueueBatch)) == openjson.toJson(obj)

  test "round-trips MqApiV4Failure":
    let obj = newMqApiV4Failure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MqApiV4Failure)) == openjson.toJson(obj)

  test "round-trips MqQueueMetrics":
    let obj = newMqQueueMetrics()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MqQueueMetrics)) == openjson.toJson(obj)

  test "round-trips MqEventSource":
    let obj = newMqEventSource()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MqEventSource)) == openjson.toJson(obj)

  test "round-trips MqQueueMessage":
    let obj = newMqQueueMessage()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MqQueueMessage)) == openjson.toJson(obj)

  test "round-trips MqQueue":
    let obj = newMqQueue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MqQueue)) == openjson.toJson(obj)

  test "round-trips MqConsumerResponse":
    let obj = newMqConsumerResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MqConsumerResponse)) == openjson.toJson(obj)

  test "round-trips MqEventSubscription":
    let obj = newMqEventSubscription()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MqEventSubscription)) == openjson.toJson(obj)

  test "round-trips MqEventDestination":
    let obj = newMqEventDestination()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MqEventDestination)) == openjson.toJson(obj)

suite "queue endpoints":
  test "GET /accounts/{account_id}/event_subscriptions/subscriptions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEventSubscriptionsSubscriptions("test", 1, 1, {}, {})

  test "GET /accounts/{account_id}/event_subscriptions/subscriptions/{subscription_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEventSubscriptionsSubscriptionsSubscriptionId("test", "test")

  test "DELETE /accounts/{account_id}/event_subscriptions/subscriptions/{subscription_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdEventSubscriptionsSubscriptionsSubscriptionId("test", "test")

  test "GET /accounts/{account_id}/queues":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdQueues("test")

  test "GET /accounts/{account_id}/queues/{queue_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdQueuesQueueId("test", "test")

  test "PUT /accounts/{account_id}/queues/{queue_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdQueuesQueueId("test", "test", newMqQueue())

  test "DELETE /accounts/{account_id}/queues/{queue_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdQueuesQueueId("test", "test")

  test "PATCH /accounts/{account_id}/queues/{queue_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdQueuesQueueId("test", "test", newMqQueue())

  test "GET /accounts/{account_id}/queues/{queue_id}/consumers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdQueuesQueueIdConsumers("test", "test")

  test "POST /accounts/{account_id}/queues/{queue_id}/consumers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdQueuesQueueIdConsumers("test", "test", newMqConsumerRequest())

  test "GET /accounts/{account_id}/queues/{queue_id}/consumers/{consumer_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdQueuesQueueIdConsumersConsumerId("test", "test", "test")

  test "PUT /accounts/{account_id}/queues/{queue_id}/consumers/{consumer_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdQueuesQueueIdConsumersConsumerId("test", "test", "test", newMqConsumerRequest())

  test "DELETE /accounts/{account_id}/queues/{queue_id}/consumers/{consumer_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdQueuesQueueIdConsumersConsumerId("test", "test", "test")

  test "POST /accounts/{account_id}/queues/{queue_id}/messages":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdQueuesQueueIdMessages("test", "test", newMqQueueMessage())

  test "POST /accounts/{account_id}/queues/{queue_id}/messages/batch":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdQueuesQueueIdMessagesBatch("test", "test", newMqQueueBatch())

  test "GET /accounts/{account_id}/queues/{queue_id}/metrics":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdQueuesQueueIdMetrics("test", "test")

  test "GET /accounts/{account_id}/queues/{queue_id}/purge":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdQueuesQueueIdPurge("test", "test")

