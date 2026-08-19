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

suite "logcontrol_cmb_config_for_an_account serialization":
  test "round-trips LogcontrolCmbConfigResponseSingle":
    let obj = newLogcontrolCmbConfigResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogcontrolCmbConfigResponseSingle)) == openjson.toJson(obj)

  test "round-trips LogcontrolApiResponseCommonFailure":
    let obj = newLogcontrolApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogcontrolApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips LogcontrolApiResponseCommon":
    let obj = newLogcontrolApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogcontrolApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips LogcontrolCmbConfig":
    let obj = newLogcontrolCmbConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LogcontrolCmbConfig)) == openjson.toJson(obj)

suite "logcontrol_cmb_config_for_an_account endpoints":
  test "GET /accounts/{account_id}/logs/control/cmb/config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLogsControlCmbConfig("test")

  test "POST /accounts/{account_id}/logs/control/cmb/config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdLogsControlCmbConfig("test", newLogcontrolCmbConfig())

  test "DELETE /accounts/{account_id}/logs/control/cmb/config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdLogsControlCmbConfig("test")

