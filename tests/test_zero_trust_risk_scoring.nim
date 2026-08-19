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

suite "zero_trust_risk_scoring serialization":
  test "round-trips DlpBehaviors":
    let obj = newDlpBehaviors()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpBehaviors)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseSingle":
    let obj = newDlpApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips DlpUpdateBehaviors":
    let obj = newDlpUpdateBehaviors()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpUpdateBehaviors)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseCommonFailure":
    let obj = newDlpApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DlpRiskSummary":
    let obj = newDlpRiskSummary()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpRiskSummary)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseCollection":
    let obj = newDlpApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips DlpRiskEvents":
    let obj = newDlpRiskEvents()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpRiskEvents)) == openjson.toJson(obj)

  test "round-trips DlpEmpty":
    let obj = newDlpEmpty()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpEmpty)) == openjson.toJson(obj)

suite "zero_trust_risk_scoring endpoints":
  test "GET /accounts/{account_id}/zt_risk_scoring/behaviors":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdZtRiskScoringBehaviors("test")

  test "PUT /accounts/{account_id}/zt_risk_scoring/behaviors":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdZtRiskScoringBehaviors("test", newDlpUpdateBehaviors())

  test "GET /accounts/{account_id}/zt_risk_scoring/summary":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdZtRiskScoringSummary("test")

  test "GET /accounts/{account_id}/zt_risk_scoring/{user_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdZtRiskScoringUserId("test", "test")

  test "POST /accounts/{account_id}/zt_risk_scoring/{user_id}/reset":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdZtRiskScoringUserIdReset("test", "test")

