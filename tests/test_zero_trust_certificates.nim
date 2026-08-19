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

suite "zero_trust_certificates serialization":
  test "round-trips ZeroTrustGatewayApiResponseCommonFailure":
    let obj = newZeroTrustGatewayApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayResponseCollection":
    let obj = newZeroTrustGatewayResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayResponseCollection)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewaySingleResponse":
    let obj = newZeroTrustGatewaySingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewaySingleResponse)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayGenerateCertRequest":
    let obj = newZeroTrustGatewayGenerateCertRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayGenerateCertRequest)) == openjson.toJson(obj)

suite "zero_trust_certificates endpoints":
  test "GET /accounts/{account_id}/gateway/certificates":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdGatewayCertificates("test")

  test "POST /accounts/{account_id}/gateway/certificates":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdGatewayCertificates("test", newZeroTrustGatewayGenerateCertRequest())

  test "GET /accounts/{account_id}/gateway/certificates/{certificate_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdGatewayCertificatesCertificateId("test", "test")

  test "DELETE /accounts/{account_id}/gateway/certificates/{certificate_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdGatewayCertificatesCertificateId("test", "test")

  test "POST /accounts/{account_id}/gateway/certificates/{certificate_id}/activate":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdGatewayCertificatesCertificateIdActivate("test", "test")

  test "POST /accounts/{account_id}/gateway/certificates/{certificate_id}/deactivate":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdGatewayCertificatesCertificateIdDeactivate("test", "test")

