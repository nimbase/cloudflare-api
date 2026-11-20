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
  test "round-trips RegistrarSandboxApiResponseCommonFailure":
    let obj = newRegistrarSandboxApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarSandboxApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips RegistrarSandboxRegistrationResponseSingle":
    let obj = newRegistrarSandboxRegistrationResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarSandboxRegistrationResponseSingle)) == openjson.toJson(obj)

  test "round-trips RegistrarRegistrationResponseSingle":
    let obj = newRegistrarRegistrationResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarRegistrationResponseSingle)) == openjson.toJson(obj)

  test "round-trips RegistrarSandboxRegistrationCreateRequest":
    let obj = newRegistrarSandboxRegistrationCreateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarSandboxRegistrationCreateRequest)) == openjson.toJson(obj)

  test "round-trips RegistrarRegistrationUpdateRequest":
    let obj = newRegistrarRegistrationUpdateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarRegistrationUpdateRequest)) == openjson.toJson(obj)

  test "round-trips RegistrarSandboxWorkflowStatusResponseSingle":
    let obj = newRegistrarSandboxWorkflowStatusResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarSandboxWorkflowStatusResponseSingle)) == openjson.toJson(obj)

  test "round-trips RegistrarRegistrationResponseCollection":
    let obj = newRegistrarRegistrationResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarRegistrationResponseCollection)) == openjson.toJson(obj)

  test "round-trips RegistrarSandboxRegistrationResponseCollection":
    let obj = newRegistrarSandboxRegistrationResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarSandboxRegistrationResponseCollection)) == openjson.toJson(obj)

  test "round-trips RegistrarWorkflowStatusResponseSingle":
    let obj = newRegistrarWorkflowStatusResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarWorkflowStatusResponseSingle)) == openjson.toJson(obj)

  test "round-trips RegistrarSandboxRegistrationUpdateRequest":
    let obj = newRegistrarSandboxRegistrationUpdateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarSandboxRegistrationUpdateRequest)) == openjson.toJson(obj)

  test "round-trips RegistrarApiResponseCommonFailure":
    let obj = newRegistrarApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips RegistrarRegistrationCreateRequest":
    let obj = newRegistrarRegistrationCreateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarRegistrationCreateRequest)) == openjson.toJson(obj)

suite "registrar_registration endpoints":
  test "GET /accounts/{account_id}/registrar-sandbox/registrations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarSandboxRegistrations("test", "test", 1, directionAsc, sortByRegistryCreatedAt)

  test "POST /accounts/{account_id}/registrar-sandbox/registrations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdRegistrarSandboxRegistrations("test", newRegistrarSandboxRegistrationCreateRequest())

  test "GET /accounts/{account_id}/registrar-sandbox/registrations/{domain_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarSandboxRegistrationsDomainName("test", "test")

  test "PATCH /accounts/{account_id}/registrar-sandbox/registrations/{domain_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdRegistrarSandboxRegistrationsDomainName("test", "test", newRegistrarSandboxRegistrationUpdateRequest())

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
    discard waitFor client.getAccountsAccountIdRegistrarRegistrations("test", "test", 1, directionAsc, sortByRegistryCreatedAt)

  test "POST /accounts/{account_id}/registrar/registrations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdRegistrarRegistrations("test", newRegistrarRegistrationCreateRequest())

  test "GET /accounts/{account_id}/registrar/registrations/{domain_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarRegistrationsDomainName("test", "test")

  test "PATCH /accounts/{account_id}/registrar/registrations/{domain_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdRegistrarRegistrationsDomainName("test", "test", newRegistrarRegistrationUpdateRequest())

  test "GET /accounts/{account_id}/registrar/registrations/{domain_name}/registration-status":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarRegistrationsDomainNameRegistrationStatus("test", "test")

  test "GET /accounts/{account_id}/registrar/registrations/{domain_name}/update-status":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarRegistrationsDomainNameUpdateStatus("test", "test")

