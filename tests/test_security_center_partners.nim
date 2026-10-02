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

suite "security_center_partners serialization":
  test "round-trips SecurityCenterApiResponseCommonFailure":
    let obj = newSecurityCenterApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecurityCenterApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips SecurityCenterPartnerSettingsResponse":
    let obj = newSecurityCenterPartnerSettingsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecurityCenterPartnerSettingsResponse)) == openjson.toJson(obj)

  test "round-trips SecurityCenterPartnerSettings":
    let obj = newSecurityCenterPartnerSettings()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecurityCenterPartnerSettings)) == openjson.toJson(obj)

  test "round-trips SecurityCenterShadowZonesResponse":
    let obj = newSecurityCenterShadowZonesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecurityCenterShadowZonesResponse)) == openjson.toJson(obj)

  test "round-trips SecurityCenterShadowHostsResponse":
    let obj = newSecurityCenterShadowHostsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecurityCenterShadowHostsResponse)) == openjson.toJson(obj)

suite "security_center_partners endpoints":
  test "module has no sampleable endpoints":
    check true

