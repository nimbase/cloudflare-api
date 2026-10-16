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

suite "cws_basic_auth_credentials serialization":
  test "round-trips CwsPageResponseBasicAuthCredential":
    let obj = newCwsPageResponseBasicAuthCredential()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsPageResponseBasicAuthCredential)) == openjson.toJson(obj)

  test "round-trips CwsPageResponseBasicAuthSecretResponse":
    let obj = newCwsPageResponseBasicAuthSecretResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsPageResponseBasicAuthSecretResponse)) == openjson.toJson(obj)

  test "round-trips CwsResponseBasicAuthSecretResponse":
    let obj = newCwsResponseBasicAuthSecretResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsResponseBasicAuthSecretResponse)) == openjson.toJson(obj)

  test "round-trips CwsCreateBasicAuthCredentialInputBody":
    let obj = newCwsCreateBasicAuthCredentialInputBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsCreateBasicAuthCredentialInputBody)) == openjson.toJson(obj)

  test "round-trips CwsErrorResponse":
    let obj = newCwsErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsErrorResponse)) == openjson.toJson(obj)

  test "round-trips CwsResponseBasicAuthCredential":
    let obj = newCwsResponseBasicAuthCredential()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsResponseBasicAuthCredential)) == openjson.toJson(obj)

  test "round-trips CwsCreateBasicAuthSecretBody":
    let obj = newCwsCreateBasicAuthSecretBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsCreateBasicAuthSecretBody)) == openjson.toJson(obj)

  test "round-trips CwsResponseDeletedResult":
    let obj = newCwsResponseDeletedResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsResponseDeletedResult)) == openjson.toJson(obj)

suite "cws_basic_auth_credentials endpoints":
  test "GET /accounts/{account_id}/cws/basic-auth-credentials":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCwsBasicAuthCredentials("test", "test", 1, orderUsername, directionAsc, "test", "test")

  test "POST /accounts/{account_id}/cws/basic-auth-credentials":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCwsBasicAuthCredentials("test", newCwsCreateBasicAuthCredentialInputBody())

  test "GET /accounts/{account_id}/cws/basic-auth-credentials/{credential_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCwsBasicAuthCredentialsCredentialId("test", "test")

  test "DELETE /accounts/{account_id}/cws/basic-auth-credentials/{credential_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCwsBasicAuthCredentialsCredentialId("test", "test")

  test "GET /accounts/{account_id}/cws/basic-auth-credentials/{credential_id}/secrets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCwsBasicAuthCredentialsCredentialIdSecrets("test", "test", "test", 1, orderUsername, directionAsc)

  test "POST /accounts/{account_id}/cws/basic-auth-credentials/{credential_id}/secrets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCwsBasicAuthCredentialsCredentialIdSecrets("test", "test", newCwsCreateBasicAuthSecretBody())

  test "GET /accounts/{account_id}/cws/basic-auth-credentials/{credential_id}/secrets/{secret_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCwsBasicAuthCredentialsCredentialIdSecretsSecretId("test", "test", "test")

  test "DELETE /accounts/{account_id}/cws/basic-auth-credentials/{credential_id}/secrets/{secret_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCwsBasicAuthCredentialsCredentialIdSecretsSecretId("test", "test", "test")

