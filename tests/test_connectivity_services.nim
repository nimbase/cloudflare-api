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

suite "connectivity_services serialization":
  test "round-trips InfraApiResponseCommonFailure":
    let obj = newInfraApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.InfraApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips InfraApiResponseCollection":
    let obj = newInfraApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.InfraApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips InfraServiceConfig":
    let obj = newInfraServiceConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.InfraServiceConfig)) == openjson.toJson(obj)

  test "round-trips InfraApiResponseSingle":
    let obj = newInfraApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.InfraApiResponseSingle)) == openjson.toJson(obj)

suite "connectivity_services endpoints":
  test "GET /accounts/{account_id}/connectivity/directory/services":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdConnectivityDirectoryServices("test", "test", 1, 1)

  test "POST /accounts/{account_id}/connectivity/directory/services":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdConnectivityDirectoryServices("test", newInfraServiceConfig())

  test "GET /accounts/{account_id}/connectivity/directory/services/{service_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdConnectivityDirectoryServicesServiceId("test", "test")

  test "PUT /accounts/{account_id}/connectivity/directory/services/{service_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdConnectivityDirectoryServicesServiceId("test", "test", newInfraServiceConfig())

  test "DELETE /accounts/{account_id}/connectivity/directory/services/{service_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdConnectivityDirectoryServicesServiceId("test", "test")

