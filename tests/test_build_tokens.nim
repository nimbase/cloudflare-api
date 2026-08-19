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

suite "build_tokens serialization":
  test "round-trips BuildsListTokensResponse":
    let obj = newBuildsListTokensResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsListTokensResponse)) == openjson.toJson(obj)

  test "round-trips BuildsErrorResponse":
    let obj = newBuildsErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsErrorResponse)) == openjson.toJson(obj)

  test "round-trips BuildsCreateBuildTokenResponse":
    let obj = newBuildsCreateBuildTokenResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsCreateBuildTokenResponse)) == openjson.toJson(obj)

  test "round-trips BuildsCreateBuildTokenRequest":
    let obj = newBuildsCreateBuildTokenRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsCreateBuildTokenRequest)) == openjson.toJson(obj)

  test "round-trips BuildsAPIResponse":
    let obj = newBuildsAPIResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsAPIResponse)) == openjson.toJson(obj)

  test "round-trips BuildsPaginationInfo":
    let obj = newBuildsPaginationInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsPaginationInfo)) == openjson.toJson(obj)

suite "build_tokens endpoints":
  test "GET /accounts/{account_id}/builds/tokens":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBuildsTokens("test", 1, 1)

  test "POST /accounts/{account_id}/builds/tokens":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdBuildsTokens("test", newBuildsCreateBuildTokenRequest())

  test "DELETE /accounts/{account_id}/builds/tokens/{build_token_uuid}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdBuildsTokensBuildTokenUuid("test", "test")

