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

suite "account_roles serialization":
  test "round-trips IamAccountIdentifier":
    let obj = newIamAccountIdentifier()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamAccountIdentifier)) == openjson.toJson(obj)

  test "round-trips IamSingleRoleResponse":
    let obj = newIamSingleRoleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamSingleRoleResponse)) == openjson.toJson(obj)

  test "round-trips IamApiResponseCommonFailure":
    let obj = newIamApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips IamCollectionRoleResponse":
    let obj = newIamCollectionRoleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamCollectionRoleResponse)) == openjson.toJson(obj)

suite "account_roles endpoints":
  test "GET /accounts/{account_id}/roles":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRoles(newIamAccountIdentifier(), 1.0, 1.0)

  test "GET /accounts/{account_id}/roles/{role_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRolesRoleId("test", newIamAccountIdentifier())

