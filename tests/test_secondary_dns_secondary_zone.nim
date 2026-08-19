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

suite "secondary_dns_secondary_zone serialization":
  test "round-trips SecondaryDnsSingleResponseIncoming":
    let obj = newSecondaryDnsSingleResponseIncoming()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsSingleResponseIncoming)) == openjson.toJson(obj)

  test "round-trips SecondaryDnsApiResponseCommonFailure":
    let obj = newSecondaryDnsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips SecondaryDnsDnsSecondarySecondaryZone":
    let obj = newSecondaryDnsDnsSecondarySecondaryZone()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsDnsSecondarySecondaryZone)) == openjson.toJson(obj)

  test "round-trips SecondaryDnsForceResponse":
    let obj = newSecondaryDnsForceResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsForceResponse)) == openjson.toJson(obj)

  test "round-trips SecondaryDnsIdResponse":
    let obj = newSecondaryDnsIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsIdResponse)) == openjson.toJson(obj)

suite "secondary_dns_secondary_zone endpoints":
  test "POST /zones/{zone_id}/secondary_dns/force_axfr":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdSecondaryDnsForceAxfr("test")

  test "GET /zones/{zone_id}/secondary_dns/incoming":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSecondaryDnsIncoming("test")

  test "POST /zones/{zone_id}/secondary_dns/incoming":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdSecondaryDnsIncoming("test", newSecondaryDnsDnsSecondarySecondaryZone())

  test "PUT /zones/{zone_id}/secondary_dns/incoming":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdSecondaryDnsIncoming("test", newSecondaryDnsDnsSecondarySecondaryZone())

  test "DELETE /zones/{zone_id}/secondary_dns/incoming":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdSecondaryDnsIncoming("test")

