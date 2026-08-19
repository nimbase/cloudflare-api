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

suite "account_owned_api_tokens serialization":
  test "round-trips IamCollectionTokensResponse":
    let obj = newIamCollectionTokensResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamCollectionTokensResponse)) == openjson.toJson(obj)

  test "round-trips IamApiResponseSingleId":
    let obj = newIamApiResponseSingleId()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseSingleId)) == openjson.toJson(obj)

  test "round-trips IamAccountIdentifier":
    let obj = newIamAccountIdentifier()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamAccountIdentifier)) == openjson.toJson(obj)

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

suite "account_owned_api_tokens endpoints":
  test "GET /accounts/{account_id}/tokens":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdTokens(newIamAccountIdentifier(), 1.0, 1.0, {}, true)

  test "POST /accounts/{account_id}/tokens":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdTokens(newIamAccountIdentifier(), newIamCreatePayload())

  test "GET /accounts/{account_id}/tokens/permission_groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdTokensPermissionGroups(newIamAccountIdentifier(), "test", "test")

  test "GET /accounts/{account_id}/tokens/verify":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdTokensVerify(newIamAccountIdentifier())

  test "GET /accounts/{account_id}/tokens/{token_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdTokensTokenId(newIamAccountIdentifier(), "test")

  test "PUT /accounts/{account_id}/tokens/{token_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdTokensTokenId(newIamAccountIdentifier(), "test", newIamTokenBody())

  test "DELETE /accounts/{account_id}/tokens/{token_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdTokensTokenId(newIamAccountIdentifier(), "test")

  test "PUT /accounts/{account_id}/tokens/{token_id}/value":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdTokensTokenIdValue(newIamAccountIdentifier(), "test")

