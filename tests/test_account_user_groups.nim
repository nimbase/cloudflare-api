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

suite "account_user_groups serialization":
  test "round-trips IamUserGroup":
    let obj = newIamUserGroup()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamUserGroup)) == openjson.toJson(obj)

  test "round-trips IamApiResponseSingleId":
    let obj = newIamApiResponseSingleId()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseSingleId)) == openjson.toJson(obj)

  test "round-trips IamAccountIdentifier":
    let obj = newIamAccountIdentifier()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamAccountIdentifier)) == openjson.toJson(obj)

  test "round-trips IamUpdateUserGroupBody":
    let obj = newIamUpdateUserGroupBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamUpdateUserGroupBody)) == openjson.toJson(obj)

  test "round-trips IamApiResponseCollection":
    let obj = newIamApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips IamApiResponseCommonFailure":
    let obj = newIamApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips IamUserGroupIdentifier":
    let obj = newIamUserGroupIdentifier()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamUserGroupIdentifier)) == openjson.toJson(obj)

  test "round-trips IamCreateUserGroupBody":
    let obj = newIamCreateUserGroupBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamCreateUserGroupBody)) == openjson.toJson(obj)

  test "round-trips IamApiResponseSingle":
    let obj = newIamApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseSingle)) == openjson.toJson(obj)

suite "account_user_groups endpoints":
  test "GET /accounts/{account_id}/iam/user_groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIamUserGroups(newIamAccountIdentifier(), newIamUserGroupIdentifier(), "test", "test", 1.0, 1.0, {})

  test "POST /accounts/{account_id}/iam/user_groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdIamUserGroups(newIamAccountIdentifier(), newIamCreateUserGroupBody())

  test "GET /accounts/{account_id}/iam/user_groups/{user_group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIamUserGroupsUserGroupId(newIamAccountIdentifier(), newIamUserGroupIdentifier())

  test "PUT /accounts/{account_id}/iam/user_groups/{user_group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdIamUserGroupsUserGroupId(newIamAccountIdentifier(), newIamUserGroupIdentifier(), newIamUpdateUserGroupBody())

  test "DELETE /accounts/{account_id}/iam/user_groups/{user_group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdIamUserGroupsUserGroupId(newIamAccountIdentifier(), newIamUserGroupIdentifier())

