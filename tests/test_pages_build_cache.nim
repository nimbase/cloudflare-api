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

suite "pages_build_cache serialization":
  test "round-trips PagesApiResponseCommonFailure":
    let obj = newPagesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips PagesApiResponseCommon":
    let obj = newPagesApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesApiResponseCommon)) == openjson.toJson(obj)

suite "pages_build_cache endpoints":
  test "POST /accounts/{account_id}/pages/projects/{project_name}/purge_build_cache":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdPagesProjectsProjectNamePurgeBuildCache("test", "test")

