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

suite "email_sending_suppressions endpoints":
  test "GET /accounts/{account_id}/email/sending/suppressions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSendingSuppressions("test", 1, "test", "test", "test", reasonManual, scopeTypeAccount, "test")

  test "GET /accounts/{account_id}/email/sending/suppressions/{suppression_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSendingSuppressionsSuppressionId("test", "test")

  test "DELETE /accounts/{account_id}/email/sending/suppressions/{suppression_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdEmailSendingSuppressionsSuppressionId("test", "test")

