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

suite "stream_live_inputs serialization":
  test "round-trips StreamUpdateInputRequest":
    let obj = newStreamUpdateInputRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamUpdateInputRequest)) == openjson.toJson(obj)

  test "round-trips StreamCreateInputRequest":
    let obj = newStreamCreateInputRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamCreateInputRequest)) == openjson.toJson(obj)

  test "round-trips StreamOutputResponseSingle":
    let obj = newStreamOutputResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamOutputResponseSingle)) == openjson.toJson(obj)

  test "round-trips StreamLiveInputResponseSingle":
    let obj = newStreamLiveInputResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamLiveInputResponseSingle)) == openjson.toJson(obj)

  test "round-trips StreamUpdateOutputRequest":
    let obj = newStreamUpdateOutputRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamUpdateOutputRequest)) == openjson.toJson(obj)

  test "round-trips StreamCreateOutputRequest":
    let obj = newStreamCreateOutputRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamCreateOutputRequest)) == openjson.toJson(obj)

  test "round-trips StreamOutputResponseCollection":
    let obj = newStreamOutputResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamOutputResponseCollection)) == openjson.toJson(obj)

  test "round-trips StreamApiResponseCommonFailure":
    let obj = newStreamApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips StreamLiveInputResponseCollection":
    let obj = newStreamLiveInputResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.StreamLiveInputResponseCollection)) == openjson.toJson(obj)

suite "stream_live_inputs endpoints":
  test "GET /accounts/{account_id}/stream/live_inputs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdStreamLiveInputs("test", true)

  test "POST /accounts/{account_id}/stream/live_inputs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdStreamLiveInputs("test", newStreamCreateInputRequest())

  test "GET /accounts/{account_id}/stream/live_inputs/{live_input_identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdStreamLiveInputsLiveInputIdentifier("test", "test")

  test "PUT /accounts/{account_id}/stream/live_inputs/{live_input_identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdStreamLiveInputsLiveInputIdentifier("test", "test", newStreamUpdateInputRequest())

  test "DELETE /accounts/{account_id}/stream/live_inputs/{live_input_identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdStreamLiveInputsLiveInputIdentifier("test", "test")

  test "POST /accounts/{account_id}/stream/live_inputs/{live_input_identifier}/disable":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdStreamLiveInputsLiveInputIdentifierDisable("test", "test")

  test "POST /accounts/{account_id}/stream/live_inputs/{live_input_identifier}/enable":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdStreamLiveInputsLiveInputIdentifierEnable("test", "test")

  test "GET /accounts/{account_id}/stream/live_inputs/{live_input_identifier}/outputs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdStreamLiveInputsLiveInputIdentifierOutputs("test", "test")

  test "POST /accounts/{account_id}/stream/live_inputs/{live_input_identifier}/outputs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdStreamLiveInputsLiveInputIdentifierOutputs("test", "test", newStreamCreateOutputRequest())

  test "PUT /accounts/{account_id}/stream/live_inputs/{live_input_identifier}/outputs/{output_identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdStreamLiveInputsLiveInputIdentifierOutputsOutputIdentifier("test", "test", "test", newStreamUpdateOutputRequest())

  test "DELETE /accounts/{account_id}/stream/live_inputs/{live_input_identifier}/outputs/{output_identifier}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdStreamLiveInputsLiveInputIdentifierOutputsOutputIdentifier("test", "test", "test")

  test "POST /accounts/{account_id}/stream/live_inputs/{live_input_identifier}/rotate_keys":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdStreamLiveInputsLiveInputIdentifierRotateKeys("test", "test")

