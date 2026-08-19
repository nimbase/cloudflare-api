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

suite "interconnects serialization":
  test "round-trips NscInterconnectCreate":
    let obj = newNscInterconnectCreate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.NscInterconnectCreate)) == openjson.toJson(obj)

  test "round-trips NscStatusInfo":
    let obj = newNscStatusInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.NscStatusInfo)) == openjson.toJson(obj)

  test "round-trips NscDefaultNameResponse":
    let obj = newNscDefaultNameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.NscDefaultNameResponse)) == openjson.toJson(obj)

  test "round-trips NscInterconnect":
    let obj = newNscInterconnect()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.NscInterconnect)) == openjson.toJson(obj)

  test "round-trips NscInterconnectList":
    let obj = newNscInterconnectList()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.NscInterconnectList)) == openjson.toJson(obj)

suite "interconnects endpoints":
  test "GET /accounts/{account_id}/cni/interconnects":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCniInterconnects("test", "test", 1, 1, "test")

  test "POST /accounts/{account_id}/cni/interconnects":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCniInterconnects("test", newNscInterconnectCreate())

  test "GET /accounts/{account_id}/cni/interconnects/{icon}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCniInterconnectsIcon("test", "test")

  test "DELETE /accounts/{account_id}/cni/interconnects/{icon}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCniInterconnectsIcon("test", "test")

  test "GET /accounts/{account_id}/cni/interconnects/{icon}/loa":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCniInterconnectsIconLoa("test", "test", "test")

  test "GET /accounts/{account_id}/cni/interconnects/{icon}/loa/default":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCniInterconnectsIconLoaDefault("test", "test")

  test "GET /accounts/{account_id}/cni/interconnects/{icon}/status":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCniInterconnectsIconStatus("test", "test")

