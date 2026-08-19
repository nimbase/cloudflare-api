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

suite "dns_firewall_analytics serialization":
  test "round-trips DnsAnalyticsReport":
    let obj = newDnsAnalyticsReport()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsAnalyticsReport)) == openjson.toJson(obj)

  test "round-trips DnsAnalyticsReportBytime":
    let obj = newDnsAnalyticsReportBytime()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsAnalyticsReportBytime)) == openjson.toJson(obj)

  test "round-trips DnsAnalyticsApiResponseCommonFailure":
    let obj = newDnsAnalyticsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsAnalyticsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DnsAnalyticsApiResponseSingle":
    let obj = newDnsAnalyticsApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsAnalyticsApiResponseSingle)) == openjson.toJson(obj)

suite "dns_firewall_analytics endpoints":
  test "GET /accounts/{account_id}/dns_firewall/{dns_firewall_id}/dns_analytics/report":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDnsFirewallDnsFirewallIdDnsAnalyticsReport("test", "test", "test", "test", "test", "test", 1, "test", "test")

