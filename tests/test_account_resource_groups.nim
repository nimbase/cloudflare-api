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

suite "account_resource_groups serialization":
  test "round-trips IamApiResponseSingleId":
    let obj = newIamApiResponseSingleId()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseSingleId)) == openjson.toJson(obj)

  test "round-trips IamAccountIdentifier":
    let obj = newIamAccountIdentifier()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamAccountIdentifier)) == openjson.toJson(obj)

  test "round-trips IamResourceGroup":
    let obj = newIamResourceGroup()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamResourceGroup)) == openjson.toJson(obj)

  test "round-trips IamApiResponseCommon":
    let obj = newIamApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips IamRequestCreateResourceGroup":
    let obj = newIamRequestCreateResourceGroup()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamRequestCreateResourceGroup)) == openjson.toJson(obj)

  test "round-trips IamApiResponseCommonFailure":
    let obj = newIamApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips IamRequestUpdateResourceGroup":
    let obj = newIamRequestUpdateResourceGroup()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamRequestUpdateResourceGroup)) == openjson.toJson(obj)

  test "round-trips IamResourceGroupIdentifier":
    let obj = newIamResourceGroupIdentifier()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamResourceGroupIdentifier)) == openjson.toJson(obj)

  test "round-trips IamApiResponseSingle":
    let obj = newIamApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseSingle)) == openjson.toJson(obj)

suite "account_resource_groups endpoints":
  test "GET /accounts/{account_id}/iam/resource_groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIamResourceGroups(newIamAccountIdentifier(), openjson.newJObject(), "test")

  test "POST /accounts/{account_id}/iam/resource_groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdIamResourceGroups(newIamAccountIdentifier(), newIamRequestCreateResourceGroup())

  test "GET /accounts/{account_id}/iam/resource_groups/{resource_group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIamResourceGroupsResourceGroupId(newIamAccountIdentifier(), newIamResourceGroupIdentifier())

  test "PUT /accounts/{account_id}/iam/resource_groups/{resource_group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdIamResourceGroupsResourceGroupId(newIamAccountIdentifier(), newIamResourceGroupIdentifier(), newIamRequestUpdateResourceGroup())

  test "DELETE /accounts/{account_id}/iam/resource_groups/{resource_group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdIamResourceGroupsResourceGroupId(newIamAccountIdentifier(), newIamResourceGroupIdentifier())

