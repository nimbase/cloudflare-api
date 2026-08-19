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

suite "slots serialization":
  test "round-trips NscSlotInfo":
    let obj = newNscSlotInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.NscSlotInfo)) == openjson.toJson(obj)

  test "round-trips NscSlotList":
    let obj = newNscSlotList()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.NscSlotList)) == openjson.toJson(obj)

suite "slots endpoints":
  test "GET /accounts/{account_id}/cni/slots":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCniSlots("test", "test", "test", true, 1, 1, "test")

  test "GET /accounts/{account_id}/cni/slots/{slot}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCniSlotsSlot("test", "test")

