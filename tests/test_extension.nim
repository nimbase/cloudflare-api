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
  test "round-trips RegistrarApiApiResponseCommonFailure":
    let obj = newRegistrarApiApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips RegistrarApiExtensionResponseCollection":
    let obj = newRegistrarApiExtensionResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiExtensionResponseCollection)) == openjson.toJson(obj)

  test "round-trips RegistrarApiSandboxExtensionResponseCollection":
    let obj = newRegistrarApiSandboxExtensionResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiSandboxExtensionResponseCollection)) == openjson.toJson(obj)

  test "round-trips RegistrarApiSandboxApiResponseCommonFailure":
    let obj = newRegistrarApiSandboxApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiSandboxApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips RegistrarApiExtensionResponseSingle":
    let obj = newRegistrarApiExtensionResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiExtensionResponseSingle)) == openjson.toJson(obj)

  test "round-trips RegistrarApiSandboxExtensionResponseSingle":
    let obj = newRegistrarApiSandboxExtensionResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiSandboxExtensionResponseSingle)) == openjson.toJson(obj)

suite "extension endpoints":
  test "GET /accounts/{account_id}/registrar-sandbox/extensions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarSandboxExtensions("test", "test", "test", 1, {}, {})

  test "GET /accounts/{account_id}/registrar-sandbox/extensions/{extension}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarSandboxExtensionsExtension("test", "test")

  test "GET /accounts/{account_id}/registrar/extensions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarExtensions("test", "test", "test", 1, {}, {})

  test "GET /accounts/{account_id}/registrar/extensions/{extension}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarExtensionsExtension("test", "test")

