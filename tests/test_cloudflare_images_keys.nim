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

suite "cloudflare_images_keys serialization":
  test "round-trips ImagesImageKeyResponseCollection":
    let obj = newImagesImageKeyResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesImageKeyResponseCollection)) == openjson.toJson(obj)

  test "round-trips ImagesApiResponseCommonFailure":
    let obj = newImagesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesApiResponseCommonFailure)) == openjson.toJson(obj)

suite "cloudflare_images_keys endpoints":
  test "GET /accounts/{account_id}/images/v1/keys":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdImagesV1Keys("test")

  test "PUT /accounts/{account_id}/images/v1/keys/{signing_key_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdImagesV1KeysSigningKeyName("test", "test")

  test "DELETE /accounts/{account_id}/images/v1/keys/{signing_key_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdImagesV1KeysSigningKeyName("test", "test")

