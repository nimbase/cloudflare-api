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

suite "account_settings serialization":
  test "round-trips SpeedApiResponseCommon":
    let obj = newSpeedApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpeedApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips SpeedApiResponseCommonFailure":
    let obj = newSpeedApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpeedApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips SpeedUtBillingResponse":
    let obj = newSpeedUtBillingResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpeedUtBillingResponse)) == openjson.toJson(obj)

  test "round-trips SpeedZoneConfigItem":
    let obj = newSpeedZoneConfigItem()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SpeedZoneConfigItem)) == openjson.toJson(obj)

suite "account_settings endpoints":
  test "GET /accounts/{account_id}/settings/transformations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSettingsTransformations("test")

  test "GET /accounts/{account_id}/settings/ut-billing":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSettingsUtBilling("test")

