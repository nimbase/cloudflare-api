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

suite "ip_address_management_leases serialization":
  test "round-trips AddressingApiResponseCommonFailure":
    let obj = newAddressingApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AddressingLeasesComponentsSchemasResponseCollection":
    let obj = newAddressingLeasesComponentsSchemasResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AddressingLeasesComponentsSchemasResponseCollection)) == openjson.toJson(obj)

suite "ip_address_management_leases endpoints":
  test "GET /accounts/{account_id}/addressing/leases":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAddressingLeases("test")

