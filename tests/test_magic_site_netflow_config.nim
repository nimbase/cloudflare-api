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

suite "magic_site_netflow_config serialization":
  test "round-trips MagicNetflowConfigSingleResponse":
    let obj = newMagicNetflowConfigSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicNetflowConfigSingleResponse)) == openjson.toJson(obj)

  test "round-trips MagicNetflowConfigRequest":
    let obj = newMagicNetflowConfigRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicNetflowConfigRequest)) == openjson.toJson(obj)

  test "round-trips MagicApiResponseCommonFailure":
    let obj = newMagicApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicApiResponseCommonFailure)) == openjson.toJson(obj)

suite "magic_site_netflow_config endpoints":
  test "GET /accounts/{account_id}/magic/sites/{site_id}/netflow_config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicSitesSiteIdNetflowConfig("test", "test")

  test "POST /accounts/{account_id}/magic/sites/{site_id}/netflow_config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicSitesSiteIdNetflowConfig("test", "test", newMagicNetflowConfigRequest())

  test "PUT /accounts/{account_id}/magic/sites/{site_id}/netflow_config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMagicSitesSiteIdNetflowConfig("test", "test", newMagicNetflowConfigRequest())

  test "DELETE /accounts/{account_id}/magic/sites/{site_id}/netflow_config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicSitesSiteIdNetflowConfig("test", "test")

  test "PATCH /accounts/{account_id}/magic/sites/{site_id}/netflow_config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdMagicSitesSiteIdNetflowConfig("test", "test", newMagicNetflowConfigRequest())

