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

suite "access_groups serialization":
  test "round-trips AccessSingleResponse4":
    let obj = newAccessSingleResponse4()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleResponse4)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessResponseCollection2":
    let obj = newAccessResponseCollection2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollection2)) == openjson.toJson(obj)

  test "round-trips AccessIdResponse":
    let obj = newAccessIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessIdResponse)) == openjson.toJson(obj)

suite "access_groups endpoints":
  test "GET /accounts/{account_id}/access/groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessGroups("test", "test", "test", 1, 1)

  test "GET /accounts/{account_id}/access/groups/{group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessGroupsGroupId("test", "test")

  test "DELETE /accounts/{account_id}/access/groups/{group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAccessGroupsGroupId("test", "test")

