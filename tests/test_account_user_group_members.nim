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

suite "account_user_group_members serialization":
  test "round-trips IamUserGroupMemberIdentifier":
    let obj = newIamUserGroupMemberIdentifier()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamUserGroupMemberIdentifier)) == openjson.toJson(obj)

  test "round-trips IamAccountIdentifier":
    let obj = newIamAccountIdentifier()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamAccountIdentifier)) == openjson.toJson(obj)

  test "round-trips IamApiResponseCollection":
    let obj = newIamApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips IamApiResponseCommonFailure":
    let obj = newIamApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips IamUserGroupMember":
    let obj = newIamUserGroupMember()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamUserGroupMember)) == openjson.toJson(obj)

  test "round-trips IamUserGroupIdentifier":
    let obj = newIamUserGroupIdentifier()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamUserGroupIdentifier)) == openjson.toJson(obj)

  test "round-trips IamApiResponseSingle":
    let obj = newIamApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips IamUserGroupMemberDetailed":
    let obj = newIamUserGroupMemberDetailed()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamUserGroupMemberDetailed)) == openjson.toJson(obj)

suite "account_user_group_members endpoints":
  test "GET /accounts/{account_id}/iam/user_groups/{user_group_id}/members":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIamUserGroupsUserGroupIdMembers(newIamAccountIdentifier(), newIamUserGroupIdentifier(), 1.0, 1.0, "test", {})

  test "POST /accounts/{account_id}/iam/user_groups/{user_group_id}/members":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdIamUserGroupsUserGroupIdMembers(newIamAccountIdentifier(), newIamUserGroupIdentifier())

  test "PUT /accounts/{account_id}/iam/user_groups/{user_group_id}/members":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdIamUserGroupsUserGroupIdMembers(newIamAccountIdentifier(), newIamUserGroupIdentifier())

  test "GET /accounts/{account_id}/iam/user_groups/{user_group_id}/members/{member_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIamUserGroupsUserGroupIdMembersMemberId(newIamAccountIdentifier(), newIamUserGroupIdentifier(), newIamUserGroupMemberIdentifier())

  test "DELETE /accounts/{account_id}/iam/user_groups/{user_group_id}/members/{member_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdIamUserGroupsUserGroupIdMembersMemberId(newIamAccountIdentifier(), newIamUserGroupIdentifier(), newIamUserGroupMemberIdentifier())

