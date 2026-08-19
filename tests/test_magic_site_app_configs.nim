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

suite "magic_site_app_configs serialization":
  test "round-trips MagicAppConfigsCollectionResponse":
    let obj = newMagicAppConfigsCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicAppConfigsCollectionResponse)) == openjson.toJson(obj)

  test "round-trips MagicAppConfigSingleResponse":
    let obj = newMagicAppConfigSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicAppConfigSingleResponse)) == openjson.toJson(obj)

  test "round-trips MagicAppConfigUpdateRequest":
    let obj = newMagicAppConfigUpdateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicAppConfigUpdateRequest)) == openjson.toJson(obj)

  test "round-trips MagicAppConfigAddSingleRequest":
    let obj = newMagicAppConfigAddSingleRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicAppConfigAddSingleRequest)) == openjson.toJson(obj)

  test "round-trips MagicApiResponseCommonFailure":
    let obj = newMagicApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicApiResponseCommonFailure)) == openjson.toJson(obj)

suite "magic_site_app_configs endpoints":
  test "GET /accounts/{account_id}/magic/sites/{site_id}/app_configs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicSitesSiteIdAppConfigs("test", "test")

  test "POST /accounts/{account_id}/magic/sites/{site_id}/app_configs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicSitesSiteIdAppConfigs("test", "test", newMagicAppConfigAddSingleRequest())

  test "PUT /accounts/{account_id}/magic/sites/{site_id}/app_configs/{app_config_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMagicSitesSiteIdAppConfigsAppConfigId("test", "test", "test", newMagicAppConfigUpdateRequest())

  test "DELETE /accounts/{account_id}/magic/sites/{site_id}/app_configs/{app_config_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicSitesSiteIdAppConfigsAppConfigId("test", "test", "test")

  test "PATCH /accounts/{account_id}/magic/sites/{site_id}/app_configs/{app_config_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdMagicSitesSiteIdAppConfigsAppConfigId("test", "test", "test", newMagicAppConfigUpdateRequest())

