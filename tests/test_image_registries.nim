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

suite "image_registries serialization":
  test "round-trips CcContainersDeleteImageRegistryResponseBody":
    let obj = newCcContainersDeleteImageRegistryResponseBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcContainersDeleteImageRegistryResponseBody)) == openjson.toJson(obj)

  test "round-trips CcImageRegistryCredentialsConfiguration":
    let obj = newCcImageRegistryCredentialsConfiguration()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcImageRegistryCredentialsConfiguration)) == openjson.toJson(obj)

  test "round-trips CcContainersAccountRegistryToken":
    let obj = newCcContainersAccountRegistryToken()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcContainersAccountRegistryToken)) == openjson.toJson(obj)

  test "round-trips CcV4BaseResponse":
    let obj = newCcV4BaseResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcV4BaseResponse)) == openjson.toJson(obj)

  test "round-trips CcCustomerImageRegistry":
    let obj = newCcCustomerImageRegistry()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcCustomerImageRegistry)) == openjson.toJson(obj)

  test "round-trips CcV4BaseErrorResponse":
    let obj = newCcV4BaseErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcV4BaseErrorResponse)) == openjson.toJson(obj)

  test "round-trips CcContainersCreateImageRegistryRequestBody":
    let obj = newCcContainersCreateImageRegistryRequestBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcContainersCreateImageRegistryRequestBody)) == openjson.toJson(obj)

suite "image_registries endpoints":
  test "GET /accounts/{account_id}/containers/registries":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdContainersRegistries()

  test "POST /accounts/{account_id}/containers/registries":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdContainersRegistries(newCcContainersCreateImageRegistryRequestBody())

  test "DELETE /accounts/{account_id}/containers/registries/{domain}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdContainersRegistriesDomain("test")

  test "POST /accounts/{account_id}/containers/registries/{domain}/credentials":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdContainersRegistriesDomainCredentials("test", newCcImageRegistryCredentialsConfiguration())

