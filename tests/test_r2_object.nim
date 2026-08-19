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

suite "r2_object serialization":
  test "round-trips R2V4Response":
    let obj = newR2V4Response()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2V4Response)) == openjson.toJson(obj)

  test "round-trips R2V4ResponseFailure":
    let obj = newR2V4ResponseFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2V4ResponseFailure)) == openjson.toJson(obj)

  test "round-trips R2R2DeleteObjectResult":
    let obj = newR2R2DeleteObjectResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2R2DeleteObjectResult)) == openjson.toJson(obj)

  test "round-trips R2R2PutObjectResult":
    let obj = newR2R2PutObjectResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2R2PutObjectResult)) == openjson.toJson(obj)

  test "round-trips R2R2ListObjectsResultInfo":
    let obj = newR2R2ListObjectsResultInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2R2ListObjectsResultInfo)) == openjson.toJson(obj)

  test "round-trips R2R2Object":
    let obj = newR2R2Object()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.R2R2Object)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdR2BucketsBucketNameObjectsResponse":
    let obj = cloudflare.GetAccountsAccountIdR2BucketsBucketNameObjectsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdR2BucketsBucketNameObjectsResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdR2BucketsBucketNameObjectsResponse":
    let obj = cloudflare.DeleteAccountsAccountIdR2BucketsBucketNameObjectsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdR2BucketsBucketNameObjectsResponse)) == openjson.toJson(obj)

suite "r2_object endpoints":
  test "GET /accounts/{account_id}/r2/buckets/{bucket_name}/objects":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdR2BucketsBucketNameObjects("test", "test", 1, "test", "test", "test", "test")

  test "DELETE /accounts/{account_id}/r2/buckets/{bucket_name}/objects":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdR2BucketsBucketNameObjects("test", "test", "test")

  test "GET /accounts/{account_id}/r2/buckets/{bucket_name}/objects/{object_key}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdR2BucketsBucketNameObjectsObjectKey("test", "test", "test")

  test "PUT /accounts/{account_id}/r2/buckets/{bucket_name}/objects/{object_key}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdR2BucketsBucketNameObjectsObjectKey("test", "test", "test")

  test "DELETE /accounts/{account_id}/r2/buckets/{bucket_name}/objects/{object_key}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdR2BucketsBucketNameObjectsObjectKey("test", "test", "test")

