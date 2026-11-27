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

suite "cloudflare_images_config serialization":
  test "round-trips ImagesImagesConfigEditRequest":
    let obj = newImagesImagesConfigEditRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesImagesConfigEditRequest)) == openjson.toJson(obj)

  test "round-trips ImagesImagesConfigResponse":
    let obj = newImagesImagesConfigResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesImagesConfigResponse)) == openjson.toJson(obj)

suite "cloudflare_images_config endpoints":
  test "GET /accounts/{account_id}/images/v1/config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdImagesV1Config("test")

  test "PATCH /accounts/{account_id}/images/v1/config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdImagesV1Config("test", newImagesImagesConfigEditRequest())

