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

suite "registrar_registration serialization":
  test "round-trips RegistrarApiRegistrationCreateRequest":
    let obj = newRegistrarApiRegistrationCreateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiRegistrationCreateRequest)) == openjson.toJson(obj)

  test "round-trips RegistrarApiApiResponseCommonFailure":
    let obj = newRegistrarApiApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips RegistrarApiWorkflowStatusResponseSingle":
    let obj = newRegistrarApiWorkflowStatusResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiWorkflowStatusResponseSingle)) == openjson.toJson(obj)

  test "round-trips RegistrarApiRegistrationResponseSingle":
    let obj = newRegistrarApiRegistrationResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiRegistrationResponseSingle)) == openjson.toJson(obj)

  test "round-trips RegistrarApiSandboxRegistrationUpdateRequest":
    let obj = newRegistrarApiSandboxRegistrationUpdateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiSandboxRegistrationUpdateRequest)) == openjson.toJson(obj)

  test "round-trips RegistrarApiRegistrationUpdateRequest":
    let obj = newRegistrarApiRegistrationUpdateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiRegistrationUpdateRequest)) == openjson.toJson(obj)

  test "round-trips RegistrarApiSandboxWorkflowStatusResponseSingle":
    let obj = newRegistrarApiSandboxWorkflowStatusResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiSandboxWorkflowStatusResponseSingle)) == openjson.toJson(obj)

  test "round-trips RegistrarApiSandboxRegistrationResponseSingle":
    let obj = newRegistrarApiSandboxRegistrationResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiSandboxRegistrationResponseSingle)) == openjson.toJson(obj)

  test "round-trips RegistrarApiSandboxApiResponseCommonFailure":
    let obj = newRegistrarApiSandboxApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiSandboxApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips RegistrarApiSandboxRegistrationResponseCollection":
    let obj = newRegistrarApiSandboxRegistrationResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiSandboxRegistrationResponseCollection)) == openjson.toJson(obj)

  test "round-trips RegistrarApiRegistrationResponseCollection":
    let obj = newRegistrarApiRegistrationResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiRegistrationResponseCollection)) == openjson.toJson(obj)

  test "round-trips RegistrarApiSandboxRegistrationCreateRequest":
    let obj = newRegistrarApiSandboxRegistrationCreateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiSandboxRegistrationCreateRequest)) == openjson.toJson(obj)

suite "registrar_registration endpoints":
  test "GET /accounts/{account_id}/registrar-sandbox/registrations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarSandboxRegistrations("test", "test", 1, {}, {})

  test "POST /accounts/{account_id}/registrar-sandbox/registrations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdRegistrarSandboxRegistrations("test", newRegistrarApiSandboxRegistrationCreateRequest())

  test "GET /accounts/{account_id}/registrar-sandbox/registrations/{domain_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarSandboxRegistrationsDomainName("test", "test")

  test "PATCH /accounts/{account_id}/registrar-sandbox/registrations/{domain_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdRegistrarSandboxRegistrationsDomainName("test", "test", newRegistrarApiSandboxRegistrationUpdateRequest())

  test "GET /accounts/{account_id}/registrar-sandbox/registrations/{domain_name}/registration-status":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarSandboxRegistrationsDomainNameRegistrationStatus("test", "test")

  test "GET /accounts/{account_id}/registrar-sandbox/registrations/{domain_name}/update-status":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarSandboxRegistrationsDomainNameUpdateStatus("test", "test")

  test "GET /accounts/{account_id}/registrar/registrations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarRegistrations("test", "test", 1, {}, {})

  test "POST /accounts/{account_id}/registrar/registrations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdRegistrarRegistrations("test", newRegistrarApiRegistrationCreateRequest())

  test "GET /accounts/{account_id}/registrar/registrations/{domain_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarRegistrationsDomainName("test", "test")

  test "PATCH /accounts/{account_id}/registrar/registrations/{domain_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdRegistrarRegistrationsDomainName("test", "test", newRegistrarApiRegistrationUpdateRequest())

  test "GET /accounts/{account_id}/registrar/registrations/{domain_name}/registration-status":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarRegistrationsDomainNameRegistrationStatus("test", "test")

  test "GET /accounts/{account_id}/registrar/registrations/{domain_name}/update-status":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarRegistrationsDomainNameUpdateStatus("test", "test")

