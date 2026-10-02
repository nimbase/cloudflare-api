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

suite "access_user_populations serialization":
  test "round-trips AccessResponseCollection3":
    let obj = newAccessResponseCollection3()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollection3)) == openjson.toJson(obj)

  test "round-trips AccessSingleResponse5":
    let obj = newAccessSingleResponse5()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleResponse5)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessIdResponse":
    let obj = newAccessIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessIdResponse)) == openjson.toJson(obj)

  test "round-trips AccessUserPopulationRequest":
    let obj = newAccessUserPopulationRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessUserPopulationRequest)) == openjson.toJson(obj)

suite "access_user_populations endpoints":
  test "GET /accounts/{account_id}/access/user_populations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessUserPopulations("test", 1, 1)

  test "POST /accounts/{account_id}/access/user_populations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAccessUserPopulations("test", newAccessUserPopulationRequest())

  test "GET /accounts/{account_id}/access/user_populations/{user_population_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessUserPopulationsUserPopulationId("test", "test")

  test "PUT /accounts/{account_id}/access/user_populations/{user_population_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdAccessUserPopulationsUserPopulationId("test", "test", newAccessUserPopulationRequest())

  test "DELETE /accounts/{account_id}/access/user_populations/{user_population_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAccessUserPopulationsUserPopulationId("test", "test")

