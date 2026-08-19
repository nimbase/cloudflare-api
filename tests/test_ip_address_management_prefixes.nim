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

suite "ip_address_management_prefixes serialization":
  test "round-trips AddressingLoaUploadResponse":
    let obj = newAddressingLoaUploadResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingLoaUploadResponse)) == openjson.toJson(obj)

  test "round-trips AddressingResponseCollection":
    let obj = newAddressingResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingResponseCollection)) == openjson.toJson(obj)

  test "round-trips AddressingApiResponseCommonFailure":
    let obj = newAddressingApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AddressingSingleResponse":
    let obj = newAddressingSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingSingleResponse)) == openjson.toJson(obj)

  test "round-trips AddressingApiResponseSingle":
    let obj = newAddressingApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips AddressingApiResponseCollection":
    let obj = newAddressingApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingApiResponseCollection)) == openjson.toJson(obj)

suite "ip_address_management_prefixes endpoints":
  test "POST /accounts/{account_id}/addressing/loa_documents":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAddressingLoaDocuments("test")

  test "GET /accounts/{account_id}/addressing/loa_documents/{loa_document_id}/download":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAddressingLoaDocumentsLoaDocumentIdDownload("test", "test")

  test "GET /accounts/{account_id}/addressing/prefixes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAddressingPrefixes("test")

  test "GET /accounts/{account_id}/addressing/prefixes/{prefix_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAddressingPrefixesPrefixId("test", "test")

  test "DELETE /accounts/{account_id}/addressing/prefixes/{prefix_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAddressingPrefixesPrefixId("test", "test")

  test "POST /accounts/{account_id}/addressing/prefixes/{prefix_id}/validate":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAddressingPrefixesPrefixIdValidate("test", "test")

