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

suite "cloudflare_images serialization":
  test "round-trips ImagesImageDirectUploadResponseV1":
    let obj = newImagesImageDirectUploadResponseV1()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesImageDirectUploadResponseV1)) == openjson.toJson(obj)

  test "round-trips ImagesImageDirectUploadResponseV2":
    let obj = newImagesImageDirectUploadResponseV2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesImageDirectUploadResponseV2)) == openjson.toJson(obj)

  test "round-trips ImagesImageResponseSingle":
    let obj = newImagesImageResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesImageResponseSingle)) == openjson.toJson(obj)

  test "round-trips ImagesImageDirectUploadRequestV1":
    let obj = newImagesImageDirectUploadRequestV1()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesImageDirectUploadRequestV1)) == openjson.toJson(obj)

  test "round-trips ImagesDeletedResponse":
    let obj = newImagesDeletedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesDeletedResponse)) == openjson.toJson(obj)

  test "round-trips ImagesImageBasicUpload":
    let obj = newImagesImageBasicUpload()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesImageBasicUpload)) == openjson.toJson(obj)

  test "round-trips ImagesImageDirectUploadRequestV2":
    let obj = newImagesImageDirectUploadRequestV2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesImageDirectUploadRequestV2)) == openjson.toJson(obj)

  test "round-trips ImagesImageResponseBlob":
    let obj = newImagesImageResponseBlob()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesImageResponseBlob)) == openjson.toJson(obj)

  test "round-trips ImagesImagesListResponseV2":
    let obj = newImagesImagesListResponseV2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesImagesListResponseV2)) == openjson.toJson(obj)

  test "round-trips ImagesMetadataKeysResponse":
    let obj = newImagesMetadataKeysResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesMetadataKeysResponse)) == openjson.toJson(obj)

  test "round-trips ImagesImagesStatsResponse":
    let obj = newImagesImagesStatsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesImagesStatsResponse)) == openjson.toJson(obj)

  test "round-trips ImagesImagesListResponse":
    let obj = newImagesImagesListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesImagesListResponse)) == openjson.toJson(obj)

  test "round-trips ImagesImagePatchRequest":
    let obj = newImagesImagePatchRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesImagePatchRequest)) == openjson.toJson(obj)

  test "round-trips ImagesApiResponseCommonFailure":
    let obj = newImagesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ImagesApiResponseCommonFailure)) == openjson.toJson(obj)

suite "cloudflare_images endpoints":
  test "GET /accounts/{account_id}/images/v1":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdImagesV1("test", 1.0, 1.0, "test")

  test "POST /accounts/{account_id}/images/v1":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdImagesV1("test")

  test "POST /accounts/{account_id}/images/v1/direct_upload":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdImagesV1DirectUpload("test", newImagesImageDirectUploadRequestV1())

  test "GET /accounts/{account_id}/images/v1/stats":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdImagesV1Stats("test")

  test "GET /accounts/{account_id}/images/v1/{image_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdImagesV1ImageId("test", "test")

  test "DELETE /accounts/{account_id}/images/v1/{image_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdImagesV1ImageId("test", "test")

  test "PATCH /accounts/{account_id}/images/v1/{image_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdImagesV1ImageId("test", "test", newImagesImagePatchRequest())

  test "GET /accounts/{account_id}/images/v1/{image_id}/blob":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdImagesV1ImageIdBlob("test", "test")

  test "GET /accounts/{account_id}/images/v2":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdImagesV2("test", "test", 1.0, {}, "test", "test")

  test "POST /accounts/{account_id}/images/v2/direct_upload":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdImagesV2DirectUpload("test")

  test "GET /accounts/{account_id}/images/v2/metadata/keys":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdImagesV2MetadataKeys("test")

