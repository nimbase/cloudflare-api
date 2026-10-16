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

suite "cws_workloads serialization":
  test "round-trips CwsPageResponseWorkload":
    let obj = newCwsPageResponseWorkload()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsPageResponseWorkload)) == openjson.toJson(obj)

  test "round-trips CwsResponseWorkload":
    let obj = newCwsResponseWorkload()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsResponseWorkload)) == openjson.toJson(obj)

  test "round-trips CwsErrorResponse":
    let obj = newCwsErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsErrorResponse)) == openjson.toJson(obj)

  test "round-trips CwsUpdateWorkloadInputBody":
    let obj = newCwsUpdateWorkloadInputBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsUpdateWorkloadInputBody)) == openjson.toJson(obj)

  test "round-trips CwsCreateWorkloadInputBody":
    let obj = newCwsCreateWorkloadInputBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsCreateWorkloadInputBody)) == openjson.toJson(obj)

  test "round-trips CwsResponseDeletedResult":
    let obj = newCwsResponseDeletedResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsResponseDeletedResult)) == openjson.toJson(obj)

suite "cws_workloads endpoints":
  test "GET /accounts/{account_id}/cws/workloads":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCwsWorkloads("test", "test", 1, orderName, directionAsc, "test", "test")

  test "POST /accounts/{account_id}/cws/workloads":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCwsWorkloads("test", newCwsCreateWorkloadInputBody())

  test "GET /accounts/{account_id}/cws/workloads/{workload_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCwsWorkloadsWorkloadId("test", "test")

  test "PUT /accounts/{account_id}/cws/workloads/{workload_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdCwsWorkloadsWorkloadId("test", "test", newCwsUpdateWorkloadInputBody())

  test "DELETE /accounts/{account_id}/cws/workloads/{workload_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCwsWorkloadsWorkloadId("test", "test")

