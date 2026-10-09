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

suite "workers_k2_other serialization":
  test "round-trips CloudflareK2UpdateK2StreamRequest":
    let obj = newCloudflareK2UpdateK2StreamRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudflareK2UpdateK2StreamRequest)) == openjson.toJson(obj)

  test "round-trips CloudflareK2K2ProduceResponse":
    let obj = newCloudflareK2K2ProduceResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudflareK2K2ProduceResponse)) == openjson.toJson(obj)

  test "round-trips CloudflareK2K2EmptyResponse":
    let obj = newCloudflareK2K2EmptyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudflareK2K2EmptyResponse)) == openjson.toJson(obj)

  test "round-trips CloudflareK2K2BatchRequest":
    let obj = newCloudflareK2K2BatchRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudflareK2K2BatchRequest)) == openjson.toJson(obj)

  test "round-trips CloudflareK2K2SubscriptionIdResponse":
    let obj = newCloudflareK2K2SubscriptionIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudflareK2K2SubscriptionIdResponse)) == openjson.toJson(obj)

  test "round-trips CloudflareK2K2ConsumeRequest":
    let obj = newCloudflareK2K2ConsumeRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudflareK2K2ConsumeRequest)) == openjson.toJson(obj)

  test "round-trips CloudflareK2K2SubscriptionResponse":
    let obj = newCloudflareK2K2SubscriptionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudflareK2K2SubscriptionResponse)) == openjson.toJson(obj)

  test "round-trips CloudflareK2CreateK2StreamRequest":
    let obj = newCloudflareK2CreateK2StreamRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudflareK2CreateK2StreamRequest)) == openjson.toJson(obj)

  test "round-trips CloudflareK2CreateK2SubscriptionRequest":
    let obj = newCloudflareK2CreateK2SubscriptionRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudflareK2CreateK2SubscriptionRequest)) == openjson.toJson(obj)

  test "round-trips CloudflareK2K2ExtendResponse":
    let obj = newCloudflareK2K2ExtendResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudflareK2K2ExtendResponse)) == openjson.toJson(obj)

  test "round-trips CloudflareK2K2ConsumeResponse":
    let obj = newCloudflareK2K2ConsumeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudflareK2K2ConsumeResponse)) == openjson.toJson(obj)

  test "round-trips CloudflareK2K2StreamListResponse":
    let obj = newCloudflareK2K2StreamListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudflareK2K2StreamListResponse)) == openjson.toJson(obj)

  test "round-trips CloudflareK2K2MonitoredSubscriptionListResponse":
    let obj = newCloudflareK2K2MonitoredSubscriptionListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudflareK2K2MonitoredSubscriptionListResponse)) == openjson.toJson(obj)

  test "round-trips CloudflareK2K2V4Error":
    let obj = newCloudflareK2K2V4Error()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudflareK2K2V4Error)) == openjson.toJson(obj)

  test "round-trips CloudflareK2K2ProduceRequest":
    let obj = newCloudflareK2K2ProduceRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudflareK2K2ProduceRequest)) == openjson.toJson(obj)

  test "round-trips CloudflareK2K2ProduceError":
    let obj = newCloudflareK2K2ProduceError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudflareK2K2ProduceError)) == openjson.toJson(obj)

  test "round-trips CloudflareK2K2StreamResponse":
    let obj = newCloudflareK2K2StreamResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudflareK2K2StreamResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdK2StreamsStreamIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdK2StreamsStreamIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdK2StreamsStreamIdResponse)) == openjson.toJson(obj)

suite "workers_k2_other endpoints":
  test "GET /accounts/{account_id}/k2/streams":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdK2Streams("test", "test", 1, 1)

  test "POST /accounts/{account_id}/k2/streams":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdK2Streams("test", newCloudflareK2CreateK2StreamRequest())

  test "GET /accounts/{account_id}/k2/streams/{stream_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdK2StreamsStreamId("test", "test")

  test "DELETE /accounts/{account_id}/k2/streams/{stream_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdK2StreamsStreamId("test", "test")

  test "PATCH /accounts/{account_id}/k2/streams/{stream_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdK2StreamsStreamId("test", "test", newCloudflareK2UpdateK2StreamRequest())

  test "GET /accounts/{account_id}/k2/streams/{stream_id}/subscriptions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdK2StreamsStreamIdSubscriptions("test", "test")

  test "POST /produce":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postProduce(newCloudflareK2K2ProduceRequest())

  test "POST /subscriptions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postSubscriptions(newCloudflareK2CreateK2SubscriptionRequest())

  test "GET /subscriptions/{subscription_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getSubscriptionsSubscriptionId("test")

  test "DELETE /subscriptions/{subscription_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteSubscriptionsSubscriptionId("test")

  test "POST /subscriptions/{subscription_id}/batches/{batch_id}/ack":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postSubscriptionsSubscriptionIdBatchesBatchIdAck("test", "test", newCloudflareK2K2BatchRequest())

  test "POST /subscriptions/{subscription_id}/batches/{batch_id}/extend":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postSubscriptionsSubscriptionIdBatchesBatchIdExtend("test", "test", newCloudflareK2K2BatchRequest())

  test "POST /subscriptions/{subscription_id}/batches/{batch_id}/nack":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postSubscriptionsSubscriptionIdBatchesBatchIdNack("test", "test", newCloudflareK2K2BatchRequest())

  test "POST /subscriptions/{subscription_id}/consume":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postSubscriptionsSubscriptionIdConsume("test", newCloudflareK2K2ConsumeRequest())

