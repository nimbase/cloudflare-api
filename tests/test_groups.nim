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

suite "groups serialization":
  test "round-trips PostAccountsAccountIdCloudforceOneEventsDatasetGroupsResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsDatasetGroupsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsDatasetGroupsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdResponse":
    let obj = cloudflare.PutAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdMembersResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdMembersResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdMembersResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdMembersMemberIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdMembersMemberIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdMembersMemberIdResponse)) == openjson.toJson(obj)

suite "groups endpoints":
  test "GET /accounts/{account_id}/cloudforce-one/events/dataset/-/groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsDatasetGroups("test")

  test "GET /accounts/{account_id}/cloudforce-one/events/dataset/-/groups/{group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupId("test", "test")

  test "DELETE /accounts/{account_id}/cloudforce-one/events/dataset/-/groups/{group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupId("test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/events/dataset/-/groups/{group_id}/members":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdMembers("test", "test")

  test "DELETE /accounts/{account_id}/cloudforce-one/events/dataset/-/groups/{group_id}/members/{member_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdMembersMemberId("test", "test", "test")

