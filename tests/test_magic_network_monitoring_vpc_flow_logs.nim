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

suite "magic_network_monitoring_vpc_flow_logs serialization":
  test "round-trips MagicVisibilityMnmMnmVpcFlowsSingleResponse":
    let obj = newMagicVisibilityMnmMnmVpcFlowsSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicVisibilityMnmMnmVpcFlowsSingleResponse)) == openjson.toJson(obj)

  test "round-trips MagicVisibilityMnmApiResponseCommonFailure":
    let obj = newMagicVisibilityMnmApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicVisibilityMnmApiResponseCommonFailure)) == openjson.toJson(obj)

suite "magic_network_monitoring_vpc_flow_logs endpoints":
  test "POST /accounts/{account_id}/mnm/vpc-flows/token":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMnmVpcFlowsToken("test")

