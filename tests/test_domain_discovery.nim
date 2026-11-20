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

suite "domain_discovery serialization":
  test "round-trips RegistrarSandboxApiResponseCommonFailure":
    let obj = newRegistrarSandboxApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarSandboxApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips RegistrarSandboxDomainCheckRequest":
    let obj = newRegistrarSandboxDomainCheckRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarSandboxDomainCheckRequest)) == openjson.toJson(obj)

  test "round-trips RegistrarDomainTransferCheckRequest":
    let obj = newRegistrarDomainTransferCheckRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarDomainTransferCheckRequest)) == openjson.toJson(obj)

  test "round-trips RegistrarSandboxDomainSearchResponse":
    let obj = newRegistrarSandboxDomainSearchResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarSandboxDomainSearchResponse)) == openjson.toJson(obj)

  test "round-trips RegistrarDomainTransferCheckResponse":
    let obj = newRegistrarDomainTransferCheckResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarDomainTransferCheckResponse)) == openjson.toJson(obj)

  test "round-trips RegistrarSandboxDomainCheckResponse":
    let obj = newRegistrarSandboxDomainCheckResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarSandboxDomainCheckResponse)) == openjson.toJson(obj)

  test "round-trips RegistrarDomainCheckRequest":
    let obj = newRegistrarDomainCheckRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarDomainCheckRequest)) == openjson.toJson(obj)

  test "round-trips RegistrarDomainSearchResponse":
    let obj = newRegistrarDomainSearchResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarDomainSearchResponse)) == openjson.toJson(obj)

  test "round-trips RegistrarDomainCheckResponse":
    let obj = newRegistrarDomainCheckResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarDomainCheckResponse)) == openjson.toJson(obj)

  test "round-trips RegistrarApiResponseCommonFailure":
    let obj = newRegistrarApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiResponseCommonFailure)) == openjson.toJson(obj)

suite "domain_discovery endpoints":
  test "POST /accounts/{account_id}/registrar-sandbox/domain-check":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdRegistrarSandboxDomainCheck("test", newRegistrarSandboxDomainCheckRequest())

  test "GET /accounts/{account_id}/registrar-sandbox/domain-search":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarSandboxDomainSearch("test", "test", @["test"], 1)

  test "POST /accounts/{account_id}/registrar/domain-check":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdRegistrarDomainCheck("test", newRegistrarDomainCheckRequest())

  test "GET /accounts/{account_id}/registrar/domain-search":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarDomainSearch("test", "test", @["test"], 1)

  test "POST /accounts/{account_id}/registrar/domain-transfer-check":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdRegistrarDomainTransferCheck("test", newRegistrarDomainTransferCheckRequest())

