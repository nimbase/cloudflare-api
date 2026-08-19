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

suite "zone_cloud_connector_rules_get serialization":
  test "round-trips CloudConnectorApiResponseCommonFailure":
    let obj = newCloudConnectorApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudConnectorApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips CloudConnectorApiResponseCommon":
    let obj = newCloudConnectorApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudConnectorApiResponseCommon)) == openjson.toJson(obj)

suite "zone_cloud_connector_rules_get endpoints":
  test "GET /zones/{zone_id}/cloud_connector/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdCloudConnectorRules("test")

