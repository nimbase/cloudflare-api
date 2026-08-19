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

suite "calls_apps serialization":
  test "round-trips CallsAppResponseSingleWithSecret":
    let obj = newCallsAppResponseSingleWithSecret()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CallsAppResponseSingleWithSecret)) == openjson.toJson(obj)

  test "round-trips CallsApiResponseCommonFailure":
    let obj = newCallsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CallsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips CallsAppEditableFields":
    let obj = newCallsAppEditableFields()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CallsAppEditableFields)) == openjson.toJson(obj)

  test "round-trips CallsAppResponseSingle":
    let obj = newCallsAppResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CallsAppResponseSingle)) == openjson.toJson(obj)

  test "round-trips CallsAppResponseCollection":
    let obj = newCallsAppResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CallsAppResponseCollection)) == openjson.toJson(obj)

suite "calls_apps endpoints":
  test "GET /accounts/{account_id}/calls/apps":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCallsApps("test")

  test "POST /accounts/{account_id}/calls/apps":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCallsApps("test", newCallsAppEditableFields())

  test "GET /accounts/{account_id}/calls/apps/{app_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCallsAppsAppId("test", "test")

  test "PUT /accounts/{account_id}/calls/apps/{app_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdCallsAppsAppId("test", "test", newCallsAppEditableFields())

  test "DELETE /accounts/{account_id}/calls/apps/{app_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCallsAppsAppId("test", "test")

