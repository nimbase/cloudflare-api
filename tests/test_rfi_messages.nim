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

suite "rfi_messages serialization":
  test "round-trips GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesNewResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesNewResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesNewResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesMessageIdResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesMessageIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesMessageIdResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesMessageIdResponse":
    let obj = cloudflare.PutAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesMessageIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesMessageIdResponse)) == openjson.toJson(obj)

suite "rfi_messages endpoints":
  test "GET /accounts/{account_id}/cloudforce-one/v2/requests/{project_type}/{request_id}/messages":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessages("test", "test", "test", "test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/requests/{project_type}/{request_id}/messages/{message_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesMessageId("test", "test", "test", "test")

