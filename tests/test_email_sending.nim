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

suite "email_sending serialization":
  test "round-trips EmailSendingSendRawRequest":
    let obj = newEmailSendingSendRawRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSendingSendRawRequest)) == openjson.toJson(obj)

  test "round-trips EmailSendingEmailBuilder":
    let obj = newEmailSendingEmailBuilder()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSendingEmailBuilder)) == openjson.toJson(obj)

  test "round-trips EmailSendingLimitsResponseSingle":
    let obj = newEmailSendingLimitsResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSendingLimitsResponseSingle)) == openjson.toJson(obj)

  test "round-trips EmailSendingEmailSendResponse":
    let obj = newEmailSendingEmailSendResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSendingEmailSendResponse)) == openjson.toJson(obj)

  test "round-trips EmailSendingEmailApiError":
    let obj = newEmailSendingEmailApiError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSendingEmailApiError)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdEmailSendingSendResponse":
    let obj = cloudflare.PostAccountsAccountIdEmailSendingSendResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdEmailSendingSendResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdEmailSendingSendRawResponse":
    let obj = cloudflare.PostAccountsAccountIdEmailSendingSendRawResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdEmailSendingSendRawResponse)) == openjson.toJson(obj)

suite "email_sending endpoints":
  test "GET /accounts/{account_id}/email/sending/limits":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSendingLimits("test")

  test "GET /accounts/{account_id}/email/sending/messages/{message_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSendingMessagesMessageId("test", "test")

  test "POST /accounts/{account_id}/email/sending/send":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdEmailSendingSend("test", newEmailSendingEmailBuilder())

  test "POST /accounts/{account_id}/email/sending/send_raw":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdEmailSendingSendRaw("test", newEmailSendingSendRawRequest())

