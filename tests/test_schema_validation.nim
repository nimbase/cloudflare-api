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

suite "schema_validation serialization":
  test "round-trips ApiShieldApiResponseCommonFailure":
    let obj = newApiShieldApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ApiShieldPublicSchemaSuccessResult":
    let obj = newApiShieldPublicSchemaSuccessResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldPublicSchemaSuccessResult)) == openjson.toJson(obj)

  test "round-trips ApiShieldPublicSchema":
    let obj = newApiShieldPublicSchema()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldPublicSchema)) == openjson.toJson(obj)

  test "round-trips ApiShieldSchemaHosts":
    let obj = newApiShieldSchemaHosts()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldSchemaHosts)) == openjson.toJson(obj)

  test "round-trips ApiShieldSchemaIssueNotification":
    let obj = newApiShieldSchemaIssueNotification()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldSchemaIssueNotification)) == openjson.toJson(obj)

  test "round-trips ApiShieldApiResponseSingle":
    let obj = newApiShieldApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips ApiShieldApiResponseCollection":
    let obj = newApiShieldApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseCollection)) == openjson.toJson(obj)

suite "schema_validation endpoints":
  test "GET /zones/{zone_id}/schema_validation/schemas":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSchemaValidationSchemas(1, 1, true, true)

  test "GET /zones/{zone_id}/schema_validation/schemas/hosts":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSchemaValidationSchemasHosts(1, 1)

  test "GET /zones/{zone_id}/schema_validation/schemas/{schema_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSchemaValidationSchemasSchemaId(true)

  test "DELETE /zones/{zone_id}/schema_validation/schemas/{schema_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdSchemaValidationSchemasSchemaId()

