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

suite "integrations serialization":
  test "round-trips OnePatchedUpdateIntegrationV2Request":
    let obj = newOnePatchedUpdateIntegrationV2Request()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OnePatchedUpdateIntegrationV2Request)) == openjson.toJson(obj)

  test "round-trips OneIntegrationResumeResponse":
    let obj = newOneIntegrationResumeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OneIntegrationResumeResponse)) == openjson.toJson(obj)

  test "round-trips OneIntegrationPauseResponse":
    let obj = newOneIntegrationPauseResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OneIntegrationPauseResponse)) == openjson.toJson(obj)

  test "round-trips OneIntegrationUpdateResponse":
    let obj = newOneIntegrationUpdateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OneIntegrationUpdateResponse)) == openjson.toJson(obj)

  test "round-trips OnePaginatedIntegrationV2ListItemList":
    let obj = newOnePaginatedIntegrationV2ListItemList()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OnePaginatedIntegrationV2ListItemList)) == openjson.toJson(obj)

  test "round-trips OneIntegrationDetailResponse":
    let obj = newOneIntegrationDetailResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OneIntegrationDetailResponse)) == openjson.toJson(obj)

  test "round-trips OneIntegrationCreateResponse":
    let obj = newOneIntegrationCreateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OneIntegrationCreateResponse)) == openjson.toJson(obj)

  test "round-trips OneIntegrationV2CreateRequest":
    let obj = newOneIntegrationV2CreateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OneIntegrationV2CreateRequest)) == openjson.toJson(obj)

suite "integrations endpoints":
  test "GET /accounts/{account_id}/one/integrations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdOneIntegrations("test", "test", {}, true, {}, 1, 1, "test", {}, "test")

  test "POST /accounts/{account_id}/one/integrations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdOneIntegrations("test", newOneIntegrationV2CreateRequest())

  test "GET /accounts/{account_id}/one/integrations/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdOneIntegrationsId("test", "test")

  test "DELETE /accounts/{account_id}/one/integrations/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdOneIntegrationsId("test", "test")

  test "PATCH /accounts/{account_id}/one/integrations/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdOneIntegrationsId("test", "test", newOnePatchedUpdateIntegrationV2Request())

  test "POST /accounts/{account_id}/one/integrations/{id}/pause":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdOneIntegrationsIdPause("test", "test")

  test "POST /accounts/{account_id}/one/integrations/{id}/resume":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdOneIntegrationsIdResume("test", "test")

