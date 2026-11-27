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

suite "ppu_agreements serialization":
  test "round-trips PayPerCrawlPPUAgreementRequest":
    let obj = newPayPerCrawlPPUAgreementRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlPPUAgreementRequest)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlApiErrorResponse":
    let obj = newPayPerCrawlApiErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlApiErrorResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlPPUAgreementsResponse":
    let obj = newPayPerCrawlPPUAgreementsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlPPUAgreementsResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlPPUAgreementResponse":
    let obj = newPayPerCrawlPPUAgreementResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlPPUAgreementResponse)) == openjson.toJson(obj)

suite "ppu_agreements endpoints":
  test "GET /accounts/{account_id}/pay-per-use/agreements":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPayPerUseAgreements("test", 1, 1)

  test "POST /accounts/{account_id}/pay-per-use/agreements":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdPayPerUseAgreements("test", newPayPerCrawlPPUAgreementRequest())

