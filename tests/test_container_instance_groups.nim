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

suite "container_instance_groups serialization":
  test "round-trips CcContainerInstanceGroup":
    let obj = newCcContainerInstanceGroup()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcContainerInstanceGroup)) == openjson.toJson(obj)

  test "round-trips CcPutContainerInstanceGroupRequestBody":
    let obj = newCcPutContainerInstanceGroupRequestBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcPutContainerInstanceGroupRequestBody)) == openjson.toJson(obj)

  test "round-trips CcV4BaseResponse":
    let obj = newCcV4BaseResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcV4BaseResponse)) == openjson.toJson(obj)

  test "round-trips CcV4BaseErrorResponse":
    let obj = newCcV4BaseErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcV4BaseErrorResponse)) == openjson.toJson(obj)

  test "round-trips CcEmptyResponse":
    let obj = newCcEmptyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcEmptyResponse)) == openjson.toJson(obj)

suite "container_instance_groups endpoints":
  test "GET /accounts/{account_id}/containers/instance-groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdContainersInstanceGroups()

  test "GET /accounts/{account_id}/containers/instance-groups/{namespace_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdContainersInstanceGroupsNamespaceId("test")

  test "PUT /accounts/{account_id}/containers/instance-groups/{namespace_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdContainersInstanceGroupsNamespaceId("test", newCcPutContainerInstanceGroupRequestBody())

  test "DELETE /accounts/{account_id}/containers/instance-groups/{namespace_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdContainersInstanceGroupsNamespaceId("test")

