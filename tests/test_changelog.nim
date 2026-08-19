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

suite "changelog serialization":
  test "round-trips FlagshipError":
    let obj = newFlagshipError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FlagshipError)) == openjson.toJson(obj)

  test "round-trips FlagshipResultInfo":
    let obj = newFlagshipResultInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.FlagshipResultInfo)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyChangelogResponse":
    let obj = cloudflare.GetAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyChangelogResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyChangelogResponse)) == openjson.toJson(obj)

suite "changelog endpoints":
  test "GET /accounts/{account_id}/flagship/apps/{app_id}/flags/{flag_key}/changelog":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyChangelog("test", "test", "test", "test", "test")

