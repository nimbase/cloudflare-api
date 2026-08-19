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

suite "access_tags serialization":
  test "round-trips AccessResponseCollection15":
    let obj = newAccessResponseCollection15()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollection15)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessTagWithoutAppCount":
    let obj = newAccessTagWithoutAppCount()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessTagWithoutAppCount)) == openjson.toJson(obj)

  test "round-trips AccessSingleResponse14":
    let obj = newAccessSingleResponse14()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleResponse14)) == openjson.toJson(obj)

  test "round-trips AccessNameResponse":
    let obj = newAccessNameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessNameResponse)) == openjson.toJson(obj)

suite "access_tags endpoints":
  test "GET /accounts/{account_id}/access/tags":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessTags("test", 1, 1)

  test "GET /accounts/{account_id}/access/tags/{tag_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessTagsTagName("test", "test")

  test "PUT /accounts/{account_id}/access/tags/{tag_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdAccessTagsTagName("test", "test", newAccessTagWithoutAppCount())

  test "DELETE /accounts/{account_id}/access/tags/{tag_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAccessTagsTagName("test", "test")

