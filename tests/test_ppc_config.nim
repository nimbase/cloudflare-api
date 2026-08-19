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

suite "ppc_config serialization":
  test "round-trips PayPerCrawlZonesCanBeEnabledQueryPayload":
    let obj = newPayPerCrawlZonesCanBeEnabledQueryPayload()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlZonesCanBeEnabledQueryPayload)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlDaricConfig":
    let obj = newPayPerCrawlDaricConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlDaricConfig)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlZonesCanBeEnabledPayload":
    let obj = newPayPerCrawlZonesCanBeEnabledPayload()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlZonesCanBeEnabledPayload)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlGetZoneCanBeEnabledResponse":
    let obj = newPayPerCrawlGetZoneCanBeEnabledResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlGetZoneCanBeEnabledResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlApiErrorResponse":
    let obj = newPayPerCrawlApiErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlApiErrorResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlQueryZonesCanBeEnabledResponse":
    let obj = newPayPerCrawlQueryZonesCanBeEnabledResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlQueryZonesCanBeEnabledResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlApiNoResultResponse":
    let obj = newPayPerCrawlApiNoResultResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlApiNoResultResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlGetConfigResponse":
    let obj = newPayPerCrawlGetConfigResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlGetConfigResponse)) == openjson.toJson(obj)

suite "ppc_config endpoints":
  test "PATCH /accounts/{account_id}/pay-per-crawl/zones_can_be_enabled":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdPayPerCrawlZonesCanBeEnabled("test", newPayPerCrawlZonesCanBeEnabledPayload())

  test "POST /accounts/{account_id}/pay-per-crawl/zones_can_be_enabled/query":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdPayPerCrawlZonesCanBeEnabledQuery("test", newPayPerCrawlZonesCanBeEnabledQueryPayload())

  test "GET /zones/{zone_id}/pay-per-crawl/can_be_enabled":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdPayPerCrawlCanBeEnabled("test")

  test "GET /zones/{zone_id}/pay-per-crawl/configuration":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdPayPerCrawlConfiguration("test")

  test "POST /zones/{zone_id}/pay-per-crawl/configuration":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdPayPerCrawlConfiguration("test", newPayPerCrawlDaricConfig())

  test "PATCH /zones/{zone_id}/pay-per-crawl/configuration":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdPayPerCrawlConfiguration("test", newPayPerCrawlDaricConfig())

