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

suite "oauth_clients serialization":
  test "round-trips IamApiResponseSingleId":
    let obj = newIamApiResponseSingleId()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseSingleId)) == openjson.toJson(obj)

  test "round-trips IamAccountIdentifier":
    let obj = newIamAccountIdentifier()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamAccountIdentifier)) == openjson.toJson(obj)

  test "round-trips IamOauthClientRotateSecretResponse":
    let obj = newIamOauthClientRotateSecretResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamOauthClientRotateSecretResponse)) == openjson.toJson(obj)

  test "round-trips IamOauthClientCreateRequest":
    let obj = newIamOauthClientCreateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamOauthClientCreateRequest)) == openjson.toJson(obj)

  test "round-trips IamOauthClientUpdateRequest":
    let obj = newIamOauthClientUpdateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamOauthClientUpdateRequest)) == openjson.toJson(obj)

  test "round-trips IamApiResponseCommonFailure":
    let obj = newIamApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips IamSingleOauthClientCreateResponse":
    let obj = newIamSingleOauthClientCreateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamSingleOauthClientCreateResponse)) == openjson.toJson(obj)

  test "round-trips IamCollectionOauthClientResponse":
    let obj = newIamCollectionOauthClientResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamCollectionOauthClientResponse)) == openjson.toJson(obj)

  test "round-trips IamCollectionOauthScopesResponse":
    let obj = newIamCollectionOauthScopesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamCollectionOauthScopesResponse)) == openjson.toJson(obj)

  test "round-trips IamSingleOauthClientResponse":
    let obj = newIamSingleOauthClientResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamSingleOauthClientResponse)) == openjson.toJson(obj)

suite "oauth_clients endpoints":
  test "GET /accounts/{account_id}/oauth_clients":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdOauthClients(newIamAccountIdentifier())

  test "POST /accounts/{account_id}/oauth_clients":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdOauthClients(newIamAccountIdentifier(), newIamOauthClientCreateRequest())

  test "GET /accounts/{account_id}/oauth_clients/{oauth_client_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdOauthClientsOauthClientId(newIamAccountIdentifier(), "test")

  test "DELETE /accounts/{account_id}/oauth_clients/{oauth_client_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdOauthClientsOauthClientId(newIamAccountIdentifier(), "test")

  test "PATCH /accounts/{account_id}/oauth_clients/{oauth_client_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdOauthClientsOauthClientId(newIamAccountIdentifier(), "test", newIamOauthClientUpdateRequest())

  test "POST /accounts/{account_id}/oauth_clients/{oauth_client_id}/rotate_secret":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdOauthClientsOauthClientIdRotateSecret(newIamAccountIdentifier(), "test")

  test "DELETE /accounts/{account_id}/oauth_clients/{oauth_client_id}/rotate_secret":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdOauthClientsOauthClientIdRotateSecret(newIamAccountIdentifier(), "test")

  test "GET /oauth/scopes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getOauthScopes()

