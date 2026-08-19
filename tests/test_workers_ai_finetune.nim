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

suite "workers_ai_finetune serialization":
  test "round-trips GetAccountsAccountIdAiFinetunesResponse":
    let obj = cloudflare.GetAccountsAccountIdAiFinetunesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiFinetunesResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiFinetunesResponse":
    let obj = cloudflare.PostAccountsAccountIdAiFinetunesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiFinetunesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiFinetunesPublicResponse":
    let obj = cloudflare.GetAccountsAccountIdAiFinetunesPublicResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiFinetunesPublicResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdAiFinetunesFinetuneIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdAiFinetunesFinetuneIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdAiFinetunesFinetuneIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiFinetunesFinetuneIdFinetuneAssetsResponse":
    let obj = cloudflare.PostAccountsAccountIdAiFinetunesFinetuneIdFinetuneAssetsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiFinetunesFinetuneIdFinetuneAssetsResponse)) == openjson.toJson(obj)

suite "workers_ai_finetune endpoints":
  test "GET /accounts/{account_id}/ai/finetunes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiFinetunes("test")

  test "GET /accounts/{account_id}/ai/finetunes/public":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiFinetunesPublic("test", 1.0, 1.0, "test")

  test "DELETE /accounts/{account_id}/ai/finetunes/{finetune_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAiFinetunesFinetuneId("test", "test")

  test "POST /accounts/{account_id}/ai/finetunes/{finetune_id}/finetune-assets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAiFinetunesFinetuneIdFinetuneAssets("test", "test")

