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

suite "zero_trust_ssh_settings serialization":
  test "round-trips ZeroTrustGatewaySingleResponse6":
    let obj = newZeroTrustGatewaySingleResponse6()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewaySingleResponse6)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayApiResponseCommonFailure":
    let obj = newZeroTrustGatewayApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayApiResponseCommonFailure)) == openjson.toJson(obj)

suite "zero_trust_ssh_settings endpoints":
  test "GET /accounts/{account_id}/gateway/audit_ssh_settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdGatewayAuditSshSettings("test")

  test "POST /accounts/{account_id}/gateway/audit_ssh_settings/rotate_seed":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdGatewayAuditSshSettingsRotateSeed("test")

