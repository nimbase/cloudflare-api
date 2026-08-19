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

suite "account_level_custom_nameservers_usage_for_a_zone serialization":
  test "round-trips DnsCustomNameserversEmptyResponse2":
    let obj = newDnsCustomNameserversEmptyResponse2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsCustomNameserversEmptyResponse2)) == openjson.toJson(obj)

  test "round-trips DnsCustomNameserversZoneMetadata":
    let obj = newDnsCustomNameserversZoneMetadata()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsCustomNameserversZoneMetadata)) == openjson.toJson(obj)

  test "round-trips DnsCustomNameserversApiResponseCommonFailure":
    let obj = newDnsCustomNameserversApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsCustomNameserversApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DnsCustomNameserversGetResponse":
    let obj = newDnsCustomNameserversGetResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsCustomNameserversGetResponse)) == openjson.toJson(obj)

suite "account_level_custom_nameservers_usage_for_a_zone endpoints":
  test "GET /zones/{zone_id}/custom_ns":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdCustomNs("test")

  test "PUT /zones/{zone_id}/custom_ns":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdCustomNs("test", newDnsCustomNameserversZoneMetadata())

