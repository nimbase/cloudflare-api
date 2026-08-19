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

suite "dns_firewall serialization":
  test "round-trips DnsFirewallDnsFirewallClusterPatch":
    let obj = newDnsFirewallDnsFirewallClusterPatch()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsFirewallDnsFirewallClusterPatch)) == openjson.toJson(obj)

  test "round-trips DnsFirewallDnsFirewallSingleResponse":
    let obj = newDnsFirewallDnsFirewallSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsFirewallDnsFirewallSingleResponse)) == openjson.toJson(obj)

  test "round-trips DnsFirewallApiResponseCommonFailure":
    let obj = newDnsFirewallApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsFirewallApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DnsFirewallDnsFirewallResponseCollection":
    let obj = newDnsFirewallDnsFirewallResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsFirewallDnsFirewallResponseCollection)) == openjson.toJson(obj)

  test "round-trips DnsFirewallApiResponseSingle":
    let obj = newDnsFirewallApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsFirewallApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips DnsFirewallDnsFirewallReverseDnsPatch":
    let obj = newDnsFirewallDnsFirewallReverseDnsPatch()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsFirewallDnsFirewallReverseDnsPatch)) == openjson.toJson(obj)

  test "round-trips DnsFirewallDnsFirewallClusterPost":
    let obj = newDnsFirewallDnsFirewallClusterPost()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsFirewallDnsFirewallClusterPost)) == openjson.toJson(obj)

  test "round-trips DnsFirewallDnsFirewallReverseDnsResponse2":
    let obj = newDnsFirewallDnsFirewallReverseDnsResponse2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsFirewallDnsFirewallReverseDnsResponse2)) == openjson.toJson(obj)

suite "dns_firewall endpoints":
  test "GET /accounts/{account_id}/dns_firewall":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDnsFirewall("test", 1.0, 1.0)

  test "POST /accounts/{account_id}/dns_firewall":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDnsFirewall("test", newDnsFirewallDnsFirewallClusterPost())

  test "GET /accounts/{account_id}/dns_firewall/{dns_firewall_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDnsFirewallDnsFirewallId("test", "test")

  test "DELETE /accounts/{account_id}/dns_firewall/{dns_firewall_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDnsFirewallDnsFirewallId("test", "test")

  test "PATCH /accounts/{account_id}/dns_firewall/{dns_firewall_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdDnsFirewallDnsFirewallId("test", "test", newDnsFirewallDnsFirewallClusterPatch())

  test "GET /accounts/{account_id}/dns_firewall/{dns_firewall_id}/reverse_dns":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDnsFirewallDnsFirewallIdReverseDns("test", "test")

  test "PATCH /accounts/{account_id}/dns_firewall/{dns_firewall_id}/reverse_dns":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdDnsFirewallDnsFirewallIdReverseDns("test", "test", newDnsFirewallDnsFirewallReverseDnsPatch())

