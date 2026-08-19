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

suite "ppc_crawlers serialization":
  test "round-trips PayPerCrawlApiErrorResponse":
    let obj = newPayPerCrawlApiErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlApiErrorResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlListCrawlersResponse":
    let obj = newPayPerCrawlListCrawlersResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlListCrawlersResponse)) == openjson.toJson(obj)

suite "ppc_crawlers endpoints":
  test "GET /accounts/{account_id}/pay-per-crawl/crawlers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPayPerCrawlCrawlers("test")

