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

suite "device_managed_networks serialization":
  test "round-trips TeamsDevicesIdentifier":
    let obj = newTeamsDevicesIdentifier()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesIdentifier)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesSchemasConfigRequest":
    let obj = newTeamsDevicesSchemasConfigRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesSchemasConfigRequest)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesComponentsSchemasResponseCollection":
    let obj = newTeamsDevicesComponentsSchemasResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesComponentsSchemasResponseCollection)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesApiResponseCommonFailure":
    let obj = newTeamsDevicesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesComponentsSchemasSingleResponse":
    let obj = newTeamsDevicesComponentsSchemasSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesComponentsSchemasSingleResponse)) == openjson.toJson(obj)

suite "device_managed_networks endpoints":
  test "GET /accounts/{account_id}/devices/networks":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesNetworks(newTeamsDevicesIdentifier())

  test "GET /accounts/{account_id}/devices/networks/{network_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesNetworksNetworkId("test", newTeamsDevicesIdentifier())

  test "DELETE /accounts/{account_id}/devices/networks/{network_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDevicesNetworksNetworkId("test", newTeamsDevicesIdentifier())

