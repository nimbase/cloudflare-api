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

suite "finetune_asset serialization":
  test "round-trips GetAccountsAccountIdAiFinetunesFinetuneIdFinetuneAssetsFileNameResponse":
    let obj = cloudflare.GetAccountsAccountIdAiFinetunesFinetuneIdFinetuneAssetsFileNameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiFinetunesFinetuneIdFinetuneAssetsFileNameResponse)) == openjson.toJson(obj)

suite "finetune_asset endpoints":
  test "GET /accounts/{account_id}/ai/finetunes/{finetune_id}/finetune-assets/{file_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiFinetunesFinetuneIdFinetuneAssetsFileName("test", "test", "test")

