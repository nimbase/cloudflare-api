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

suite "moq_relays serialization":
  test "round-trips MoqResultInfo":
    let obj = newMoqResultInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MoqResultInfo)) == openjson.toJson(obj)

  test "round-trips MoqRelayListItem":
    let obj = newMoqRelayListItem()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MoqRelayListItem)) == openjson.toJson(obj)

  test "round-trips MoqTokensEnvelope":
    let obj = newMoqTokensEnvelope()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MoqTokensEnvelope)) == openjson.toJson(obj)

  test "round-trips MoqRelayConfig":
    let obj = newMoqRelayConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MoqRelayConfig)) == openjson.toJson(obj)

  test "round-trips MoqApiResponseError":
    let obj = newMoqApiResponseError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MoqApiResponseError)) == openjson.toJson(obj)

  test "round-trips MoqRelayCreateResponse":
    let obj = newMoqRelayCreateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MoqRelayCreateResponse)) == openjson.toJson(obj)

  test "round-trips MoqRelay":
    let obj = newMoqRelay()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MoqRelay)) == openjson.toJson(obj)

  test "round-trips MoqApiResponseCommon":
    let obj = newMoqApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MoqApiResponseCommon)) == openjson.toJson(obj)

suite "moq_relays endpoints":
  test "GET /accounts/{account_id}/moq/relays":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMoqRelays("test", "test", "test", 1, true)

  test "GET /accounts/{account_id}/moq/relays/{relay_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMoqRelaysRelayId("test", "test")

  test "DELETE /accounts/{account_id}/moq/relays/{relay_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMoqRelaysRelayId("test", "test")

  test "GET /accounts/{account_id}/moq/relays/{relay_id}/tokens":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMoqRelaysRelayIdTokens("test", "test")

  test "DELETE /accounts/{account_id}/moq/relays/{relay_id}/tokens/{jti}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMoqRelaysRelayIdTokensJti("test", "test", "test")

