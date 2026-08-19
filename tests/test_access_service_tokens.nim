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

suite "access_service_tokens serialization":
  test "round-trips AccessResponseCollection3":
    let obj = newAccessResponseCollection3()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollection3)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessCreateResponse":
    let obj = newAccessCreateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessCreateResponse)) == openjson.toJson(obj)

  test "round-trips AccessSingleResponse2":
    let obj = newAccessSingleResponse2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleResponse2)) == openjson.toJson(obj)

suite "access_service_tokens endpoints":
  test "GET /accounts/{account_id}/access/service_tokens":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessServiceTokens("test", "test", "test", 1, 1)

  test "GET /accounts/{account_id}/access/service_tokens/{service_token_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessServiceTokensServiceTokenId("test", "test")

  test "DELETE /accounts/{account_id}/access/service_tokens/{service_token_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAccessServiceTokensServiceTokenId("test", "test")

  test "POST /accounts/{account_id}/access/service_tokens/{service_token_id}/refresh":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAccessServiceTokensServiceTokenIdRefresh("test", "test")

