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

suite "security_txt serialization":
  test "round-trips SecurityCenterApiResponseCommonFailure":
    let obj = newSecurityCenterApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecurityCenterApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips SecurityCenterApiResponseCommon":
    let obj = newSecurityCenterApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecurityCenterApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips SecurityCenterApiResponseSingle":
    let obj = newSecurityCenterApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecurityCenterApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips SecurityCenterSecurityTxt":
    let obj = newSecurityCenterSecurityTxt()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecurityCenterSecurityTxt)) == openjson.toJson(obj)

suite "security_txt endpoints":
  test "GET /zones/{zone_id}/security-center/securitytxt":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSecurityCenterSecuritytxt("test")

  test "PUT /zones/{zone_id}/security-center/securitytxt":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdSecurityCenterSecuritytxt("test", newSecurityCenterSecurityTxt())

  test "DELETE /zones/{zone_id}/security-center/securitytxt":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdSecurityCenterSecuritytxt("test")

