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

suite "fraud_detection serialization":
  test "round-trips FraudFraudSettingsResponseBody":
    let obj = newFraudFraudSettingsResponseBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FraudFraudSettingsResponseBody)) == openjson.toJson(obj)

  test "round-trips FraudFraudSettings":
    let obj = newFraudFraudSettings()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FraudFraudSettings)) == openjson.toJson(obj)

  test "round-trips FraudApiResponseCommonFailure":
    let obj = newFraudApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FraudApiResponseCommonFailure)) == openjson.toJson(obj)

suite "fraud_detection endpoints":
  test "GET /zones/{zone_id}/fraud_detection/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdFraudDetectionSettings("test")

  test "PUT /zones/{zone_id}/fraud_detection/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdFraudDetectionSettings("test", newFraudFraudSettings())

