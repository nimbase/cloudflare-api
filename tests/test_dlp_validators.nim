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

suite "dlp_validators serialization":
  test "round-trips DlpWorkerValidatorWrite":
    let obj = newDlpWorkerValidatorWrite()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpWorkerValidatorWrite)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseSingle":
    let obj = newDlpApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips DlpWorkerValidator":
    let obj = newDlpWorkerValidator()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpWorkerValidator)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseCommonFailure":
    let obj = newDlpApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DlpProximityWordValidatorWrite":
    let obj = newDlpProximityWordValidatorWrite()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpProximityWordValidatorWrite)) == openjson.toJson(obj)

  test "round-trips DlpWorkerValidatorStatus":
    let obj = newDlpWorkerValidatorStatus()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpWorkerValidatorStatus)) == openjson.toJson(obj)

  test "round-trips DlpValidator":
    let obj = newDlpValidator()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpValidator)) == openjson.toJson(obj)

  test "round-trips DlpProximityWordValidator":
    let obj = newDlpProximityWordValidator()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpProximityWordValidator)) == openjson.toJson(obj)

  test "round-trips DlpEmpty":
    let obj = newDlpEmpty()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpEmpty)) == openjson.toJson(obj)

suite "dlp_validators endpoints":
  test "GET /accounts/{account_id}/dlp/validators":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpValidators(openjson.newJObject(), "test")

  test "GET /accounts/{account_id}/dlp/validators/proximity_words":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpValidatorsProximityWords("test")

  test "POST /accounts/{account_id}/dlp/validators/proximity_words":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDlpValidatorsProximityWords("test", newDlpProximityWordValidatorWrite())

  test "GET /accounts/{account_id}/dlp/validators/proximity_words/{validator_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpValidatorsProximityWordsValidatorId("test", "test")

  test "PUT /accounts/{account_id}/dlp/validators/proximity_words/{validator_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDlpValidatorsProximityWordsValidatorId("test", "test", newDlpProximityWordValidatorWrite())

  test "DELETE /accounts/{account_id}/dlp/validators/proximity_words/{validator_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDlpValidatorsProximityWordsValidatorId("test", "test")

  test "GET /accounts/{account_id}/dlp/validators/worker":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpValidatorsWorker("test")

  test "POST /accounts/{account_id}/dlp/validators/worker":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDlpValidatorsWorker("test", newDlpWorkerValidatorWrite())

  test "GET /accounts/{account_id}/dlp/validators/worker/{validator_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpValidatorsWorkerValidatorId("test", "test")

  test "PUT /accounts/{account_id}/dlp/validators/worker/{validator_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDlpValidatorsWorkerValidatorId("test", "test", newDlpWorkerValidatorWrite())

  test "DELETE /accounts/{account_id}/dlp/validators/worker/{validator_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDlpValidatorsWorkerValidatorId("test", "test")

  test "GET /accounts/{account_id}/dlp/validators/worker/{validator_id}/status":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpValidatorsWorkerValidatorIdStatus("test", "test")

  test "GET /accounts/{account_id}/dlp/validators/{validator_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDlpValidatorsValidatorId("test", "test")

