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

suite "apps serialization":
  test "round-trips FlagshipError":
    let obj = newFlagshipError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FlagshipError)) == openjson.toJson(obj)

  test "round-trips FlagshipDeleteAppResult":
    let obj = newFlagshipDeleteAppResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FlagshipDeleteAppResult)) == openjson.toJson(obj)

  test "round-trips FlagshipApp":
    let obj = newFlagshipApp()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FlagshipApp)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdFlagshipAppsResponse":
    let obj = cloudflare.GetAccountsAccountIdFlagshipAppsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdFlagshipAppsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdFlagshipAppsResponse":
    let obj = cloudflare.PostAccountsAccountIdFlagshipAppsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdFlagshipAppsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdFlagshipAppsAppIdResponse":
    let obj = cloudflare.GetAccountsAccountIdFlagshipAppsAppIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdFlagshipAppsAppIdResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdFlagshipAppsAppIdResponse":
    let obj = cloudflare.PutAccountsAccountIdFlagshipAppsAppIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdFlagshipAppsAppIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdFlagshipAppsAppIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdFlagshipAppsAppIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdFlagshipAppsAppIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdRealtimeKitAppsResponse":
    let obj = cloudflare.GetAccountsAccountIdRealtimeKitAppsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdRealtimeKitAppsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdRealtimeKitAppsResponse":
    let obj = cloudflare.PostAccountsAccountIdRealtimeKitAppsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdRealtimeKitAppsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdRealtimeKitAppsAppIdResponse":
    let obj = cloudflare.GetAccountsAccountIdRealtimeKitAppsAppIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdRealtimeKitAppsAppIdResponse)) == openjson.toJson(obj)

suite "apps endpoints":
  test "GET /accounts/{account_id}/flagship/apps":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdFlagshipApps("test")

  test "GET /accounts/{account_id}/flagship/apps/{app_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdFlagshipAppsAppId("test", "test")

  test "DELETE /accounts/{account_id}/flagship/apps/{app_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdFlagshipAppsAppId("test", "test")

  test "GET /accounts/{account_id}/realtime/kit/apps":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitApps(1, 1, "test", {})

  test "GET /accounts/{account_id}/realtime/kit/apps/{app_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppsAppId("test", "test")

