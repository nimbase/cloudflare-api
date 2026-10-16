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

suite "cws_categories serialization":
  test "round-trips CwsResponseCategoryVersion":
    let obj = newCwsResponseCategoryVersion()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsResponseCategoryVersion)) == openjson.toJson(obj)

  test "round-trips CwsPageResponseCategoryApplication":
    let obj = newCwsPageResponseCategoryApplication()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsPageResponseCategoryApplication)) == openjson.toJson(obj)

  test "round-trips CwsPageResponseCategoryName":
    let obj = newCwsPageResponseCategoryName()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsPageResponseCategoryName)) == openjson.toJson(obj)

  test "round-trips CwsPageResponseCategoryVersionSummary":
    let obj = newCwsPageResponseCategoryVersionSummary()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsPageResponseCategoryVersionSummary)) == openjson.toJson(obj)

  test "round-trips CwsErrorResponse":
    let obj = newCwsErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsErrorResponse)) == openjson.toJson(obj)

suite "cws_categories endpoints":
  test "GET /cws/categories/apis":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getCwsCategoriesApis("test", 1, "test", "test", true)

  test "GET /cws/categories/applications":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getCwsCategoriesApplications("test", 1, "test")

  test "GET /cws/categories/applications/{application_key}/versions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getCwsCategoriesApplicationsApplicationKeyVersions("test", 1, "test")

  test "GET /cws/categories/applications/{application_key}/versions/latest":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getCwsCategoriesApplicationsApplicationKeyVersionsLatest("test")

  test "GET /cws/categories/applications/{application_key}/versions/{version_tag}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getCwsCategoriesApplicationsApplicationKeyVersionsVersionTag("test", "test")

  test "GET /cws/categories/operations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getCwsCategoriesOperations("test", 1, "test", "test", "test", true)

