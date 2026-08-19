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

suite "attacker serialization":
  test "round-trips GetAccountsAccountIdCloudforceOneEventsAttackersResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneEventsAttackersResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneEventsAttackersResponse)) == openjson.toJson(obj)

suite "attacker endpoints":
  test "GET /accounts/{account_id}/cloudforce-one/events/attackers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsAttackers("test", @["test"])

