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

suite "dashboard_users serialization":
  test "round-trips GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeUserMeResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeUserMeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeUserMeResponse)) == openjson.toJson(obj)

suite "dashboard_users endpoints":
  test "GET /accounts/{account_id}/cloudforce-one/v2/requests/{project_type}/user/me":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2RequestsProjectTypeUserMe("test", "test")

