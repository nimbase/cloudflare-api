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

suite "email_routing_suppressions serialization":
  test "round-trips GetAccountsAccountIdEmailRoutingSuppressionResponse":
    let obj = cloudflare.GetAccountsAccountIdEmailRoutingSuppressionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdEmailRoutingSuppressionResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdEmailRoutingSuppressionResponse":
    let obj = cloudflare.PostAccountsAccountIdEmailRoutingSuppressionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdEmailRoutingSuppressionResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdEmailRoutingSuppressionSuppressionIdResponse":
    let obj = cloudflare.GetAccountsAccountIdEmailRoutingSuppressionSuppressionIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdEmailRoutingSuppressionSuppressionIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdEmailRoutingSuppressionSuppressionIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdEmailRoutingSuppressionSuppressionIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdEmailRoutingSuppressionSuppressionIdResponse)) == openjson.toJson(obj)

  test "round-trips GetZonesZoneIdEmailRoutingSuppressionResponse":
    let obj = cloudflare.GetZonesZoneIdEmailRoutingSuppressionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetZonesZoneIdEmailRoutingSuppressionResponse)) == openjson.toJson(obj)

  test "round-trips PostZonesZoneIdEmailRoutingSuppressionResponse":
    let obj = cloudflare.PostZonesZoneIdEmailRoutingSuppressionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostZonesZoneIdEmailRoutingSuppressionResponse)) == openjson.toJson(obj)

  test "round-trips GetZonesZoneIdEmailRoutingSuppressionSuppressionIdResponse":
    let obj = cloudflare.GetZonesZoneIdEmailRoutingSuppressionSuppressionIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetZonesZoneIdEmailRoutingSuppressionSuppressionIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteZonesZoneIdEmailRoutingSuppressionSuppressionIdResponse":
    let obj = cloudflare.DeleteZonesZoneIdEmailRoutingSuppressionSuppressionIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteZonesZoneIdEmailRoutingSuppressionSuppressionIdResponse)) == openjson.toJson(obj)

suite "email_routing_suppressions endpoints":
  test "GET /accounts/{account_id}/email/routing/suppression":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailRoutingSuppression("test", 1, 1, {}, {})

  test "GET /accounts/{account_id}/email/routing/suppression/{suppression_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailRoutingSuppressionSuppressionId("test", "test")

  test "DELETE /accounts/{account_id}/email/routing/suppression/{suppression_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdEmailRoutingSuppressionSuppressionId("test", "test")

  test "GET /zones/{zone_id}/email/routing/suppression":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdEmailRoutingSuppression("test", 1, 1, {}, {})

  test "GET /zones/{zone_id}/email/routing/suppression/{suppression_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdEmailRoutingSuppressionSuppressionId("test", "test")

  test "DELETE /zones/{zone_id}/email/routing/suppression/{suppression_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdEmailRoutingSuppressionSuppressionId("test", "test")

