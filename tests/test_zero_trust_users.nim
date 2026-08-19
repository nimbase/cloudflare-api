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

suite "zero_trust_users serialization":
  test "round-trips AccessDeleteAuthenticatorResponse":
    let obj = newAccessDeleteAuthenticatorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessDeleteAuthenticatorResponse)) == openjson.toJson(obj)

  test "round-trips AccessActiveSessionResponse":
    let obj = newAccessActiveSessionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessActiveSessionResponse)) == openjson.toJson(obj)

  test "round-trips AccessSingleUserResponse":
    let obj = newAccessSingleUserResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleUserResponse)) == openjson.toJson(obj)

  test "round-trips AccessFailedLoginResponse":
    let obj = newAccessFailedLoginResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessFailedLoginResponse)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessActiveSessionsResponse":
    let obj = newAccessActiveSessionsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessActiveSessionsResponse)) == openjson.toJson(obj)

  test "round-trips AccessLastSeenIdentityResponse":
    let obj = newAccessLastSeenIdentityResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessLastSeenIdentityResponse)) == openjson.toJson(obj)

  test "round-trips AccessDeleteUserResponse":
    let obj = newAccessDeleteUserResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessDeleteUserResponse)) == openjson.toJson(obj)

  test "round-trips AccessResponseCollection24":
    let obj = newAccessResponseCollection24()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollection24)) == openjson.toJson(obj)

suite "zero_trust_users endpoints":
  test "GET /accounts/{account_id}/access/users":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessUsers("test", "test", "test", "test", 1, 1)

  test "GET /accounts/{account_id}/access/users/{user_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessUsersUserId("test", "test")

  test "DELETE /accounts/{account_id}/access/users/{user_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAccessUsersUserId("test", "test")

  test "GET /accounts/{account_id}/access/users/{user_id}/active_sessions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessUsersUserIdActiveSessions("test", "test")

  test "GET /accounts/{account_id}/access/users/{user_id}/active_sessions/{nonce}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessUsersUserIdActiveSessionsNonce("test", "test", "test")

  test "GET /accounts/{account_id}/access/users/{user_id}/failed_logins":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessUsersUserIdFailedLogins("test", "test")

  test "GET /accounts/{account_id}/access/users/{user_id}/last_seen_identity":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessUsersUserIdLastSeenIdentity("test", "test")

  test "DELETE /accounts/{account_id}/access/users/{user_id}/mfa_authenticators/{authenticator_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAccessUsersUserIdMfaAuthenticatorsAuthenticatorId("test", "test", "test")

