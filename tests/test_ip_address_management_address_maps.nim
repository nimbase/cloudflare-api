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

suite "ip_address_management_address_maps serialization":
  test "round-trips AddressingApiResponseCommonFailure":
    let obj = newAddressingApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AddressingSingleResponse3":
    let obj = newAddressingSingleResponse3()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingSingleResponse3)) == openjson.toJson(obj)

  test "round-trips AddressingApiResponseCollection":
    let obj = newAddressingApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips AddressingFullResponse":
    let obj = newAddressingFullResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingFullResponse)) == openjson.toJson(obj)

  test "round-trips AddressingResponseCollection3":
    let obj = newAddressingResponseCollection3()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingResponseCollection3)) == openjson.toJson(obj)

suite "ip_address_management_address_maps endpoints":
  test "GET /accounts/{account_id}/addressing/address_maps":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAddressingAddressMaps("test")

  test "GET /accounts/{account_id}/addressing/address_maps/{address_map_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAddressingAddressMapsAddressMapId("test", "test")

  test "DELETE /accounts/{account_id}/addressing/address_maps/{address_map_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAddressingAddressMapsAddressMapId("test", "test")

  test "PUT /accounts/{account_id}/addressing/address_maps/{address_map_id}/accounts/{account_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdAddressingAddressMapsAddressMapIdAccountsAccountId("test", "test")

  test "DELETE /accounts/{account_id}/addressing/address_maps/{address_map_id}/accounts/{account_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAddressingAddressMapsAddressMapIdAccountsAccountId("test", "test")

  test "PUT /accounts/{account_id}/addressing/address_maps/{address_map_id}/ips/{ip_address}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdAddressingAddressMapsAddressMapIdIpsIpAddress("test", "test", "test")

  test "DELETE /accounts/{account_id}/addressing/address_maps/{address_map_id}/ips/{ip_address}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAddressingAddressMapsAddressMapIdIpsIpAddress("test", "test", "test")

  test "PUT /accounts/{account_id}/addressing/address_maps/{address_map_id}/zones/{zone_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdAddressingAddressMapsAddressMapIdZonesZoneId("test", "test", "test")

  test "DELETE /accounts/{account_id}/addressing/address_maps/{address_map_id}/zones/{zone_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAddressingAddressMapsAddressMapIdZonesZoneId("test", "test", "test")

