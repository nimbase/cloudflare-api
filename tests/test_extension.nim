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

suite "extension serialization":
  test "round-trips RegistrarSandboxExtensionResponseSingle":
    let obj = newRegistrarSandboxExtensionResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarSandboxExtensionResponseSingle)) == openjson.toJson(obj)

  test "round-trips RegistrarSandboxApiResponseCommonFailure":
    let obj = newRegistrarSandboxApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarSandboxApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips RegistrarExtensionResponseSingle":
    let obj = newRegistrarExtensionResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarExtensionResponseSingle)) == openjson.toJson(obj)

  test "round-trips RegistrarExtensionResponseCollection":
    let obj = newRegistrarExtensionResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarExtensionResponseCollection)) == openjson.toJson(obj)

  test "round-trips RegistrarSandboxExtensionResponseCollection":
    let obj = newRegistrarSandboxExtensionResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarSandboxExtensionResponseCollection)) == openjson.toJson(obj)

  test "round-trips RegistrarApiResponseCommonFailure":
    let obj = newRegistrarApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiResponseCommonFailure)) == openjson.toJson(obj)

suite "extension endpoints":
  test "GET /accounts/{account_id}/registrar-sandbox/extensions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarSandboxExtensions("test", "test", "test", 1, directionAsc, sortByName)

  test "GET /accounts/{account_id}/registrar-sandbox/extensions/{extension}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarSandboxExtensionsExtension("test", "test")

  test "GET /accounts/{account_id}/registrar/extensions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarExtensions("test", "test", "test", 1, directionAsc, sortByName)

  test "GET /accounts/{account_id}/registrar/extensions/{extension}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarExtensionsExtension("test", "test")

