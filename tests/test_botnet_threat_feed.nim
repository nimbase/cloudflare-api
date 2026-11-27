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

suite "botnet_threat_feed serialization":
  test "round-trips BotnetFeedApiResponseCommonFailure":
    let obj = newBotnetFeedApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BotnetFeedApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips BotnetFeedApiResponseCommon":
    let obj = newBotnetFeedApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BotnetFeedApiResponseCommon)) == openjson.toJson(obj)

suite "botnet_threat_feed endpoints":
  test "GET /accounts/{account_id}/botnet_feed/asn/{asn_id}/day_report":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBotnetFeedAsnAsnIdDayReport("test", 1, "test")

  test "GET /accounts/{account_id}/botnet_feed/asn/{asn_id}/full_report":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBotnetFeedAsnAsnIdFullReport("test", 1)

  test "GET /accounts/{account_id}/botnet_feed/configs/asn":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBotnetFeedConfigsAsn("test")

  test "DELETE /accounts/{account_id}/botnet_feed/configs/asn/{asn_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdBotnetFeedConfigsAsnAsnId("test", 1)

