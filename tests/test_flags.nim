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

suite "flags serialization":
  test "round-trips FlagshipError":
    let obj = newFlagshipError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FlagshipError)) == openjson.toJson(obj)

  test "round-trips FlagshipFlag":
    let obj = newFlagshipFlag()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FlagshipFlag)) == openjson.toJson(obj)

  test "round-trips FlagshipResultInfo":
    let obj = newFlagshipResultInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FlagshipResultInfo)) == openjson.toJson(obj)

  test "round-trips FlagshipDeleteFlagResult":
    let obj = newFlagshipDeleteFlagResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FlagshipDeleteFlagResult)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdFlagshipAppsAppIdFlagsResponse":
    let obj = cloudflare.GetAccountsAccountIdFlagshipAppsAppIdFlagsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdFlagshipAppsAppIdFlagsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdFlagshipAppsAppIdFlagsResponse":
    let obj = cloudflare.PostAccountsAccountIdFlagshipAppsAppIdFlagsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdFlagshipAppsAppIdFlagsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyResponse":
    let obj = cloudflare.GetAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyResponse":
    let obj = cloudflare.PutAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyResponse":
    let obj = cloudflare.DeleteAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyResponse)) == openjson.toJson(obj)

suite "flags endpoints":
  test "GET /accounts/{account_id}/flagship/apps/{app_id}/flags":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdFlagshipAppsAppIdFlags("test", "test", "test", "test")

  test "GET /accounts/{account_id}/flagship/apps/{app_id}/flags/{flag_key}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdFlagshipAppsAppIdFlagsFlagKey("test", "test", "test")

  test "DELETE /accounts/{account_id}/flagship/apps/{app_id}/flags/{flag_key}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdFlagshipAppsAppIdFlagsFlagKey("test", "test", "test")

