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

suite "email_routing_destination_addresses serialization":
  test "round-trips EmailUpdateDestinationAddressProperties":
    let obj = newEmailUpdateDestinationAddressProperties()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailUpdateDestinationAddressProperties)) == openjson.toJson(obj)

  test "round-trips EmailDestinationAddressesResponseCollection":
    let obj = newEmailDestinationAddressesResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailDestinationAddressesResponseCollection)) == openjson.toJson(obj)

  test "round-trips EmailDestinationAddressResponseSingle":
    let obj = newEmailDestinationAddressResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailDestinationAddressResponseSingle)) == openjson.toJson(obj)

  test "round-trips EmailCreateDestinationAddressProperties":
    let obj = newEmailCreateDestinationAddressProperties()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailCreateDestinationAddressProperties)) == openjson.toJson(obj)

suite "email_routing_destination_addresses endpoints":
  test "GET /accounts/{account_id}/email/routing/addresses":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailRoutingAddresses("test", 1.0, 1.0, {}, {})

  test "POST /accounts/{account_id}/email/routing/addresses":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdEmailRoutingAddresses("test", newEmailCreateDestinationAddressProperties())

  test "GET /accounts/{account_id}/email/routing/addresses/{destination_address_identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailRoutingAddressesDestinationAddressIdentifier("test", "test")

  test "DELETE /accounts/{account_id}/email/routing/addresses/{destination_address_identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdEmailRoutingAddressesDestinationAddressIdentifier("test", "test")

  test "PATCH /accounts/{account_id}/email/routing/addresses/{destination_address_identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdEmailRoutingAddressesDestinationAddressIdentifier("test", "test", newEmailUpdateDestinationAddressProperties())

