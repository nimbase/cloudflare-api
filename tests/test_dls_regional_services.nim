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

suite "dls_regional_services serialization":
  test "round-trips DlsApiResponseCollection":
    let obj = newDlsApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlsApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips DlsApiResponseCommonFailure":
    let obj = newDlsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DlsRegionalHostnameResponse":
    let obj = newDlsRegionalHostnameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlsRegionalHostnameResponse)) == openjson.toJson(obj)

  test "round-trips DlsApiResponseCommon":
    let obj = newDlsApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlsApiResponseCommon)) == openjson.toJson(obj)

suite "dls_regional_services endpoints":
  test "GET /accounts/{account_id}/addressing/regional_hostnames/regions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAddressingRegionalHostnamesRegions("test")

  test "GET /zones/{zone_id}/addressing/regional_hostnames":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAddressingRegionalHostnames("test")

  test "GET /zones/{zone_id}/addressing/regional_hostnames/{hostname}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAddressingRegionalHostnamesHostname("test", "test")

  test "DELETE /zones/{zone_id}/addressing/regional_hostnames/{hostname}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdAddressingRegionalHostnamesHostname("test", "test")

