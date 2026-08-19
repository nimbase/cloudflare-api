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

suite "dcv_delegation serialization":
  test "round-trips TlsCertificatesAndHostnamesDcvDelegationResponse":
    let obj = newTlsCertificatesAndHostnamesDcvDelegationResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesDcvDelegationResponse)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesApiResponseCommonFailure":
    let obj = newTlsCertificatesAndHostnamesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesApiResponseCommonFailure)) == openjson.toJson(obj)

suite "dcv_delegation endpoints":
  test "GET /zones/{zone_id}/dcv_delegation/uuid":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdDcvDelegationUuid("test")

