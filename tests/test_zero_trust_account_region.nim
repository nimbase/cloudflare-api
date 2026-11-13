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

suite "zero_trust_account_region serialization":
  test "round-trips TunnelPutAccountRegionBody":
    let obj = newTunnelPutAccountRegionBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelPutAccountRegionBody)) == openjson.toJson(obj)

  test "round-trips TunnelActiveAccountRegionResponseSingle":
    let obj = newTunnelActiveAccountRegionResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelActiveAccountRegionResponseSingle)) == openjson.toJson(obj)

  test "round-trips TunnelAccountRegionResponseCollection":
    let obj = newTunnelAccountRegionResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelAccountRegionResponseCollection)) == openjson.toJson(obj)

  test "round-trips TunnelApiResponseCommonFailure":
    let obj = newTunnelApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelApiResponseCommonFailure)) == openjson.toJson(obj)

suite "zero_trust_account_region endpoints":
  test "GET /accounts/{account_id}/zerotrust/region":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdZerotrustRegion("test")

  test "PUT /accounts/{account_id}/zerotrust/region":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdZerotrustRegion("test", newTunnelPutAccountRegionBody())

  test "DELETE /accounts/{account_id}/zerotrust/region":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdZerotrustRegion("test")

  test "GET /accounts/{account_id}/zerotrust/regions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdZerotrustRegions("test")

