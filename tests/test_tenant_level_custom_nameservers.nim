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

suite "tenant_level_custom_nameservers serialization":
  test "round-trips DnsCustomNameserversCustomNSInput":
    let obj = newDnsCustomNameserversCustomNSInput()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsCustomNameserversCustomNSInput)) == openjson.toJson(obj)

  test "round-trips DnsCustomNameserversApiResponseCommonFailure":
    let obj = newDnsCustomNameserversApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsCustomNameserversApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DnsCustomNameserversTcnsResponseSingle":
    let obj = newDnsCustomNameserversTcnsResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsCustomNameserversTcnsResponseSingle)) == openjson.toJson(obj)

  test "round-trips DnsCustomNameserversEmptyResponse":
    let obj = newDnsCustomNameserversEmptyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsCustomNameserversEmptyResponse)) == openjson.toJson(obj)

  test "round-trips DnsCustomNameserversTcnsResponseCollection":
    let obj = newDnsCustomNameserversTcnsResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsCustomNameserversTcnsResponseCollection)) == openjson.toJson(obj)

suite "tenant_level_custom_nameservers endpoints":
  test "GET /tenants/{tenant_tag}/custom_ns":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getTenantsTenantTagCustomNs("test")

  test "POST /tenants/{tenant_tag}/custom_ns":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postTenantsTenantTagCustomNs("test", newDnsCustomNameserversCustomNSInput())

  test "DELETE /tenants/{tenant_tag}/custom_ns/{custom_ns_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteTenantsTenantTagCustomNsCustomNsId("test", "test")

