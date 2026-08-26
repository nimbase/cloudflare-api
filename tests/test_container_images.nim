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

suite "container_images serialization":
  test "round-trips CcPrepareContainerImageRequestBody":
    let obj = newCcPrepareContainerImageRequestBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcPrepareContainerImageRequestBody)) == openjson.toJson(obj)

  test "round-trips CcV4BaseResponse":
    let obj = newCcV4BaseResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcV4BaseResponse)) == openjson.toJson(obj)

  test "round-trips CcV4BaseErrorResponse":
    let obj = newCcV4BaseErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcV4BaseErrorResponse)) == openjson.toJson(obj)

  test "round-trips CcContainerImagePreparation":
    let obj = newCcContainerImagePreparation()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcContainerImagePreparation)) == openjson.toJson(obj)

suite "container_images endpoints":
  test "POST /accounts/{account_id}/containers/image-preparations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdContainersImagePreparations(newCcPrepareContainerImageRequestBody())

