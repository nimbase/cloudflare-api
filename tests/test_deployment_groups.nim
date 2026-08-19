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

suite "deployment_groups serialization":
  test "round-trips TeamsDevicesV4ResponseMessage":
    let obj = newTeamsDevicesV4ResponseMessage()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesV4ResponseMessage)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesDeploymentGroupUpdateRequest":
    let obj = newTeamsDevicesDeploymentGroupUpdateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesDeploymentGroupUpdateRequest)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesPaginationInfo":
    let obj = newTeamsDevicesPaginationInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesPaginationInfo)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesDeploymentGroup":
    let obj = newTeamsDevicesDeploymentGroup()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesDeploymentGroup)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesDeploymentGroupCreateRequest":
    let obj = newTeamsDevicesDeploymentGroupCreateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesDeploymentGroupCreateRequest)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdDevicesDeploymentGroupsResponse":
    let obj = cloudflare.GetAccountsAccountIdDevicesDeploymentGroupsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdDevicesDeploymentGroupsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdDevicesDeploymentGroupsResponse":
    let obj = cloudflare.PostAccountsAccountIdDevicesDeploymentGroupsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdDevicesDeploymentGroupsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdDevicesDeploymentGroupsGroupIdResponse":
    let obj = cloudflare.GetAccountsAccountIdDevicesDeploymentGroupsGroupIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdDevicesDeploymentGroupsGroupIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdDevicesDeploymentGroupsGroupIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdDevicesDeploymentGroupsGroupIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdDevicesDeploymentGroupsGroupIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdDevicesDeploymentGroupsGroupIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdDevicesDeploymentGroupsGroupIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdDevicesDeploymentGroupsGroupIdResponse)) == openjson.toJson(obj)

suite "deployment_groups endpoints":
  test "GET /accounts/{account_id}/devices/deployment-groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesDeploymentGroups("test", 1, 1)

  test "POST /accounts/{account_id}/devices/deployment-groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDevicesDeploymentGroups("test", newTeamsDevicesDeploymentGroupCreateRequest())

  test "GET /accounts/{account_id}/devices/deployment-groups/{group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesDeploymentGroupsGroupId("test", "test")

  test "DELETE /accounts/{account_id}/devices/deployment-groups/{group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDevicesDeploymentGroupsGroupId("test", "test")

  test "PATCH /accounts/{account_id}/devices/deployment-groups/{group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdDevicesDeploymentGroupsGroupId("test", "test", newTeamsDevicesDeploymentGroupUpdateRequest())

