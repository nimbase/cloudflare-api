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

suite "instant_logs_jobs_for_a_zone serialization":
  test "round-trips LogpushInstantLogsJobResponseSingle":
    let obj = newLogpushInstantLogsJobResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogpushInstantLogsJobResponseSingle)) == openjson.toJson(obj)

  test "round-trips LogpushInstantLogsJobResponseCollection":
    let obj = newLogpushInstantLogsJobResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogpushInstantLogsJobResponseCollection)) == openjson.toJson(obj)

  test "round-trips LogpushApiResponseCommonFailure":
    let obj = newLogpushApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogpushApiResponseCommonFailure)) == openjson.toJson(obj)

suite "instant_logs_jobs_for_a_zone endpoints":
  test "GET /zones/{zone_id}/logpush/edge/jobs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdLogpushEdgeJobs("test")

