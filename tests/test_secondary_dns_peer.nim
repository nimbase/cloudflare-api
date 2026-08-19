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

suite "secondary_dns_peer serialization":
  test "round-trips SecondaryDnsResponseCollection2":
    let obj = newSecondaryDnsResponseCollection2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsResponseCollection2)) == openjson.toJson(obj)

  test "round-trips SecondaryDnsSingleResponse2":
    let obj = newSecondaryDnsSingleResponse2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsSingleResponse2)) == openjson.toJson(obj)

  test "round-trips SecondaryDnsApiResponseCommonFailure":
    let obj = newSecondaryDnsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips SecondaryDnsPeer":
    let obj = newSecondaryDnsPeer()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsPeer)) == openjson.toJson(obj)

  test "round-trips SecondaryDnsIdResponse3":
    let obj = newSecondaryDnsIdResponse3()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsIdResponse3)) == openjson.toJson(obj)

suite "secondary_dns_peer endpoints":
  test "GET /accounts/{account_id}/secondary_dns/peers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSecondaryDnsPeers("test")

  test "GET /accounts/{account_id}/secondary_dns/peers/{peer_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSecondaryDnsPeersPeerId("test", "test")

  test "PUT /accounts/{account_id}/secondary_dns/peers/{peer_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdSecondaryDnsPeersPeerId("test", "test", newSecondaryDnsPeer())

  test "DELETE /accounts/{account_id}/secondary_dns/peers/{peer_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdSecondaryDnsPeersPeerId("test", "test")

