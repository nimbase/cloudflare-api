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

suite "infrastructure_access_targets serialization":
  test "round-trips InfraApiResponseCommonFailure":
    let obj = newInfraApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.InfraApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips InfraApiResponseCollection":
    let obj = newInfraApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.InfraApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips InfraTarget":
    let obj = newInfraTarget()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.InfraTarget)) == openjson.toJson(obj)

  test "round-trips InfraIPInfo":
    let obj = newInfraIPInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.InfraIPInfo)) == openjson.toJson(obj)

  test "round-trips InfraApiResponseSingle":
    let obj = newInfraApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.InfraApiResponseSingle)) == openjson.toJson(obj)

suite "infrastructure_access_targets endpoints":
  test "GET /accounts/{account_id}/infrastructure/targets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdInfrastructureTargets("test", "test", "test", "test", "test", "test", "test", "test", "test", "test", @["test"], @["test"], "test", "test", "test", "test", "test", 1, 1, {}, openjson.newJObject())

  test "PUT /accounts/{account_id}/infrastructure/targets/batch":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdInfrastructureTargetsBatch("test")

  test "GET /accounts/{account_id}/infrastructure/targets/{target_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdInfrastructureTargetsTargetId("test", "test")

  test "DELETE /accounts/{account_id}/infrastructure/targets/{target_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdInfrastructureTargetsTargetId("test", "test")

