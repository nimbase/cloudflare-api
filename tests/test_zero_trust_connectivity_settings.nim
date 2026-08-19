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

suite "zero_trust_connectivity_settings serialization":
  test "round-trips TunnelZeroTrustConnectivitySettingsResponse":
    let obj = newTunnelZeroTrustConnectivitySettingsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelZeroTrustConnectivitySettingsResponse)) == openjson.toJson(obj)

  test "round-trips TunnelApiResponseCommonFailure":
    let obj = newTunnelApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelApiResponseCommonFailure)) == openjson.toJson(obj)

suite "zero_trust_connectivity_settings endpoints":
  test "GET /accounts/{account_id}/zerotrust/connectivity_settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdZerotrustConnectivitySettings("test")

