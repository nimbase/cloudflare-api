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

suite "ppc_terms serialization":
  test "round-trips PayPerCrawlGetTermsSignatureResponse":
    let obj = newPayPerCrawlGetTermsSignatureResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlGetTermsSignatureResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlApiErrorResponse":
    let obj = newPayPerCrawlApiErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlApiErrorResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlGetTermsSignatureLinkResponse":
    let obj = newPayPerCrawlGetTermsSignatureLinkResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlGetTermsSignatureLinkResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlGetTermsResponse":
    let obj = newPayPerCrawlGetTermsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlGetTermsResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlApiNoResultResponse":
    let obj = newPayPerCrawlApiNoResultResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlApiNoResultResponse)) == openjson.toJson(obj)

suite "ppc_terms endpoints":
  test "GET /accounts/{account_id}/pay-per-crawl/signature_link":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPayPerCrawlSignatureLink("test")

  test "GET /accounts/{account_id}/pay-per-crawl/terms":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPayPerCrawlTerms("test")

  test "GET /accounts/{account_id}/pay-per-crawl/terms/signature":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPayPerCrawlTermsSignature("test", true)

  test "POST /accounts/{account_id}/pay-per-crawl/terms/signature":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdPayPerCrawlTermsSignature("test", {}, "test")

