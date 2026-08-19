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

suite "email_sending_suppressions serialization":
  test "round-trips GetAccountsAccountIdEmailSendingSuppressionResponse":
    let obj = cloudflare.GetAccountsAccountIdEmailSendingSuppressionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdEmailSendingSuppressionResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdEmailSendingSuppressionResponse":
    let obj = cloudflare.PostAccountsAccountIdEmailSendingSuppressionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdEmailSendingSuppressionResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdEmailSendingSuppressionSuppressionIdResponse":
    let obj = cloudflare.GetAccountsAccountIdEmailSendingSuppressionSuppressionIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdEmailSendingSuppressionSuppressionIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdEmailSendingSuppressionSuppressionIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdEmailSendingSuppressionSuppressionIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdEmailSendingSuppressionSuppressionIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdEmailSendingSuppressionsResponse":
    let obj = cloudflare.GetAccountsAccountIdEmailSendingSuppressionsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdEmailSendingSuppressionsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdEmailSendingSuppressionsResponse":
    let obj = cloudflare.PostAccountsAccountIdEmailSendingSuppressionsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdEmailSendingSuppressionsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdEmailSendingSuppressionsBulkResponse":
    let obj = cloudflare.PostAccountsAccountIdEmailSendingSuppressionsBulkResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdEmailSendingSuppressionsBulkResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdEmailSendingSuppressionsSuppressionIdResponse":
    let obj = cloudflare.GetAccountsAccountIdEmailSendingSuppressionsSuppressionIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdEmailSendingSuppressionsSuppressionIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdEmailSendingSuppressionsSuppressionIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdEmailSendingSuppressionsSuppressionIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdEmailSendingSuppressionsSuppressionIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdEmailSendingSuppressionsSuppressionIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdEmailSendingSuppressionsSuppressionIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdEmailSendingSuppressionsSuppressionIdResponse)) == openjson.toJson(obj)

  test "round-trips GetZonesZoneIdEmailSendingSuppressionResponse":
    let obj = cloudflare.GetZonesZoneIdEmailSendingSuppressionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetZonesZoneIdEmailSendingSuppressionResponse)) == openjson.toJson(obj)

  test "round-trips PostZonesZoneIdEmailSendingSuppressionResponse":
    let obj = cloudflare.PostZonesZoneIdEmailSendingSuppressionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostZonesZoneIdEmailSendingSuppressionResponse)) == openjson.toJson(obj)

  test "round-trips GetZonesZoneIdEmailSendingSuppressionSuppressionIdResponse":
    let obj = cloudflare.GetZonesZoneIdEmailSendingSuppressionSuppressionIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetZonesZoneIdEmailSendingSuppressionSuppressionIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteZonesZoneIdEmailSendingSuppressionSuppressionIdResponse":
    let obj = cloudflare.DeleteZonesZoneIdEmailSendingSuppressionSuppressionIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteZonesZoneIdEmailSendingSuppressionSuppressionIdResponse)) == openjson.toJson(obj)

suite "email_sending_suppressions endpoints":
  test "GET /accounts/{account_id}/email/sending/suppression":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSendingSuppression("test", 1, 1, {}, {})

  test "GET /accounts/{account_id}/email/sending/suppression/{suppression_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSendingSuppressionSuppressionId("test", "test")

  test "DELETE /accounts/{account_id}/email/sending/suppression/{suppression_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdEmailSendingSuppressionSuppressionId("test", "test")

  test "GET /accounts/{account_id}/email/sending/suppressions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSendingSuppressions("test", 1, "test", "test", "test", {})

  test "GET /accounts/{account_id}/email/sending/suppressions/{suppression_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSendingSuppressionsSuppressionId("test", "test")

  test "DELETE /accounts/{account_id}/email/sending/suppressions/{suppression_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdEmailSendingSuppressionsSuppressionId("test", "test")

  test "GET /zones/{zone_id}/email/sending/suppression":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdEmailSendingSuppression("test", 1, 1, {}, {})

  test "GET /zones/{zone_id}/email/sending/suppression/{suppression_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdEmailSendingSuppressionSuppressionId("test", "test")

  test "DELETE /zones/{zone_id}/email/sending/suppression/{suppression_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdEmailSendingSuppressionSuppressionId("test", "test")

