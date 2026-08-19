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

suite "cloudflare_images_variants serialization":
  test "round-trips ImagesDeletedResponse":
    let obj = newImagesDeletedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesDeletedResponse)) == openjson.toJson(obj)

  test "round-trips ImagesImageVariantFlatResponse":
    let obj = newImagesImageVariantFlatResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesImageVariantFlatResponse)) == openjson.toJson(obj)

  test "round-trips ImagesImageVariantSimpleResponse":
    let obj = newImagesImageVariantSimpleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesImageVariantSimpleResponse)) == openjson.toJson(obj)

  test "round-trips ImagesImageVariantListResponse":
    let obj = newImagesImageVariantListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesImageVariantListResponse)) == openjson.toJson(obj)

  test "round-trips ImagesImageVariantDefinition":
    let obj = newImagesImageVariantDefinition()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesImageVariantDefinition)) == openjson.toJson(obj)

  test "round-trips ImagesApiResponseCommonFailure":
    let obj = newImagesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ImagesImageVariantPatchRequest":
    let obj = newImagesImageVariantPatchRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesImageVariantPatchRequest)) == openjson.toJson(obj)

suite "cloudflare_images_variants endpoints":
  test "GET /accounts/{account_id}/images/v1/variants":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdImagesV1Variants("test")

  test "POST /accounts/{account_id}/images/v1/variants":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdImagesV1Variants("test", newImagesImageVariantDefinition())

  test "GET /accounts/{account_id}/images/v1/variants/{variant_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdImagesV1VariantsVariantId("test", "test")

  test "DELETE /accounts/{account_id}/images/v1/variants/{variant_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdImagesV1VariantsVariantId("test", "test")

  test "PATCH /accounts/{account_id}/images/v1/variants/{variant_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdImagesV1VariantsVariantId("test", "test", newImagesImageVariantPatchRequest())

  test "GET /accounts/{account_id}/images/v1/variants/{variant_id}/flat":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdImagesV1VariantsVariantIdFlat("test", "test")

