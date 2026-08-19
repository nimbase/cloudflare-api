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

suite "per_hostname_tls_settings serialization":
  test "round-trips TlsCertificatesAndHostnamesValue":
    let obj = newTlsCertificatesAndHostnamesValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesValue)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesPerHostnameSettingsResponse":
    let obj = newTlsCertificatesAndHostnamesPerHostnameSettingsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesPerHostnameSettingsResponse)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesPerHostnameSettingsResponseCollection":
    let obj = newTlsCertificatesAndHostnamesPerHostnameSettingsResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesPerHostnameSettingsResponseCollection)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesApiResponseCommonFailure":
    let obj = newTlsCertificatesAndHostnamesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesPerHostnameSettingsResponseDelete":
    let obj = newTlsCertificatesAndHostnamesPerHostnameSettingsResponseDelete()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesPerHostnameSettingsResponseDelete)) == openjson.toJson(obj)

suite "per_hostname_tls_settings endpoints":
  test "module has no sampleable endpoints":
    check true

