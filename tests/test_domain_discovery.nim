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
  test "round-trips RegistrarApiDomainSearchResponse":
    let obj = newRegistrarApiDomainSearchResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiDomainSearchResponse)) == openjson.toJson(obj)

  test "round-trips RegistrarApiDomainCheckResponse":
    let obj = newRegistrarApiDomainCheckResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiDomainCheckResponse)) == openjson.toJson(obj)

  test "round-trips RegistrarApiApiResponseCommonFailure":
    let obj = newRegistrarApiApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips RegistrarApiDomainCheckRequest":
    let obj = newRegistrarApiDomainCheckRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiDomainCheckRequest)) == openjson.toJson(obj)

  test "round-trips RegistrarApiSandboxDomainCheckRequest":
    let obj = newRegistrarApiSandboxDomainCheckRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiSandboxDomainCheckRequest)) == openjson.toJson(obj)

  test "round-trips RegistrarApiSandboxApiResponseCommonFailure":
    let obj = newRegistrarApiSandboxApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiSandboxApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips RegistrarApiSandboxDomainCheckResponse":
    let obj = newRegistrarApiSandboxDomainCheckResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiSandboxDomainCheckResponse)) == openjson.toJson(obj)

  test "round-trips RegistrarApiSandboxDomainSearchResponse":
    let obj = newRegistrarApiSandboxDomainSearchResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiSandboxDomainSearchResponse)) == openjson.toJson(obj)

suite "domain_discovery endpoints":
  test "POST /accounts/{account_id}/registrar-sandbox/domain-check":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdRegistrarSandboxDomainCheck("test", newRegistrarApiSandboxDomainCheckRequest())

  test "GET /accounts/{account_id}/registrar-sandbox/domain-search":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarSandboxDomainSearch("test", "test", @["test"], 1)

  test "POST /accounts/{account_id}/registrar/domain-check":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdRegistrarDomainCheck("test", newRegistrarApiDomainCheckRequest())

  test "GET /accounts/{account_id}/registrar/domain-search":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarDomainSearch("test", "test", @["test"], 1)

