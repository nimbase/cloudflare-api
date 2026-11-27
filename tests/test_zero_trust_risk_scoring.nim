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
  test "round-trips RiskScoringApiResponseCommonFailure":
    let obj = newRiskScoringApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RiskScoringApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips RiskScoringRiskSummaryResponse":
    let obj = newRiskScoringRiskSummaryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RiskScoringRiskSummaryResponse)) == openjson.toJson(obj)

  test "round-trips RiskScoringBehaviorsResponse":
    let obj = newRiskScoringBehaviorsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RiskScoringBehaviorsResponse)) == openjson.toJson(obj)

  test "round-trips RiskScoringUpdateBehaviors":
    let obj = newRiskScoringUpdateBehaviors()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RiskScoringUpdateBehaviors)) == openjson.toJson(obj)

  test "round-trips RiskScoringBehaviorResponse":
    let obj = newRiskScoringBehaviorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RiskScoringBehaviorResponse)) == openjson.toJson(obj)

  test "round-trips RiskScoringRiskEventsResponse":
    let obj = newRiskScoringRiskEventsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RiskScoringRiskEventsResponse)) == openjson.toJson(obj)

  test "round-trips RiskScoringHighDlpBehaviorResponse":
    let obj = newRiskScoringHighDlpBehaviorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RiskScoringHighDlpBehaviorResponse)) == openjson.toJson(obj)

  test "round-trips RiskScoringRiskEventClustersResponse":
    let obj = newRiskScoringRiskEventClustersResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RiskScoringRiskEventClustersResponse)) == openjson.toJson(obj)

  test "round-trips RiskScoringEmptyResponse":
    let obj = newRiskScoringEmptyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RiskScoringEmptyResponse)) == openjson.toJson(obj)

  test "round-trips RiskScoringUpdateHighDlpBehavior":
    let obj = newRiskScoringUpdateHighDlpBehavior()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RiskScoringUpdateHighDlpBehavior)) == openjson.toJson(obj)

  test "round-trips RiskScoringUpdateBehavior":
    let obj = newRiskScoringUpdateBehavior()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RiskScoringUpdateBehavior)) == openjson.toJson(obj)

suite "zero_trust_risk_scoring endpoints":
  test "GET /accounts/{account_id}/zt_risk_scoring/behaviors":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdZtRiskScoringBehaviors("test")

  test "PUT /accounts/{account_id}/zt_risk_scoring/behaviors":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdZtRiskScoringBehaviors("test", newRiskScoringUpdateBehaviors())

  test "GET /accounts/{account_id}/zt_risk_scoring/behaviors/high_dlp":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdZtRiskScoringBehaviorsHighDlp("test")

  test "PUT /accounts/{account_id}/zt_risk_scoring/behaviors/high_dlp":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdZtRiskScoringBehaviorsHighDlp("test", newRiskScoringUpdateHighDlpBehavior())

  test "GET /accounts/{account_id}/zt_risk_scoring/summary":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdZtRiskScoringSummary("test", 1, 1, orderByLastEvent, directionAsc)

  test "GET /accounts/{account_id}/zt_risk_scoring/{user_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdZtRiskScoringUserId("test", "test", "test", "test", 1, 1, orderByLastEvent, directionAsc)

  test "GET /accounts/{account_id}/zt_risk_scoring/{user_id}/event_clusters":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdZtRiskScoringUserIdEventClusters("test", "test", "test", "test", 1, 1)

  test "POST /accounts/{account_id}/zt_risk_scoring/{user_id}/reset":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdZtRiskScoringUserIdReset("test", "test")

