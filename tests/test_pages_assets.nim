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

suite "pages_assets serialization":
  test "round-trips PagesPagesAssetsCheckMissingRequest":
    let obj = newPagesPagesAssetsCheckMissingRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesPagesAssetsCheckMissingRequest)) == openjson.toJson(obj)

  test "round-trips PagesPagesAssetsCheckMissingResponse":
    let obj = newPagesPagesAssetsCheckMissingResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesPagesAssetsCheckMissingResponse)) == openjson.toJson(obj)

  test "round-trips PagesApiResponseCommonFailure":
    let obj = newPagesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips PagesApiResponseCommon":
    let obj = newPagesApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips PagesPagesAssetsUpsertHashesRequest":
    let obj = newPagesPagesAssetsUpsertHashesRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesPagesAssetsUpsertHashesRequest)) == openjson.toJson(obj)

suite "pages_assets endpoints":
  test "POST /pages/assets/check-missing":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postPagesAssetsCheckMissing(newPagesPagesAssetsCheckMissingRequest())

  test "POST /pages/assets/upsert-hashes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postPagesAssetsUpsertHashes(newPagesPagesAssetsUpsertHashesRequest())

