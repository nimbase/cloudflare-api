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

suite "brapi serialization":
  test "round-trips BrapiSerializedAXNode":
    let obj = newBrapiSerializedAXNode()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BrapiSerializedAXNode)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdBrowserRenderingAccessibilityTreeResponse":
    let obj = cloudflare.PostAccountsAccountIdBrowserRenderingAccessibilityTreeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdBrowserRenderingAccessibilityTreeResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdBrowserRenderingContentResponse":
    let obj = cloudflare.PostAccountsAccountIdBrowserRenderingContentResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdBrowserRenderingContentResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdBrowserRenderingCrawlResponse":
    let obj = cloudflare.PostAccountsAccountIdBrowserRenderingCrawlResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdBrowserRenderingCrawlResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdBrowserRenderingCrawlJobIdResponse":
    let obj = cloudflare.GetAccountsAccountIdBrowserRenderingCrawlJobIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdBrowserRenderingCrawlJobIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdBrowserRenderingCrawlJobIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdBrowserRenderingCrawlJobIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdBrowserRenderingCrawlJobIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdBrowserRenderingDevtoolsBrowserResponse":
    let obj = cloudflare.PostAccountsAccountIdBrowserRenderingDevtoolsBrowserResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdBrowserRenderingDevtoolsBrowserResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonActivateTargetIdResponse":
    let obj = cloudflare.GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonActivateTargetIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonActivateTargetIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonCloseTargetIdResponse":
    let obj = cloudflare.GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonCloseTargetIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonCloseTargetIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonListTargetIdResponse":
    let obj = cloudflare.GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonListTargetIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonListTargetIdResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonNewResponse":
    let obj = cloudflare.PutAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonNewResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonNewResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonProtocolResponse":
    let obj = cloudflare.GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonProtocolResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonProtocolResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonVersionResponse":
    let obj = cloudflare.GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonVersionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonVersionResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdLiveViewResponse":
    let obj = cloudflare.PostAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdLiveViewResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdLiveViewResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdBrowserRenderingDevtoolsSessionSessionIdResponse":
    let obj = cloudflare.GetAccountsAccountIdBrowserRenderingDevtoolsSessionSessionIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdBrowserRenderingDevtoolsSessionSessionIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdBrowserRenderingJsonResponse":
    let obj = cloudflare.PostAccountsAccountIdBrowserRenderingJsonResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdBrowserRenderingJsonResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdBrowserRenderingLinksResponse":
    let obj = cloudflare.PostAccountsAccountIdBrowserRenderingLinksResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdBrowserRenderingLinksResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdBrowserRenderingMarkdownResponse":
    let obj = cloudflare.PostAccountsAccountIdBrowserRenderingMarkdownResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdBrowserRenderingMarkdownResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdBrowserRenderingScrapeResponse":
    let obj = cloudflare.PostAccountsAccountIdBrowserRenderingScrapeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdBrowserRenderingScrapeResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdBrowserRenderingScreenshotResponse":
    let obj = cloudflare.PostAccountsAccountIdBrowserRenderingScreenshotResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdBrowserRenderingScreenshotResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdBrowserRenderingSnapshotResponse":
    let obj = cloudflare.PostAccountsAccountIdBrowserRenderingSnapshotResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdBrowserRenderingSnapshotResponse)) == openjson.toJson(obj)

suite "brapi endpoints":
  test "POST /accounts/{account_id}/browser-rendering/crawl":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdBrowserRenderingCrawl("test", 1.0)

  test "GET /accounts/{account_id}/browser-rendering/crawl/{job_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrowserRenderingCrawlJobId("test", "test", 1.0, {}, 1.0, 1.0)

  test "DELETE /accounts/{account_id}/browser-rendering/crawl/{job_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdBrowserRenderingCrawlJobId("test", "test")

  test "GET /accounts/{account_id}/browser-rendering/devtools/browser":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrowserRenderingDevtoolsBrowser("test", 1.0, true, true)

  test "GET /accounts/{account_id}/browser-rendering/devtools/browser/{session_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionId("test", "test", 1.0, true, true)

  test "DELETE /accounts/{account_id}/browser-rendering/devtools/browser/{session_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionId("test", "test")

  test "GET /accounts/{account_id}/browser-rendering/devtools/browser/{session_id}/json":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJson("test", "test", 1.0)

  test "GET /accounts/{account_id}/browser-rendering/devtools/browser/{session_id}/json/activate/{target_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonActivateTargetId("test", "test", "test")

  test "GET /accounts/{account_id}/browser-rendering/devtools/browser/{session_id}/json/close/{target_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonCloseTargetId("test", "test", "test")

  test "GET /accounts/{account_id}/browser-rendering/devtools/browser/{session_id}/json/list":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonList("test", "test", 1.0)

  test "GET /accounts/{account_id}/browser-rendering/devtools/browser/{session_id}/json/list/{target_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonListTargetId("test", "test", "test")

  test "PUT /accounts/{account_id}/browser-rendering/devtools/browser/{session_id}/json/new":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonNew("test", "test", "test", 1.0)

  test "GET /accounts/{account_id}/browser-rendering/devtools/browser/{session_id}/json/protocol":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonProtocol("test", "test")

  test "GET /accounts/{account_id}/browser-rendering/devtools/browser/{session_id}/json/version":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonVersion("test", "test")

  test "GET /accounts/{account_id}/browser-rendering/devtools/browser/{session_id}/page/{target_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdPageTargetId("test", "test", "test")

  test "GET /accounts/{account_id}/browser-rendering/devtools/session":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrowserRenderingDevtoolsSession("test", 1.0, 1.0)

  test "GET /accounts/{account_id}/browser-rendering/devtools/session/{session_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrowserRenderingDevtoolsSessionSessionId("test", "test")

