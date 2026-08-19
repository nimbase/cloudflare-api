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

suite "scim_groups serialization":
  test "round-trips IamScimGroupCreateRequest":
    let obj = newIamScimGroupCreateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamScimGroupCreateRequest)) == openjson.toJson(obj)

  test "round-trips IamAccountIdentifier":
    let obj = newIamAccountIdentifier()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamAccountIdentifier)) == openjson.toJson(obj)

  test "round-trips IamScimGroupListResponse":
    let obj = newIamScimGroupListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamScimGroupListResponse)) == openjson.toJson(obj)

  test "round-trips IamScimGroup":
    let obj = newIamScimGroup()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamScimGroup)) == openjson.toJson(obj)

  test "round-trips IamScimGroupPatchOpRequest":
    let obj = newIamScimGroupPatchOpRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamScimGroupPatchOpRequest)) == openjson.toJson(obj)

  test "round-trips IamScimErrorResponse":
    let obj = newIamScimErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamScimErrorResponse)) == openjson.toJson(obj)

suite "scim_groups endpoints":
  test "GET /accounts/{account_id}/scim/v2/Groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdScimV2Groups(newIamAccountIdentifier(), 1, 1, "test")

  test "POST /accounts/{account_id}/scim/v2/Groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdScimV2Groups(newIamAccountIdentifier())

  test "GET /accounts/{account_id}/scim/v2/Groups/{group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdScimV2GroupsGroupId(newIamAccountIdentifier(), "test")

  test "DELETE /accounts/{account_id}/scim/v2/Groups/{group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdScimV2GroupsGroupId(newIamAccountIdentifier(), "test")

  test "PATCH /accounts/{account_id}/scim/v2/Groups/{group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdScimV2GroupsGroupId(newIamAccountIdentifier(), "test")

