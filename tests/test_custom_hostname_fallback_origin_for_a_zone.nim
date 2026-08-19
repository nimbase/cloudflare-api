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

suite "custom_hostname_fallback_origin_for_a_zone serialization":
  test "round-trips TlsCertificatesAndHostnamesApiResponseCommonFailure":
    let obj = newTlsCertificatesAndHostnamesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesFallbackOriginResponse":
    let obj = newTlsCertificatesAndHostnamesFallbackOriginResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesFallbackOriginResponse)) == openjson.toJson(obj)

suite "custom_hostname_fallback_origin_for_a_zone endpoints":
  test "GET /zones/{zone_id}/custom_hostnames/fallback_origin":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdCustomHostnamesFallbackOrigin("test")

  test "DELETE /zones/{zone_id}/custom_hostnames/fallback_origin":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdCustomHostnamesFallbackOrigin("test")

