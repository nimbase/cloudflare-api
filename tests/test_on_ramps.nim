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

suite "on_ramps serialization":
  test "round-trips McnUpdateOnrampResponse":
    let obj = newMcnUpdateOnrampResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnUpdateOnrampResponse)) == openjson.toJson(obj)

  test "round-trips McnDeleteOnrampResponse":
    let obj = newMcnDeleteOnrampResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnDeleteOnrampResponse)) == openjson.toJson(obj)

  test "round-trips McnGoodResponse":
    let obj = newMcnGoodResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnGoodResponse)) == openjson.toJson(obj)

  test "round-trips McnGetMagicWanAddressSpaceResponse":
    let obj = newMcnGetMagicWanAddressSpaceResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnGetMagicWanAddressSpaceResponse)) == openjson.toJson(obj)

  test "round-trips McnListOnrampsResponse":
    let obj = newMcnListOnrampsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnListOnrampsResponse)) == openjson.toJson(obj)

  test "round-trips McnCreateOnrampRequest":
    let obj = newMcnCreateOnrampRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnCreateOnrampRequest)) == openjson.toJson(obj)

  test "round-trips McnUpdateMagicWanAddressSpaceRequest":
    let obj = newMcnUpdateMagicWanAddressSpaceRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnUpdateMagicWanAddressSpaceRequest)) == openjson.toJson(obj)

  test "round-trips McnUpdateOnrampRequest":
    let obj = newMcnUpdateOnrampRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnUpdateOnrampRequest)) == openjson.toJson(obj)

  test "round-trips McnGetOnrampResponse":
    let obj = newMcnGetOnrampResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnGetOnrampResponse)) == openjson.toJson(obj)

  test "round-trips McnUpdateMagicWanAddressSpaceResponse":
    let obj = newMcnUpdateMagicWanAddressSpaceResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnUpdateMagicWanAddressSpaceResponse)) == openjson.toJson(obj)

  test "round-trips McnCreateOnrampResponse":
    let obj = newMcnCreateOnrampResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnCreateOnrampResponse)) == openjson.toJson(obj)

  test "round-trips McnBadResponse":
    let obj = newMcnBadResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.McnBadResponse)) == openjson.toJson(obj)

suite "on_ramps endpoints":
  test "GET /accounts/{account_id}/magic/cloud/onramps":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicCloudOnramps("test", "test", true, true, true)

  test "POST /accounts/{account_id}/magic/cloud/onramps":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicCloudOnramps("test", newMcnCreateOnrampRequest())

  test "GET /accounts/{account_id}/magic/cloud/onramps/magic_wan_address_space":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicCloudOnrampsMagicWanAddressSpace("test")

  test "PUT /accounts/{account_id}/magic/cloud/onramps/magic_wan_address_space":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMagicCloudOnrampsMagicWanAddressSpace("test", newMcnUpdateMagicWanAddressSpaceRequest())

  test "PATCH /accounts/{account_id}/magic/cloud/onramps/magic_wan_address_space":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdMagicCloudOnrampsMagicWanAddressSpace("test", newMcnUpdateMagicWanAddressSpaceRequest())

  test "GET /accounts/{account_id}/magic/cloud/onramps/{onramp_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicCloudOnrampsOnrampId("test", "test", true, true, true, true)

  test "PUT /accounts/{account_id}/magic/cloud/onramps/{onramp_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMagicCloudOnrampsOnrampId("test", "test", newMcnUpdateOnrampRequest())

  test "DELETE /accounts/{account_id}/magic/cloud/onramps/{onramp_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicCloudOnrampsOnrampId("test", "test", true, true)

  test "PATCH /accounts/{account_id}/magic/cloud/onramps/{onramp_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdMagicCloudOnrampsOnrampId("test", "test", newMcnUpdateOnrampRequest())

  test "POST /accounts/{account_id}/magic/cloud/onramps/{onramp_id}/apply":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicCloudOnrampsOnrampIdApply("test", "test")

  test "POST /accounts/{account_id}/magic/cloud/onramps/{onramp_id}/export":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicCloudOnrampsOnrampIdExport("test", "test")

  test "POST /accounts/{account_id}/magic/cloud/onramps/{onramp_id}/plan":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicCloudOnrampsOnrampIdPlan("test", "test")

