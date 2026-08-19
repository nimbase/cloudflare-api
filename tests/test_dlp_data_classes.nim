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

suite "dlp_data_classes serialization":
  test "round-trips DlpDataClassUpdate":
    let obj = newDlpDataClassUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpDataClassUpdate)) == openjson.toJson(obj)

  test "round-trips DlpDataClass":
    let obj = newDlpDataClass()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpDataClass)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseSingle":
    let obj = newDlpApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseCommonFailure":
    let obj = newDlpApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DlpNewDataClass":
    let obj = newDlpNewDataClass()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpNewDataClass)) == openjson.toJson(obj)

  test "round-trips DlpEmpty":
    let obj = newDlpEmpty()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpEmpty)) == openjson.toJson(obj)

suite "dlp_data_classes endpoints":
  test "GET /accounts/{account_id}/dlp/data_classes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpDataClasses("test")

  test "POST /accounts/{account_id}/dlp/data_classes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDlpDataClasses("test", newDlpNewDataClass())

  test "GET /accounts/{account_id}/dlp/data_classes/{data_class_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpDataClassesDataClassId("test", "test")

  test "PUT /accounts/{account_id}/dlp/data_classes/{data_class_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDlpDataClassesDataClassId("test", "test", newDlpDataClassUpdate())

  test "DELETE /accounts/{account_id}/dlp/data_classes/{data_class_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDlpDataClassesDataClassId("test", "test")

