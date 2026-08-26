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

suite "container_instances serialization":
  test "round-trips CcContainerInstance":
    let obj = newCcContainerInstance()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcContainerInstance)) == openjson.toJson(obj)

  test "round-trips CcV4BaseResponse":
    let obj = newCcV4BaseResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcV4BaseResponse)) == openjson.toJson(obj)

  test "round-trips CcContainersListContainerInstances":
    let obj = newCcContainersListContainerInstances()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcContainersListContainerInstances)) == openjson.toJson(obj)

  test "round-trips CcV4BaseErrorResponse":
    let obj = newCcV4BaseErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcV4BaseErrorResponse)) == openjson.toJson(obj)

  test "round-trips CcV4BasePaginatedResponse":
    let obj = newCcV4BasePaginatedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcV4BasePaginatedResponse)) == openjson.toJson(obj)

suite "container_instances endpoints":
  test "GET /accounts/{account_id}/containers/applications/{application_id}/instances":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdContainersApplicationsApplicationIdInstances("test", 1, "test")

  test "GET /accounts/{account_id}/containers/applications/{application_id}/instances/{instance_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdContainersApplicationsApplicationIdInstancesInstanceId("test", "test")

