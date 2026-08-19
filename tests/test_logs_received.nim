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

suite "logs_received serialization":
  test "round-trips LogshareApiResponseCommonFailure":
    let obj = newLogshareApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogshareApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips LogshareEnd":
    let obj = newLogshareEnd()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogshareEnd)) == openjson.toJson(obj)

  test "round-trips LogshareFieldsResponse":
    let obj = newLogshareFieldsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogshareFieldsResponse)) == openjson.toJson(obj)

  test "round-trips LogshareStart":
    let obj = newLogshareStart()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogshareStart)) == openjson.toJson(obj)

  test "round-trips LogcontrolApiResponseCommonFailure":
    let obj = newLogcontrolApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogcontrolApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips LogcontrolRetentionFlag":
    let obj = newLogcontrolRetentionFlag()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogcontrolRetentionFlag)) == openjson.toJson(obj)

  test "round-trips LogshareLogsResponseJsonLines":
    let obj = newLogshareLogsResponseJsonLines()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogshareLogsResponseJsonLines)) == openjson.toJson(obj)

  test "round-trips LogcontrolRetentionFlagResponseSingle":
    let obj = newLogcontrolRetentionFlagResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogcontrolRetentionFlagResponseSingle)) == openjson.toJson(obj)

suite "logs_received endpoints":
  test "GET /zones/{zone_id}/logs/control/retention/flag":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdLogsControlRetentionFlag("test")

  test "POST /zones/{zone_id}/logs/control/retention/flag":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdLogsControlRetentionFlag("test", newLogcontrolRetentionFlag())

  test "GET /zones/{zone_id}/logs/received/fields":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdLogsReceivedFields("test")

