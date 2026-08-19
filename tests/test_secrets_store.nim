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

suite "secrets_store serialization":
  test "round-trips SecretsStoreDuplicateSecretObject":
    let obj = newSecretsStoreDuplicateSecretObject()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecretsStoreDuplicateSecretObject)) == openjson.toJson(obj)

  test "round-trips SecretsStoreDeleteSecretsRequest":
    let obj = newSecretsStoreDeleteSecretsRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecretsStoreDeleteSecretsRequest)) == openjson.toJson(obj)

  test "round-trips SecretsStoreStoreResponse":
    let obj = newSecretsStoreStoreResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecretsStoreStoreResponse)) == openjson.toJson(obj)

  test "round-trips SecretsStoreCreateStoreObject":
    let obj = newSecretsStoreCreateStoreObject()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecretsStoreCreateStoreObject)) == openjson.toJson(obj)

  test "round-trips SecretsStoreSecretsResponseCollection":
    let obj = newSecretsStoreSecretsResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecretsStoreSecretsResponseCollection)) == openjson.toJson(obj)

  test "round-trips SecretsStorePatchSecretObject":
    let obj = newSecretsStorePatchSecretObject()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecretsStorePatchSecretObject)) == openjson.toJson(obj)

  test "round-trips SecretsStoreCreateSecretObject":
    let obj = newSecretsStoreCreateSecretObject()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecretsStoreCreateSecretObject)) == openjson.toJson(obj)

  test "round-trips SecretsStoreSecretResponse":
    let obj = newSecretsStoreSecretResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecretsStoreSecretResponse)) == openjson.toJson(obj)

  test "round-trips SecretsStoreQuotaResponse":
    let obj = newSecretsStoreQuotaResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecretsStoreQuotaResponse)) == openjson.toJson(obj)

  test "round-trips SecretsStoreDeleteResponse":
    let obj = newSecretsStoreDeleteResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecretsStoreDeleteResponse)) == openjson.toJson(obj)

  test "round-trips SecretsStoreApiResponseCommonFailure":
    let obj = newSecretsStoreApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecretsStoreApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips SecretsStoreStoresResponseCollection":
    let obj = newSecretsStoreStoresResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecretsStoreStoresResponseCollection)) == openjson.toJson(obj)

suite "secrets_store endpoints":
  test "GET /accounts/{account_id}/secrets_store/quota":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSecretsStoreQuota("test")

  test "GET /accounts/{account_id}/secrets_store/stores":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSecretsStoreStores("test", {}, 1, 1, {})

  test "POST /accounts/{account_id}/secrets_store/stores":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdSecretsStoreStores("test", newSecretsStoreCreateStoreObject())

  test "GET /accounts/{account_id}/secrets_store/stores/{store_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSecretsStoreStoresStoreId("test", "test")

  test "DELETE /accounts/{account_id}/secrets_store/stores/{store_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdSecretsStoreStoresStoreId("test", "test", true)

  test "POST /accounts/{account_id}/secrets_store/stores/{store_id}/secrets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdSecretsStoreStoresStoreIdSecrets("test", "test")

  test "DELETE /accounts/{account_id}/secrets_store/stores/{store_id}/secrets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdSecretsStoreStoresStoreIdSecrets("test", "test", newSecretsStoreDeleteSecretsRequest())

  test "GET /accounts/{account_id}/secrets_store/stores/{store_id}/secrets/{secret_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSecretsStoreStoresStoreIdSecretsSecretId("test", "test", "test")

  test "DELETE /accounts/{account_id}/secrets_store/stores/{store_id}/secrets/{secret_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdSecretsStoreStoresStoreIdSecretsSecretId("test", "test", "test")

  test "PATCH /accounts/{account_id}/secrets_store/stores/{store_id}/secrets/{secret_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdSecretsStoreStoresStoreIdSecretsSecretId("test", "test", "test", newSecretsStorePatchSecretObject())

  test "POST /accounts/{account_id}/secrets_store/stores/{store_id}/secrets/{secret_id}/duplicate":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdSecretsStoreStoresStoreIdSecretsSecretIdDuplicate("test", "test", "test", newSecretsStoreDuplicateSecretObject())

