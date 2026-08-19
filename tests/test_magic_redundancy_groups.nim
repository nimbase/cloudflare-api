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

suite "magic_redundancy_groups serialization":
  test "round-trips MagicDeleteRedundancyGroupResponse":
    let obj = newMagicDeleteRedundancyGroupResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicDeleteRedundancyGroupResponse)) == openjson.toJson(obj)

  test "round-trips MagicRedundancyGroupSingleResponse":
    let obj = newMagicRedundancyGroupSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicRedundancyGroupSingleResponse)) == openjson.toJson(obj)

  test "round-trips MagicRedundancyGroupWithMembersResponse":
    let obj = newMagicRedundancyGroupWithMembersResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicRedundancyGroupWithMembersResponse)) == openjson.toJson(obj)

  test "round-trips MagicCreateRedundancyGroupRequest":
    let obj = newMagicCreateRedundancyGroupRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicCreateRedundancyGroupRequest)) == openjson.toJson(obj)

  test "round-trips MagicApiResponseCommonFailure":
    let obj = newMagicApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips MagicRedundancyGroupsCollectionResponse":
    let obj = newMagicRedundancyGroupsCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicRedundancyGroupsCollectionResponse)) == openjson.toJson(obj)

suite "magic_redundancy_groups endpoints":
  test "GET /accounts/{account_id}/magic/redundancy_groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicRedundancyGroups("test")

  test "POST /accounts/{account_id}/magic/redundancy_groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicRedundancyGroups("test", newMagicCreateRedundancyGroupRequest())

  test "GET /accounts/{account_id}/magic/redundancy_groups/{redundancy_group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicRedundancyGroupsRedundancyGroupId("test", "test")

  test "PUT /accounts/{account_id}/magic/redundancy_groups/{redundancy_group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMagicRedundancyGroupsRedundancyGroupId("test", "test", newMagicCreateRedundancyGroupRequest())

  test "DELETE /accounts/{account_id}/magic/redundancy_groups/{redundancy_group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicRedundancyGroupsRedundancyGroupId("test", "test")

