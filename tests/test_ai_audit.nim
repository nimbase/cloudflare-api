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

suite "ai_audit serialization":
  test "round-trips AiAuditApiResponseCommon":
    let obj = newAiAuditApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AiAuditApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips AiAuditRobotsRules":
    let obj = newAiAuditRobotsRules()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AiAuditRobotsRules)) == openjson.toJson(obj)

  test "round-trips AiAuditBulkRobotsRules":
    let obj = newAiAuditBulkRobotsRules()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AiAuditBulkRobotsRules)) == openjson.toJson(obj)

  test "round-trips AiAuditApiResponseCommonFailure":
    let obj = newAiAuditApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AiAuditApiResponseCommonFailure)) == openjson.toJson(obj)

suite "ai_audit endpoints":
  test "GET /zones/{zone_id}/ai-audit/robots":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdAiAuditRobots("test", "test")

  test "POST /zones/{zone_id}/ai-audit/robots/bulk":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdAiAuditRobotsBulk("test")

