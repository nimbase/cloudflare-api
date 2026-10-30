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

suite "priority_intelligence_requirements serialization":
  test "round-trips PostAccountsAccountIdCloudforceOneV2PriorityIntelligenceFiltersGenerateResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneV2PriorityIntelligenceFiltersGenerateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneV2PriorityIntelligenceFiltersGenerateResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2PriorityIntelligenceMatchesAggregateResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2PriorityIntelligenceMatchesAggregateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2PriorityIntelligenceMatchesAggregateResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2PriorityIntelligencePriorityIdMatchesAggregateResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2PriorityIntelligencePriorityIdMatchesAggregateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2PriorityIntelligencePriorityIdMatchesAggregateResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2PriorityIntelligencePriorityIdMatchesSeriesResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2PriorityIntelligencePriorityIdMatchesSeriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2PriorityIntelligencePriorityIdMatchesSeriesResponse)) == openjson.toJson(obj)

suite "priority_intelligence_requirements endpoints":
  test "GET /accounts/{account_id}/cloudforce-one/v2/priority-intelligence":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2PriorityIntelligence("test", 1, 1)

  test "GET /accounts/{account_id}/cloudforce-one/v2/priority-intelligence/constants":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2PriorityIntelligenceConstants("test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/priority-intelligence/interests":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2PriorityIntelligenceInterests("test", 1, 1, enabledTrue)

  test "GET /accounts/{account_id}/cloudforce-one/v2/priority-intelligence/interests/backtests/{backtest_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2PriorityIntelligenceInterestsBacktestsBacktestId("test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/priority-intelligence/interests/evaluations/{evaluation_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2PriorityIntelligenceInterestsEvaluationsEvaluationId("test", "test")

  test "DELETE /accounts/{account_id}/cloudforce-one/v2/priority-intelligence/interests/{interest_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneV2PriorityIntelligenceInterestsInterestId("test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/priority-intelligence/matches/aggregate":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2PriorityIntelligenceMatchesAggregate("test", "test", 1, "test", triageStateNew, includeBackfillTrue)

  test "GET /accounts/{account_id}/cloudforce-one/v2/priority-intelligence/profile":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2PriorityIntelligenceProfile("test")

  test "DELETE /accounts/{account_id}/cloudforce-one/v2/priority-intelligence/profile":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneV2PriorityIntelligenceProfile("test")

  test "POST /accounts/{account_id}/cloudforce-one/v2/priority-intelligence/quota":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCloudforceOneV2PriorityIntelligenceQuota("test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/priority-intelligence/{priority_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2PriorityIntelligencePriorityId("test", "test")

  test "DELETE /accounts/{account_id}/cloudforce-one/v2/priority-intelligence/{priority_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneV2PriorityIntelligencePriorityId("test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/priority-intelligence/{priority_id}/matches":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2PriorityIntelligencePriorityIdMatches("test", "test", "test", 1, triageStateNew)

  test "GET /accounts/{account_id}/cloudforce-one/v2/priority-intelligence/{priority_id}/matches/aggregate":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2PriorityIntelligencePriorityIdMatchesAggregate("test", "test", "test", 1, "test", triageStateNew, includeBackfillTrue)

  test "GET /accounts/{account_id}/cloudforce-one/v2/priority-intelligence/{priority_id}/matches/series":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2PriorityIntelligencePriorityIdMatchesSeries("test", "test", "test", "test", triageStateNew, includeBackfillTrue)

