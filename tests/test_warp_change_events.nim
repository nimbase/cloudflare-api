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

suite "warp_change_events serialization":
  test "round-trips DigitalExperienceMonitoringApiResponseCollection":
    let obj = newDigitalExperienceMonitoringApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringApiResponseCommonFailure":
    let obj = newDigitalExperienceMonitoringApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringApiResponseCommonFailure)) == openjson.toJson(obj)

suite "warp_change_events endpoints":
  test "GET /accounts/{account_id}/dex/warp-change-events":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDexWarpChangeEvents("test", 1.0, 1.0, "test", "test", {}, {}, "test", "test", {})

