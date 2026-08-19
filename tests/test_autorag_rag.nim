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

suite "autorag_rag serialization":
  test "round-trips GetAccountsAccountIdAutoragRagsIdFilesResponse":
    let obj = cloudflare.GetAccountsAccountIdAutoragRagsIdFilesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAutoragRagsIdFilesResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdAutoragRagsIdSyncResponse":
    let obj = cloudflare.PatchAccountsAccountIdAutoragRagsIdSyncResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdAutoragRagsIdSyncResponse)) == openjson.toJson(obj)

suite "autorag_rag endpoints":
  test "GET /accounts/{account_id}/autorag/rags/{id}/files":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAutoragRagsIdFiles("test", "test", 1, 1, "test", {})

  test "PATCH /accounts/{account_id}/autorag/rags/{id}/sync":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdAutoragRagsIdSync("test", "test")

