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

suite "custom_nameserver_sets_for_an_account serialization":
  test "round-trips DnsSettingsNameserverSetDeleteResponse":
    let obj = newDnsSettingsNameserverSetDeleteResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsSettingsNameserverSetDeleteResponse)) == openjson.toJson(obj)

  test "round-trips DnsSettingsNameserverSetResponseCollection":
    let obj = newDnsSettingsNameserverSetResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsSettingsNameserverSetResponseCollection)) == openjson.toJson(obj)

  test "round-trips DnsSettingsNameserverSetResponseSingle":
    let obj = newDnsSettingsNameserverSetResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsSettingsNameserverSetResponseSingle)) == openjson.toJson(obj)

  test "round-trips DnsSettingsApiResponseCommonFailure":
    let obj = newDnsSettingsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsSettingsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DnsSettingsNameserverSetCreate":
    let obj = newDnsSettingsNameserverSetCreate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsSettingsNameserverSetCreate)) == openjson.toJson(obj)

suite "custom_nameserver_sets_for_an_account endpoints":
  test "GET /accounts/{account_id}/dns_settings/nameserver_sets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDnsSettingsNameserverSets("test", 1, 1)

  test "POST /accounts/{account_id}/dns_settings/nameserver_sets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDnsSettingsNameserverSets("test", newDnsSettingsNameserverSetCreate())

  test "GET /accounts/{account_id}/dns_settings/nameserver_sets/{nameserver_set_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDnsSettingsNameserverSetsNameserverSetId("test", "test")

  test "DELETE /accounts/{account_id}/dns_settings/nameserver_sets/{nameserver_set_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDnsSettingsNameserverSetsNameserverSetId("test", "test")

