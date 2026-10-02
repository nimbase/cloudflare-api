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

  test "round-trips CloudflareK2CreateK2StreamRequest":
    let obj = newCloudflareK2CreateK2StreamRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudflareK2CreateK2StreamRequest)) == openjson.toJson(obj)

  test "round-trips CloudflareK2K2StreamListResponse":
    let obj = newCloudflareK2K2StreamListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudflareK2K2StreamListResponse)) == openjson.toJson(obj)

  test "round-trips CloudflareK2K2MonitoredSubscriptionListResponse":
    let obj = newCloudflareK2K2MonitoredSubscriptionListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudflareK2K2MonitoredSubscriptionListResponse)) == openjson.toJson(obj)

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

