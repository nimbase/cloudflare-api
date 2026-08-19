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

suite "scim_users serialization":
  test "round-trips IamScimUser":
    let obj = newIamScimUser()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamScimUser)) == openjson.toJson(obj)

  test "round-trips IamAccountIdentifier":
    let obj = newIamAccountIdentifier()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamAccountIdentifier)) == openjson.toJson(obj)

  test "round-trips IamScimUserCreateRequest":
    let obj = newIamScimUserCreateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamScimUserCreateRequest)) == openjson.toJson(obj)

  test "round-trips IamScimPatchOpRequest":
    let obj = newIamScimPatchOpRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamScimPatchOpRequest)) == openjson.toJson(obj)

  test "round-trips IamScimUserListResponse":
    let obj = newIamScimUserListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamScimUserListResponse)) == openjson.toJson(obj)

  test "round-trips IamScimUserReplaceRequest":
    let obj = newIamScimUserReplaceRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamScimUserReplaceRequest)) == openjson.toJson(obj)

  test "round-trips IamScimErrorResponse":
    let obj = newIamScimErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamScimErrorResponse)) == openjson.toJson(obj)

suite "scim_users endpoints":
  test "GET /accounts/{account_id}/scim/v2/Users":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdScimV2Users(newIamAccountIdentifier(), 1, 1, "test")

  test "POST /accounts/{account_id}/scim/v2/Users":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdScimV2Users(newIamAccountIdentifier())

  test "GET /accounts/{account_id}/scim/v2/Users/{user_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdScimV2UsersUserId(newIamAccountIdentifier(), "test")

  test "PUT /accounts/{account_id}/scim/v2/Users/{user_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdScimV2UsersUserId(newIamAccountIdentifier(), "test")

  test "DELETE /accounts/{account_id}/scim/v2/Users/{user_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdScimV2UsersUserId(newIamAccountIdentifier(), "test")

  test "PATCH /accounts/{account_id}/scim/v2/Users/{user_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdScimV2UsersUserId(newIamAccountIdentifier(), "test")

