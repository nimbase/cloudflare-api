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

suite "dlp_integration_entries serialization":
  test "round-trips DlpApiResponseSingle":
    let obj = newDlpApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips DlpIntegrationEntry":
    let obj = newDlpIntegrationEntry()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpIntegrationEntry)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseCommonFailure":
    let obj = newDlpApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DlpPredefinedEntryUpdate":
    let obj = newDlpPredefinedEntryUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpPredefinedEntryUpdate)) == openjson.toJson(obj)

  test "round-trips DlpNewPredefinedEntry":
    let obj = newDlpNewPredefinedEntry()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpNewPredefinedEntry)) == openjson.toJson(obj)

  test "round-trips DlpEmpty":
    let obj = newDlpEmpty()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpEmpty)) == openjson.toJson(obj)

suite "dlp_integration_entries endpoints":
  test "POST /accounts/{account_id}/dlp/entries/integration":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDlpEntriesIntegration("test", newDlpNewPredefinedEntry())

  test "PUT /accounts/{account_id}/dlp/entries/integration/{entry_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDlpEntriesIntegrationEntryId("test", "test", newDlpPredefinedEntryUpdate())

  test "DELETE /accounts/{account_id}/dlp/entries/integration/{entry_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDlpEntriesIntegrationEntryId("test", "test")

