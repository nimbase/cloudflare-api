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

suite "ip_address_management_prefix_delegation serialization":
  test "round-trips AddressingSchemasResponseCollection":
    let obj = newAddressingSchemasResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingSchemasResponseCollection)) == openjson.toJson(obj)

  test "round-trips AddressingIdResponse":
    let obj = newAddressingIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingIdResponse)) == openjson.toJson(obj)

  test "round-trips AddressingApiResponseCommonFailure":
    let obj = newAddressingApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AddressingSchemasSingleResponse":
    let obj = newAddressingSchemasSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingSchemasSingleResponse)) == openjson.toJson(obj)

suite "ip_address_management_prefix_delegation endpoints":
  test "GET /accounts/{account_id}/addressing/prefixes/{prefix_id}/delegations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAddressingPrefixesPrefixIdDelegations("test", "test")

  test "DELETE /accounts/{account_id}/addressing/prefixes/{prefix_id}/delegations/{delegation_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAddressingPrefixesPrefixIdDelegationsDelegationId("test", "test", "test")

