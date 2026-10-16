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

suite "access_user_population_users serialization":
  test "round-trips AccessScimUser":
    let obj = newAccessScimUser()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessScimUser)) == openjson.toJson(obj)

  test "round-trips AccessScimPatchRequest":
    let obj = newAccessScimPatchRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessScimPatchRequest)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessScimUserCollectionResponse":
    let obj = newAccessScimUserCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessScimUserCollectionResponse)) == openjson.toJson(obj)

  test "round-trips AccessScimUserSingleResponse":
    let obj = newAccessScimUserSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessScimUserSingleResponse)) == openjson.toJson(obj)

suite "access_user_population_users endpoints":
  test "GET /accounts/{account_id}/access/user_populations/{user_population_id}/users":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessUserPopulationsUserPopulationIdUsers("test", "test", "test", 1, 1, "test", "test")

  test "POST /accounts/{account_id}/access/user_populations/{user_population_id}/users":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAccessUserPopulationsUserPopulationIdUsers("test", "test", newAccessScimUser())

  test "GET /accounts/{account_id}/access/user_populations/{user_population_id}/users/{user_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessUserPopulationsUserPopulationIdUsersUserId("test", "test", "test", "test", "test")

  test "PUT /accounts/{account_id}/access/user_populations/{user_population_id}/users/{user_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdAccessUserPopulationsUserPopulationIdUsersUserId("test", "test", "test", newAccessScimUser())

  test "DELETE /accounts/{account_id}/access/user_populations/{user_population_id}/users/{user_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAccessUserPopulationsUserPopulationIdUsersUserId("test", "test", "test")

  test "PATCH /accounts/{account_id}/access/user_populations/{user_population_id}/users/{user_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdAccessUserPopulationsUserPopulationIdUsersUserId("test", "test", "test", newAccessScimPatchRequest())

