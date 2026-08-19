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

suite "dlp_document_fingerprints serialization":
  test "round-trips DlpUpdateDocumentFingerprint":
    let obj = newDlpUpdateDocumentFingerprint()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpUpdateDocumentFingerprint)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseSingle":
    let obj = newDlpApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseCommonFailure":
    let obj = newDlpApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DlpDocumentFingerprintUpload":
    let obj = newDlpDocumentFingerprintUpload()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpDocumentFingerprintUpload)) == openjson.toJson(obj)

  test "round-trips DlpDocumentFingerprint":
    let obj = newDlpDocumentFingerprint()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpDocumentFingerprint)) == openjson.toJson(obj)

suite "dlp_document_fingerprints endpoints":
  test "GET /accounts/{account_id}/dlp/document_fingerprints":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpDocumentFingerprints("test")

  test "GET /accounts/{account_id}/dlp/document_fingerprints/{document_fingerprint_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpDocumentFingerprintsDocumentFingerprintId("test", "test")

  test "POST /accounts/{account_id}/dlp/document_fingerprints/{document_fingerprint_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDlpDocumentFingerprintsDocumentFingerprintId("test", "test", newDlpUpdateDocumentFingerprint())

  test "PUT /accounts/{account_id}/dlp/document_fingerprints/{document_fingerprint_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDlpDocumentFingerprintsDocumentFingerprintId("test", "test")

  test "DELETE /accounts/{account_id}/dlp/document_fingerprints/{document_fingerprint_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDlpDocumentFingerprintsDocumentFingerprintId("test", "test")

