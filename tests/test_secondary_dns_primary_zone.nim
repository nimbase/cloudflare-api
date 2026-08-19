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

suite "secondary_dns_primary_zone serialization":
  test "round-trips SecondaryDnsDisableTransferResponse":
    let obj = newSecondaryDnsDisableTransferResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsDisableTransferResponse)) == openjson.toJson(obj)

  test "round-trips SecondaryDnsApiResponseCommonFailure":
    let obj = newSecondaryDnsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips SecondaryDnsForceResponse2":
    let obj = newSecondaryDnsForceResponse2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsForceResponse2)) == openjson.toJson(obj)

  test "round-trips SecondaryDnsIdResponse":
    let obj = newSecondaryDnsIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsIdResponse)) == openjson.toJson(obj)

  test "round-trips SecondaryDnsSingleRequestOutgoing":
    let obj = newSecondaryDnsSingleRequestOutgoing()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsSingleRequestOutgoing)) == openjson.toJson(obj)

  test "round-trips SecondaryDnsEnableTransferResponse":
    let obj = newSecondaryDnsEnableTransferResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsEnableTransferResponse)) == openjson.toJson(obj)

  test "round-trips SecondaryDnsSingleResponseOutgoing":
    let obj = newSecondaryDnsSingleResponseOutgoing()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsSingleResponseOutgoing)) == openjson.toJson(obj)

suite "secondary_dns_primary_zone endpoints":
  test "GET /zones/{zone_id}/secondary_dns/outgoing":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSecondaryDnsOutgoing("test")

  test "POST /zones/{zone_id}/secondary_dns/outgoing":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdSecondaryDnsOutgoing("test", newSecondaryDnsSingleRequestOutgoing())

  test "PUT /zones/{zone_id}/secondary_dns/outgoing":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdSecondaryDnsOutgoing("test", newSecondaryDnsSingleRequestOutgoing())

  test "DELETE /zones/{zone_id}/secondary_dns/outgoing":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdSecondaryDnsOutgoing("test")

  test "POST /zones/{zone_id}/secondary_dns/outgoing/disable":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdSecondaryDnsOutgoingDisable("test")

  test "POST /zones/{zone_id}/secondary_dns/outgoing/enable":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdSecondaryDnsOutgoingEnable("test")

  test "POST /zones/{zone_id}/secondary_dns/outgoing/force_notify":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdSecondaryDnsOutgoingForceNotify("test")

  test "GET /zones/{zone_id}/secondary_dns/outgoing/status":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSecondaryDnsOutgoingStatus("test")

