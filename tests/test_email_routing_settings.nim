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

suite "email_routing_settings serialization":
  test "round-trips EmailEmailSettingDnsRequestBody":
    let obj = newEmailEmailSettingDnsRequestBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailEmailSettingDnsRequestBody)) == openjson.toJson(obj)

  test "round-trips EmailUpdateEmailRoutingSettingsProperties":
    let obj = newEmailUpdateEmailRoutingSettingsProperties()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailUpdateEmailRoutingSettingsProperties)) == openjson.toJson(obj)

  test "round-trips EmailEmailSettingsResponseSingle":
    let obj = newEmailEmailSettingsResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailEmailSettingsResponseSingle)) == openjson.toJson(obj)

suite "email_routing_settings endpoints":
  test "GET /zones/{zone_id}/email/routing":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdEmailRouting("test")

  test "PUT /zones/{zone_id}/email/routing":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdEmailRouting("test", newEmailUpdateEmailRoutingSettingsProperties())

  test "PATCH /zones/{zone_id}/email/routing":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdEmailRouting("test", newEmailUpdateEmailRoutingSettingsProperties())

  test "POST /zones/{zone_id}/email/routing/disable":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdEmailRoutingDisable("test")

  test "GET /zones/{zone_id}/email/routing/dns":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdEmailRoutingDns("test", "test")

  test "POST /zones/{zone_id}/email/routing/dns":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdEmailRoutingDns("test", newEmailEmailSettingDnsRequestBody())

  test "DELETE /zones/{zone_id}/email/routing/dns":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdEmailRoutingDns("test", newEmailEmailSettingDnsRequestBody())

  test "PATCH /zones/{zone_id}/email/routing/dns":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdEmailRoutingDns("test", newEmailEmailSettingDnsRequestBody())

  test "POST /zones/{zone_id}/email/routing/enable":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdEmailRoutingEnable("test")

  test "POST /zones/{zone_id}/email/routing/unlock":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdEmailRoutingUnlock("test", newEmailEmailSettingDnsRequestBody())

