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

suite "scim_discovery serialization":
  test "round-trips IamScimResourceTypeListResponse":
    let obj = newIamScimResourceTypeListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamScimResourceTypeListResponse)) == openjson.toJson(obj)

  test "round-trips IamScimSchema":
    let obj = newIamScimSchema()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamScimSchema)) == openjson.toJson(obj)

  test "round-trips IamAccountIdentifier":
    let obj = newIamAccountIdentifier()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamAccountIdentifier)) == openjson.toJson(obj)

  test "round-trips IamScimServiceProviderConfig":
    let obj = newIamScimServiceProviderConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamScimServiceProviderConfig)) == openjson.toJson(obj)

  test "round-trips IamScimSchemaListResponse":
    let obj = newIamScimSchemaListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamScimSchemaListResponse)) == openjson.toJson(obj)

  test "round-trips IamScimResourceType":
    let obj = newIamScimResourceType()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamScimResourceType)) == openjson.toJson(obj)

  test "round-trips IamScimErrorResponse":
    let obj = newIamScimErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamScimErrorResponse)) == openjson.toJson(obj)

suite "scim_discovery endpoints":
  test "GET /accounts/{account_id}/scim/v2/ResourceTypes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdScimV2ResourceTypes(newIamAccountIdentifier())

  test "GET /accounts/{account_id}/scim/v2/Schemas":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdScimV2Schemas(newIamAccountIdentifier())

  test "GET /accounts/{account_id}/scim/v2/Schemas/{schema_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdScimV2SchemasSchemaId(newIamAccountIdentifier(), "test")

  test "GET /accounts/{account_id}/scim/v2/ServiceProviderConfig":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdScimV2ServiceProviderConfig(newIamAccountIdentifier())

