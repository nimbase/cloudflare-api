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

suite "requests_dashboard serialization":
  test "round-trips GetAccountsAccountIdCloudforceOneV2RequestsLegalResponseAccessCheckResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2RequestsLegalResponseAccessCheckResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2RequestsLegalResponseAccessCheckResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeConstantsResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeConstantsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeConstantsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeMetadataResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeMetadataResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeMetadataResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeTypesResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeTypesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeTypesResponse)) == openjson.toJson(obj)

suite "requests_dashboard endpoints":
  test "GET /accounts/{account_id}/cloudforce-one/v2/requests/legal-response/access-check":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2RequestsLegalResponseAccessCheck("test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/requests/{project_type}/types":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2RequestsProjectTypeTypes("test", "test")

