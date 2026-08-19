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

suite "secondary_dns_tsig serialization":
  test "round-trips SecondaryDnsTsig":
    let obj = newSecondaryDnsTsig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsTsig)) == openjson.toJson(obj)

  test "round-trips SecondaryDnsResponseCollection":
    let obj = newSecondaryDnsResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsResponseCollection)) == openjson.toJson(obj)

  test "round-trips SecondaryDnsApiResponseCommonFailure":
    let obj = newSecondaryDnsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips SecondaryDnsSingleResponse":
    let obj = newSecondaryDnsSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsSingleResponse)) == openjson.toJson(obj)

  test "round-trips SecondaryDnsIdResponse2":
    let obj = newSecondaryDnsIdResponse2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsIdResponse2)) == openjson.toJson(obj)

suite "secondary_dns_tsig endpoints":
  test "GET /accounts/{account_id}/secondary_dns/tsigs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSecondaryDnsTsigs("test")

  test "POST /accounts/{account_id}/secondary_dns/tsigs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdSecondaryDnsTsigs("test", newSecondaryDnsTsig())

  test "GET /accounts/{account_id}/secondary_dns/tsigs/{tsig_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSecondaryDnsTsigsTsigId("test", "test")

  test "PUT /accounts/{account_id}/secondary_dns/tsigs/{tsig_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdSecondaryDnsTsigsTsigId("test", "test", newSecondaryDnsTsig())

  test "DELETE /accounts/{account_id}/secondary_dns/tsigs/{tsig_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdSecondaryDnsTsigsTsigId("test", "test")

