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

suite "dlp_entries serialization":
  test "round-trips DlpEntryUpdate":
    let obj = newDlpEntryUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpEntryUpdate)) == openjson.toJson(obj)

  test "round-trips DlpEntryWithSharedProfiles":
    let obj = newDlpEntryWithSharedProfiles()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpEntryWithSharedProfiles)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseSingle":
    let obj = newDlpApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseCommonFailure":
    let obj = newDlpApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DlpEntry":
    let obj = newDlpEntry()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpEntry)) == openjson.toJson(obj)

  test "round-trips DlpPredefinedEntryUpdate":
    let obj = newDlpPredefinedEntryUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpPredefinedEntryUpdate)) == openjson.toJson(obj)

  test "round-trips DlpCustomEntryUpdate":
    let obj = newDlpCustomEntryUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpCustomEntryUpdate)) == openjson.toJson(obj)

  test "round-trips DlpEntryWithUploadStatus":
    let obj = newDlpEntryWithUploadStatus()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpEntryWithUploadStatus)) == openjson.toJson(obj)

  test "round-trips DlpPredefinedEntry":
    let obj = newDlpPredefinedEntry()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpPredefinedEntry)) == openjson.toJson(obj)

  test "round-trips DlpCustomEntry":
    let obj = newDlpCustomEntry()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpCustomEntry)) == openjson.toJson(obj)

  test "round-trips DlpEmpty":
    let obj = newDlpEmpty()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpEmpty)) == openjson.toJson(obj)

  test "round-trips DlpNewEntry":
    let obj = newDlpNewEntry()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpNewEntry)) == openjson.toJson(obj)

suite "dlp_entries endpoints":
  test "GET /accounts/{account_id}/dlp/entries":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpEntries("test")

  test "POST /accounts/{account_id}/dlp/entries":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDlpEntries("test", newDlpNewEntry())

  test "PUT /accounts/{account_id}/dlp/entries/custom/{entry_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDlpEntriesCustomEntryId("test", "test", newDlpCustomEntryUpdate())

  test "PUT /accounts/{account_id}/dlp/entries/predefined/{entry_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDlpEntriesPredefinedEntryId("test", "test", newDlpPredefinedEntryUpdate())

  test "GET /accounts/{account_id}/dlp/entries/{entry_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpEntriesEntryId("test", "test")

  test "PUT /accounts/{account_id}/dlp/entries/{entry_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDlpEntriesEntryId("test", "test", newDlpEntryUpdate())

  test "DELETE /accounts/{account_id}/dlp/entries/{entry_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDlpEntriesEntryId("test", "test")

