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

suite "access_short_lived_certificate_cas serialization":
  test "round-trips AccessSingleResponse5":
    let obj = newAccessSingleResponse5()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleResponse5)) == openjson.toJson(obj)

  test "round-trips AccessIdResponse2":
    let obj = newAccessIdResponse2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessIdResponse2)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessResponseCollection4":
    let obj = newAccessResponseCollection4()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollection4)) == openjson.toJson(obj)

suite "access_short_lived_certificate_cas endpoints":
  test "GET /accounts/{account_id}/access/apps/ca":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessAppsCa("test", 1, 1)

  test "GET /accounts/{account_id}/access/apps/{app_id}/ca":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessAppsAppIdCa("test", "test")

  test "POST /accounts/{account_id}/access/apps/{app_id}/ca":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAccessAppsAppIdCa("test", "test")

  test "DELETE /accounts/{account_id}/access/apps/{app_id}/ca":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAccessAppsAppIdCa("test", "test")

