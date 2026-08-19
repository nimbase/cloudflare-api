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

suite "email_auth serialization":
  test "round-trips EmailAuthDmarcReportResponse":
    let obj = newEmailAuthDmarcReportResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailAuthDmarcReportResponse)) == openjson.toJson(obj)

  test "round-trips EmailAuthApiResponseSingle":
    let obj = newEmailAuthApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailAuthApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips EmailAuthApiResponseCommonFailure":
    let obj = newEmailAuthApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailAuthApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips EmailAuthConfigureDmarcReportsRequest":
    let obj = newEmailAuthConfigureDmarcReportsRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailAuthConfigureDmarcReportsRequest)) == openjson.toJson(obj)

  test "round-trips EmailAuthSpfTree":
    let obj = newEmailAuthSpfTree()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailAuthSpfTree)) == openjson.toJson(obj)

suite "email_auth endpoints":
  test "GET /zones/{zone_id}/email/auth/dmarc-reports":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdEmailAuthDmarcReports("test")

  test "PATCH /zones/{zone_id}/email/auth/dmarc-reports":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdEmailAuthDmarcReports("test", newEmailAuthConfigureDmarcReportsRequest())

  test "GET /zones/{zone_id}/email/auth/spf/inspect":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdEmailAuthSpfInspect("test", "test")

