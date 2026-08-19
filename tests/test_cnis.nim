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

suite "cnis serialization":
  test "round-trips NscCniCreate":
    let obj = newNscCniCreate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.NscCniCreate)) == openjson.toJson(obj)

  test "round-trips NscCni":
    let obj = newNscCni()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.NscCni)) == openjson.toJson(obj)

  test "round-trips NscCniList":
    let obj = newNscCniList()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.NscCniList)) == openjson.toJson(obj)

suite "cnis endpoints":
  test "GET /accounts/{account_id}/cni/cnis":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCniCnis("test", "test", 1, 1, "test")

  test "POST /accounts/{account_id}/cni/cnis":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCniCnis("test", newNscCniCreate())

  test "GET /accounts/{account_id}/cni/cnis/{cni}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCniCnisCni("test", "test")

  test "PUT /accounts/{account_id}/cni/cnis/{cni}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdCniCnisCni("test", "test", newNscCni())

  test "DELETE /accounts/{account_id}/cni/cnis/{cni}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCniCnisCni("test", "test")

