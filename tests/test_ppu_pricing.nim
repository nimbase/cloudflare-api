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

suite "ppu_pricing serialization":
  test "round-trips PayPerCrawlPPUOperatorPricesResponse":
    let obj = newPayPerCrawlPPUOperatorPricesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlPPUOperatorPricesResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlPPUProposalsResponse":
    let obj = newPayPerCrawlPPUProposalsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlPPUProposalsResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlPPUPublisherPriceActionRequest":
    let obj = newPayPerCrawlPPUPublisherPriceActionRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlPPUPublisherPriceActionRequest)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlPPUOperatorProposalActionRequest":
    let obj = newPayPerCrawlPPUOperatorProposalActionRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlPPUOperatorProposalActionRequest)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlApiErrorResponse":
    let obj = newPayPerCrawlApiErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlApiErrorResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlApiNoResultResponse":
    let obj = newPayPerCrawlApiNoResultResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlApiNoResultResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlPPUPriceResponse":
    let obj = newPayPerCrawlPPUPriceResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlPPUPriceResponse)) == openjson.toJson(obj)

suite "ppu_pricing endpoints":
  test "GET /accounts/{account_id}/pay-per-use/proposals":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPayPerUseProposals("test", 1, 1)

  test "POST /accounts/{account_id}/pay-per-use/proposals":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdPayPerUseProposals("test", newPayPerCrawlPPUOperatorProposalActionRequest())

  test "GET /zones/{zone_id}/pay-per-use/operators":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdPayPerUseOperators("test", 1, 1)

  test "POST /zones/{zone_id}/pay-per-use/operators/{operator_id}/price":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdPayPerUseOperatorsOperatorIdPrice("test", "test", newPayPerCrawlPPUPublisherPriceActionRequest())

  test "DELETE /zones/{zone_id}/pay-per-use/operators/{operator_id}/price":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdPayPerUseOperatorsOperatorIdPrice("test", "test")

