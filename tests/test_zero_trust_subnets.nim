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

suite "zero_trust_subnets serialization":
  test "round-trips TunnelSubnetResponseCollection":
    let obj = newTunnelSubnetResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelSubnetResponseCollection)) == openjson.toJson(obj)

  test "round-trips TunnelSubnetResponseSingle":
    let obj = newTunnelSubnetResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelSubnetResponseSingle)) == openjson.toJson(obj)

  test "round-trips TunnelApiResponseCommonFailure":
    let obj = newTunnelApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips TunnelSubnetResponseSingleNullable":
    let obj = newTunnelSubnetResponseSingleNullable()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelSubnetResponseSingleNullable)) == openjson.toJson(obj)

suite "zero_trust_subnets endpoints":
  test "GET /accounts/{account_id}/zerotrust/subnets/warp/{subnet_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdZerotrustSubnetsWarpSubnetId("test", "test")

  test "DELETE /accounts/{account_id}/zerotrust/subnets/warp/{subnet_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdZerotrustSubnetsWarpSubnetId("test", "test")

