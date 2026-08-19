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

suite "rollouts serialization":
  test "round-trips CcCreateApplicationRolloutRequest":
    let obj = newCcCreateApplicationRolloutRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcCreateApplicationRolloutRequest)) == openjson.toJson(obj)

  test "round-trips CcApplicationRollout":
    let obj = newCcApplicationRollout()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcApplicationRollout)) == openjson.toJson(obj)

  test "round-trips CcV4BaseResponse":
    let obj = newCcV4BaseResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcV4BaseResponse)) == openjson.toJson(obj)

  test "round-trips CcV4BaseErrorResponse":
    let obj = newCcV4BaseErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcV4BaseErrorResponse)) == openjson.toJson(obj)

suite "rollouts endpoints":
  test "POST /accounts/{account_id}/containers/applications/{application_id}/rollouts":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdContainersApplicationsApplicationIdRollouts("test", newCcCreateApplicationRolloutRequest())

