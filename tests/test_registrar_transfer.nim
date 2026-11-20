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

suite "registrar_transfer serialization":
  test "round-trips RegistrarTransferInCreateRequest":
    let obj = newRegistrarTransferInCreateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarTransferInCreateRequest)) == openjson.toJson(obj)

  test "round-trips RegistrarWorkflowStatusResponseSingle":
    let obj = newRegistrarWorkflowStatusResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarWorkflowStatusResponseSingle)) == openjson.toJson(obj)

  test "round-trips RegistrarApiResponseCommonFailure":
    let obj = newRegistrarApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiResponseCommonFailure)) == openjson.toJson(obj)

suite "registrar_transfer endpoints":
  test "POST /accounts/{account_id}/registrar/registrations/{domain_name}/transfer-in":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdRegistrarRegistrationsDomainNameTransferIn("test", "test", newRegistrarTransferInCreateRequest())

  test "GET /accounts/{account_id}/registrar/registrations/{domain_name}/transfer-in-status":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarRegistrationsDomainNameTransferInStatus("test", "test")

