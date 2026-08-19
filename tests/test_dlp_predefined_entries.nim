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

suite "dlp_predefined_entries serialization":
  test "round-trips DlpApiResponseSingle":
    let obj = newDlpApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseCommonFailure":
    let obj = newDlpApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DlpNewPredefinedEntry":
    let obj = newDlpNewPredefinedEntry()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpNewPredefinedEntry)) == openjson.toJson(obj)

  test "round-trips DlpPredefinedEntry":
    let obj = newDlpPredefinedEntry()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpPredefinedEntry)) == openjson.toJson(obj)

  test "round-trips DlpEmpty":
    let obj = newDlpEmpty()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpEmpty)) == openjson.toJson(obj)

suite "dlp_predefined_entries endpoints":
  test "POST /accounts/{account_id}/dlp/entries/predefined":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDlpEntriesPredefined("test", newDlpNewPredefinedEntry())

  test "DELETE /accounts/{account_id}/dlp/entries/predefined/{entry_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDlpEntriesPredefinedEntryId("test", "test")

