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

suite "gateway_ca serialization":
  test "round-trips AccessSingleResponse7":
    let obj = newAccessSingleResponse7()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleResponse7)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessResponseCollection6":
    let obj = newAccessResponseCollection6()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollection6)) == openjson.toJson(obj)

  test "round-trips AccessIdResponse":
    let obj = newAccessIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessIdResponse)) == openjson.toJson(obj)

suite "gateway_ca endpoints":
  test "GET /accounts/{account_id}/access/gateway_ca":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessGatewayCa("test")

  test "POST /accounts/{account_id}/access/gateway_ca":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAccessGatewayCa("test")

  test "DELETE /accounts/{account_id}/access/gateway_ca/{certificate_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAccessGatewayCaCertificateId("test", "test")

