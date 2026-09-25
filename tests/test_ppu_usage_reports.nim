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

suite "ppu_usage_reports serialization":
  test "round-trips PayPerCrawlUsageReportValidationResponse":
    let obj = newPayPerCrawlUsageReportValidationResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlUsageReportValidationResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlApiErrorResponse":
    let obj = newPayPerCrawlApiErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlApiErrorResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlUsageReportCreatedResponse":
    let obj = newPayPerCrawlUsageReportCreatedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlUsageReportCreatedResponse)) == openjson.toJson(obj)

suite "ppu_usage_reports endpoints":
  test "POST /accounts/{account_id}/pay-per-use/usage-reports":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdPayPerUseUsageReports("test")

