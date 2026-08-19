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

suite "cloud_integrations serialization":
  test "round-trips McnGoodResponse":
    let obj = newMcnGoodResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnGoodResponse)) == openjson.toJson(obj)

  test "round-trips McnUpdateProviderRequest":
    let obj = newMcnUpdateProviderRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnUpdateProviderRequest)) == openjson.toJson(obj)

  test "round-trips McnProviderInitialSetupResponse":
    let obj = newMcnProviderInitialSetupResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnProviderInitialSetupResponse)) == openjson.toJson(obj)

  test "round-trips McnUpdateProviderResponse":
    let obj = newMcnUpdateProviderResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnUpdateProviderResponse)) == openjson.toJson(obj)

  test "round-trips McnDeleteProviderResponse":
    let obj = newMcnDeleteProviderResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnDeleteProviderResponse)) == openjson.toJson(obj)

  test "round-trips McnReadAccountProvidersResponse":
    let obj = newMcnReadAccountProvidersResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnReadAccountProvidersResponse)) == openjson.toJson(obj)

  test "round-trips McnCreateProviderResponse":
    let obj = newMcnCreateProviderResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnCreateProviderResponse)) == openjson.toJson(obj)

  test "round-trips McnCreateProviderRequest":
    let obj = newMcnCreateProviderRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnCreateProviderRequest)) == openjson.toJson(obj)

  test "round-trips McnReadAccountProviderResponse":
    let obj = newMcnReadAccountProviderResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnReadAccountProviderResponse)) == openjson.toJson(obj)

  test "round-trips McnBadResponse":
    let obj = newMcnBadResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnBadResponse)) == openjson.toJson(obj)

suite "cloud_integrations endpoints":
  test "GET /accounts/{account_id}/magic/cloud/providers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicCloudProviders("test", true, "test", true, true)

  test "POST /accounts/{account_id}/magic/cloud/providers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicCloudProviders("test", newMcnCreateProviderRequest())

  test "POST /accounts/{account_id}/magic/cloud/providers/discover":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicCloudProvidersDiscover("test")

  test "GET /accounts/{account_id}/magic/cloud/providers/{provider_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicCloudProvidersProviderId("test", "test", true)

  test "PUT /accounts/{account_id}/magic/cloud/providers/{provider_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMagicCloudProvidersProviderId("test", "test", newMcnUpdateProviderRequest())

  test "DELETE /accounts/{account_id}/magic/cloud/providers/{provider_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicCloudProvidersProviderId("test", "test")

  test "PATCH /accounts/{account_id}/magic/cloud/providers/{provider_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdMagicCloudProvidersProviderId("test", "test", newMcnUpdateProviderRequest())

  test "POST /accounts/{account_id}/magic/cloud/providers/{provider_id}/discover":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicCloudProvidersProviderIdDiscover("test", "test", true)

  test "GET /accounts/{account_id}/magic/cloud/providers/{provider_id}/initial_setup":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicCloudProvidersProviderIdInitialSetup("test", "test")

