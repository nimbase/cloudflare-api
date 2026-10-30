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

suite "payload_logging_keys_for_a_zone serialization":
  test "round-trips FirewallApiResponseCommonFailure":
    let obj = newFirewallApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips FirewallPayloadLoggingKey":
    let obj = newFirewallPayloadLoggingKey()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallPayloadLoggingKey)) == openjson.toJson(obj)

  test "round-trips FirewallPayloadLoggingKeyResponseSingle":
    let obj = newFirewallPayloadLoggingKeyResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FirewallPayloadLoggingKeyResponseSingle)) == openjson.toJson(obj)

suite "payload_logging_keys_for_a_zone endpoints":
  test "GET /zones/{zone_id}/firewall/payload_logging/key":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdFirewallPayloadLoggingKey("test")

  test "PUT /zones/{zone_id}/firewall/payload_logging/key":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdFirewallPayloadLoggingKey("test", newFirewallPayloadLoggingKey())

  test "DELETE /zones/{zone_id}/firewall/payload_logging/key":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdFirewallPayloadLoggingKey("test")

