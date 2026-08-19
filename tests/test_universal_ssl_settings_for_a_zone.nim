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

suite "universal_ssl_settings_for_a_zone serialization":
  test "round-trips TlsCertificatesAndHostnamesSslUniversalSettingsResponse":
    let obj = newTlsCertificatesAndHostnamesSslUniversalSettingsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesSslUniversalSettingsResponse)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesUniversal":
    let obj = newTlsCertificatesAndHostnamesUniversal()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesUniversal)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesApiResponseCommonFailure":
    let obj = newTlsCertificatesAndHostnamesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesApiResponseCommonFailure)) == openjson.toJson(obj)

suite "universal_ssl_settings_for_a_zone endpoints":
  test "GET /zones/{zone_id}/ssl/universal/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSslUniversalSettings("test")

  test "PATCH /zones/{zone_id}/ssl/universal/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdSslUniversalSettings("test", newTlsCertificatesAndHostnamesUniversal())

