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

suite "cws_rego_metadata serialization":
  test "round-trips CwsResponseRegoMetadata":
    let obj = newCwsResponseRegoMetadata()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsResponseRegoMetadata)) == openjson.toJson(obj)

  test "round-trips CwsRegoMetadataBody":
    let obj = newCwsRegoMetadataBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsRegoMetadataBody)) == openjson.toJson(obj)

  test "round-trips CwsPageResponseRegoMetadata":
    let obj = newCwsPageResponseRegoMetadata()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsPageResponseRegoMetadata)) == openjson.toJson(obj)

  test "round-trips CwsErrorResponse":
    let obj = newCwsErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsErrorResponse)) == openjson.toJson(obj)

  test "round-trips CwsResponseDeletedResult":
    let obj = newCwsResponseDeletedResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsResponseDeletedResult)) == openjson.toJson(obj)

suite "cws_rego_metadata endpoints":
  test "GET /accounts/{account_id}/cws/rego-metadata":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCwsRegoMetadata("test", "test", 1, orderName, directionAsc, "test", "test")

  test "POST /accounts/{account_id}/cws/rego-metadata":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCwsRegoMetadata("test", newCwsRegoMetadataBody())

  test "GET /accounts/{account_id}/cws/rego-metadata/{rego_metadata_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCwsRegoMetadataRegoMetadataId("test", "test")

  test "PUT /accounts/{account_id}/cws/rego-metadata/{rego_metadata_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdCwsRegoMetadataRegoMetadataId("test", "test", newCwsRegoMetadataBody())

  test "DELETE /accounts/{account_id}/cws/rego-metadata/{rego_metadata_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCwsRegoMetadataRegoMetadataId("test", "test")

