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

suite "account_level_custom_nameservers serialization":
  test "round-trips DnsCustomNameserversCustomNSInput":
    let obj = newDnsCustomNameserversCustomNSInput()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsCustomNameserversCustomNSInput)) == openjson.toJson(obj)

  test "round-trips DnsCustomNameserversAcnsResponseCollection":
    let obj = newDnsCustomNameserversAcnsResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsCustomNameserversAcnsResponseCollection)) == openjson.toJson(obj)

  test "round-trips DnsCustomNameserversApiResponseCommonFailure":
    let obj = newDnsCustomNameserversApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsCustomNameserversApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DnsCustomNameserversAcnsResponseSingle":
    let obj = newDnsCustomNameserversAcnsResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsCustomNameserversAcnsResponseSingle)) == openjson.toJson(obj)

  test "round-trips DnsCustomNameserversEmptyResponse":
    let obj = newDnsCustomNameserversEmptyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsCustomNameserversEmptyResponse)) == openjson.toJson(obj)

suite "account_level_custom_nameservers endpoints":
  test "GET /accounts/{account_id}/custom_ns":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCustomNs("test")

  test "POST /accounts/{account_id}/custom_ns":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCustomNs("test", newDnsCustomNameserversCustomNSInput())

  test "DELETE /accounts/{account_id}/custom_ns/{custom_ns_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCustomNsCustomNsId("test", "test")

