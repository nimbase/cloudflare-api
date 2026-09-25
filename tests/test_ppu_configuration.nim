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

suite "ppu_configuration serialization":
  test "round-trips PayPerCrawlPPUOperatorConfigurationResponse":
    let obj = newPayPerCrawlPPUOperatorConfigurationResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlPPUOperatorConfigurationResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlPPUZoneCanBeEnabledResponse":
    let obj = newPayPerCrawlPPUZoneCanBeEnabledResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlPPUZoneCanBeEnabledResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlPPUZoneConfigurationResponse":
    let obj = newPayPerCrawlPPUZoneConfigurationResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlPPUZoneConfigurationResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlPPUZonesCanBeEnabledPayload":
    let obj = newPayPerCrawlPPUZonesCanBeEnabledPayload()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlPPUZonesCanBeEnabledPayload)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlPPUZoneConfigurationUpdate":
    let obj = newPayPerCrawlPPUZoneConfigurationUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlPPUZoneConfigurationUpdate)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlPPUOperatorConfigurationUpdate":
    let obj = newPayPerCrawlPPUOperatorConfigurationUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlPPUOperatorConfigurationUpdate)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlApiErrorResponse":
    let obj = newPayPerCrawlApiErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlApiErrorResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlApiNoResultResponse":
    let obj = newPayPerCrawlApiNoResultResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlApiNoResultResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlPPUOperatorConfiguration":
    let obj = newPayPerCrawlPPUOperatorConfiguration()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlPPUOperatorConfiguration)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlPPUZoneConfigurationResultResponse":
    let obj = newPayPerCrawlPPUZoneConfigurationResultResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlPPUZoneConfigurationResultResponse)) == openjson.toJson(obj)

  test "round-trips PayPerCrawlPPUOperatorConfigurationResultResponse":
    let obj = newPayPerCrawlPPUOperatorConfigurationResultResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PayPerCrawlPPUOperatorConfigurationResultResponse)) == openjson.toJson(obj)

suite "ppu_configuration endpoints":
  test "GET /accounts/{account_id}/pay-per-use/operator/configuration":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPayPerUseOperatorConfiguration("test")

  test "PUT /accounts/{account_id}/pay-per-use/operator/configuration":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdPayPerUseOperatorConfiguration("test", newPayPerCrawlPPUOperatorConfiguration())

  test "PATCH /accounts/{account_id}/pay-per-use/operator/configuration":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdPayPerUseOperatorConfiguration("test", newPayPerCrawlPPUOperatorConfigurationUpdate())

  test "PATCH /accounts/{account_id}/pay-per-use/zones_can_be_enabled":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdPayPerUseZonesCanBeEnabled("test", newPayPerCrawlPPUZonesCanBeEnabledPayload())

  test "GET /zones/{zone_id}/pay-per-use/can_be_enabled":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdPayPerUseCanBeEnabled("test")

  test "GET /zones/{zone_id}/pay-per-use/configuration":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdPayPerUseConfiguration("test")

  test "PATCH /zones/{zone_id}/pay-per-use/configuration":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdPayPerUseConfiguration("test", newPayPerCrawlPPUZoneConfigurationUpdate())

