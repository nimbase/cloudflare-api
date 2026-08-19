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

suite "hyperdrive serialization":
  test "round-trips HyperdriveApiResponseCommonFailure":
    let obj = newHyperdriveApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.HyperdriveApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips HyperdriveHyperdriveConfig":
    let obj = newHyperdriveHyperdriveConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.HyperdriveHyperdriveConfig)) == openjson.toJson(obj)

  test "round-trips HyperdriveApiResponseCommon":
    let obj = newHyperdriveApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.HyperdriveApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips HyperdriveApiResponseSingle":
    let obj = newHyperdriveApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.HyperdriveApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips HyperdriveApiResponseCollection":
    let obj = newHyperdriveApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.HyperdriveApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips HyperdriveHyperdriveDatabaseSignatureResponse":
    let obj = newHyperdriveHyperdriveDatabaseSignatureResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.HyperdriveHyperdriveDatabaseSignatureResponse)) == openjson.toJson(obj)

  test "round-trips HyperdriveHyperdriveConfigResponse":
    let obj = newHyperdriveHyperdriveConfigResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.HyperdriveHyperdriveConfigResponse)) == openjson.toJson(obj)

  test "round-trips HyperdriveHyperdriveConfigPatch":
    let obj = newHyperdriveHyperdriveConfigPatch()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.HyperdriveHyperdriveConfigPatch)) == openjson.toJson(obj)

suite "hyperdrive endpoints":
  test "GET /accounts/{account_id}/hyperdrive/configs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdHyperdriveConfigs("test", 1, 1)

  test "POST /accounts/{account_id}/hyperdrive/configs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdHyperdriveConfigs("test", newHyperdriveHyperdriveConfig())

  test "GET /accounts/{account_id}/hyperdrive/configs/{hyperdrive_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdHyperdriveConfigsHyperdriveId("test", "test")

  test "PUT /accounts/{account_id}/hyperdrive/configs/{hyperdrive_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdHyperdriveConfigsHyperdriveId("test", "test", newHyperdriveHyperdriveConfig())

  test "DELETE /accounts/{account_id}/hyperdrive/configs/{hyperdrive_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdHyperdriveConfigsHyperdriveId("test", "test")

  test "PATCH /accounts/{account_id}/hyperdrive/configs/{hyperdrive_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdHyperdriveConfigsHyperdriveId("test", "test", newHyperdriveHyperdriveConfigPatch())

  test "POST /accounts/{account_id}/hyperdrive/configs/{hyperdrive_id}/restart":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdHyperdriveConfigsHyperdriveIdRestart("test", "test")

