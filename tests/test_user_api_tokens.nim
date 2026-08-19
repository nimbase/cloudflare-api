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

suite "user_api_tokens serialization":
  test "round-trips IamCollectionTokensResponse":
    let obj = newIamCollectionTokensResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamCollectionTokensResponse)) == openjson.toJson(obj)

  test "round-trips IamApiResponseSingleId":
    let obj = newIamApiResponseSingleId()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseSingleId)) == openjson.toJson(obj)

  test "round-trips IamTokenBody":
    let obj = newIamTokenBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamTokenBody)) == openjson.toJson(obj)

  test "round-trips IamApiResponseCommonFailure":
    let obj = newIamApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips IamCreatePayload":
    let obj = newIamCreatePayload()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamCreatePayload)) == openjson.toJson(obj)

  test "round-trips IamResponseSingleValue":
    let obj = newIamResponseSingleValue()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamResponseSingleValue)) == openjson.toJson(obj)

  test "round-trips IamSingleTokenCreateResponse":
    let obj = newIamSingleTokenCreateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamSingleTokenCreateResponse)) == openjson.toJson(obj)

  test "round-trips IamSingleTokenResponse":
    let obj = newIamSingleTokenResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamSingleTokenResponse)) == openjson.toJson(obj)

  test "round-trips IamPermissionsGroupResponseCollection":
    let obj = newIamPermissionsGroupResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamPermissionsGroupResponseCollection)) == openjson.toJson(obj)

  test "round-trips IamTokenVerifyResponseSingleSegment":
    let obj = newIamTokenVerifyResponseSingleSegment()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamTokenVerifyResponseSingleSegment)) == openjson.toJson(obj)

suite "user_api_tokens endpoints":
  test "GET /user/tokens":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUserTokens(1.0, 1.0, {}, true)

  test "POST /user/tokens":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postUserTokens(newIamCreatePayload())

  test "GET /user/tokens/permission_groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUserTokensPermissionGroups("test", "test")

  test "GET /user/tokens/verify":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUserTokensVerify()

  test "GET /user/tokens/{token_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUserTokensTokenId("test")

  test "PUT /user/tokens/{token_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putUserTokensTokenId("test", newIamTokenBody())

  test "DELETE /user/tokens/{token_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteUserTokensTokenId("test")

  test "PUT /user/tokens/{token_id}/value":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putUserTokensTokenIdValue("test")

