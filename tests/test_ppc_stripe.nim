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

suite "ppc_stripe serialization":
  test "round-trips PayPerCrawlCreateStripeConfigResponse":
    let obj = newPayPerCrawlCreateStripeConfigResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlCreateStripeConfigResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlApiErrorResponse":
    let obj = newPayPerCrawlApiErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlApiErrorResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlApiNoResultResponse":
    let obj = newPayPerCrawlApiNoResultResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlApiNoResultResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlGetStripeConfigResponse":
    let obj = newPayPerCrawlGetStripeConfigResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlGetStripeConfigResponse)) == openjson.toJson(obj)

suite "ppc_stripe endpoints":
  test "GET /accounts/{account_id}/pay-per-crawl/crawler/stripe":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPayPerCrawlCrawlerStripe("test")

  test "POST /accounts/{account_id}/pay-per-crawl/crawler/stripe":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdPayPerCrawlCrawlerStripe("test")

  test "DELETE /accounts/{account_id}/pay-per-crawl/crawler/stripe":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdPayPerCrawlCrawlerStripe("test")

  test "GET /accounts/{account_id}/pay-per-crawl/publisher/stripe":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPayPerCrawlPublisherStripe("test")

  test "POST /accounts/{account_id}/pay-per-crawl/publisher/stripe":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdPayPerCrawlPublisherStripe("test")

  test "DELETE /accounts/{account_id}/pay-per-crawl/publisher/stripe":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdPayPerCrawlPublisherStripe("test")

