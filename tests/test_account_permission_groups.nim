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

suite "account_permission_groups serialization":
  test "round-trips IamSinglePermissionGroupsResponse":
    let obj = newIamSinglePermissionGroupsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamSinglePermissionGroupsResponse)) == openjson.toJson(obj)

  test "round-trips IamAccountIdentifier":
    let obj = newIamAccountIdentifier()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamAccountIdentifier)) == openjson.toJson(obj)

  test "round-trips IamApiResponseCommonFailure":
    let obj = newIamApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips IamCollectionPermissionGroupsResponse":
    let obj = newIamCollectionPermissionGroupsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamCollectionPermissionGroupsResponse)) == openjson.toJson(obj)

  test "round-trips IamPermissionGroupIdentifier":
    let obj = newIamPermissionGroupIdentifier()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamPermissionGroupIdentifier)) == openjson.toJson(obj)

suite "account_permission_groups endpoints":
  test "GET /accounts/{account_id}/iam/permission_groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIamPermissionGroups(newIamAccountIdentifier(), "test", "test", "test", 1.0, 1.0)

  test "GET /accounts/{account_id}/iam/permission_groups/{permission_group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIamPermissionGroupsPermissionGroupId(newIamAccountIdentifier(), newIamPermissionGroupIdentifier())

