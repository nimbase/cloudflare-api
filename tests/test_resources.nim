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

suite "resources serialization":
  test "round-trips McnResourcesCatalogPolicyPreviewRequest":
    let obj = newMcnResourcesCatalogPolicyPreviewRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnResourcesCatalogPolicyPreviewRequest)) == openjson.toJson(obj)

  test "round-trips McnResourcesCatalogPolicyPreviewResponse":
    let obj = newMcnResourcesCatalogPolicyPreviewResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnResourcesCatalogPolicyPreviewResponse)) == openjson.toJson(obj)

  test "round-trips McnReadAccountResourcesResponse":
    let obj = newMcnReadAccountResourcesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnReadAccountResourcesResponse)) == openjson.toJson(obj)

  test "round-trips McnReadAccountResourceResponse":
    let obj = newMcnReadAccountResourceResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnReadAccountResourceResponse)) == openjson.toJson(obj)

  test "round-trips McnBadResponse":
    let obj = newMcnBadResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnBadResponse)) == openjson.toJson(obj)

suite "resources endpoints":
  test "GET /accounts/{account_id}/magic/cloud/resources":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicCloudResources("test", "test", @["test"], @["test"], "test", "test", true, @["test"], "test", true, 1, 1, true, true)

  test "GET /accounts/{account_id}/magic/cloud/resources/export":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicCloudResourcesExport("test", "test", @["test"], @["test"], "test", "test", @["test"], "test", true, true)

  test "POST /accounts/{account_id}/magic/cloud/resources/policy-preview":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicCloudResourcesPolicyPreview("test", newMcnResourcesCatalogPolicyPreviewRequest())

  test "GET /accounts/{account_id}/magic/cloud/resources/{resource_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicCloudResourcesResourceId("test", "test", true)

