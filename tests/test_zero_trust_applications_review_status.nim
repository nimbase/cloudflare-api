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

suite "zero_trust_applications_review_status serialization":
  test "round-trips ZeroTrustGatewayApiResponseCommonFailure":
    let obj = newZeroTrustGatewayApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayApplicationsReviewStatusResponse":
    let obj = newZeroTrustGatewayApplicationsReviewStatusResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayApplicationsReviewStatusResponse)) == openjson.toJson(obj)

suite "zero_trust_applications_review_status endpoints":
  test "GET /accounts/{account_id}/gateway/apps/review_status":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdGatewayAppsReviewStatus("test")

