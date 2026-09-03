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

suite "threat_signals serialization":
  test "round-trips GetAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2ThreatSignalsIndicatorsResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsIndicatorsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsIndicatorsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdTagCategoriesResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdTagCategoriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdTagCategoriesResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdTagCategoriesResponse":
    let obj = cloudflare.PutAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdTagCategoriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdTagCategoriesResponse)) == openjson.toJson(obj)

suite "threat_signals endpoints":
  test "GET /accounts/{account_id}/cloudforce-one/v2/threat-signals/articles":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2ThreatSignalsArticles("test", "test", 1, "test", true, "test", "test", "test", true, "test", "test", "test", "test", "test", "test", {}, {}, "test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/threat-signals/articles/{article_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleId("test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/threat-signals/articles/{article_id}/content":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdContent("test", "test", {})

  test "GET /accounts/{account_id}/cloudforce-one/v2/threat-signals/articles/{article_id}/skills/{skill_id}/output":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdSkillsSkillIdOutput("test", "test", "test")

  test "POST /accounts/{account_id}/cloudforce-one/v2/threat-signals/articles/{article_id}/tag":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTag("test", "test")

  test "DELETE /accounts/{account_id}/cloudforce-one/v2/threat-signals/articles/{article_id}/tags/{tag_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagsTagId("test", "test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/threat-signals/curated-feeds":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeeds("test", "test", true)

  test "DELETE /accounts/{account_id}/cloudforce-one/v2/threat-signals/curated-feeds/{curated_feed_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsCuratedFeedId("test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/threat-signals/feeds":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2ThreatSignalsFeeds("test", 1, 1, 1, "test", "test", {}, true, "test")

  test "POST /accounts/{account_id}/cloudforce-one/v2/threat-signals/feeds/poll":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsPoll("test", openjson.newJObject())

  test "DELETE /accounts/{account_id}/cloudforce-one/v2/threat-signals/feeds/{feed_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedId("test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/threat-signals/feeds/{feed_id}/raw":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdRaw("test", "test", {})

  test "GET /accounts/{account_id}/cloudforce-one/v2/threat-signals/feeds/{feed_id}/skills":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdSkills("test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/threat-signals/health":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2ThreatSignalsHealth("test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/threat-signals/indicators":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2ThreatSignalsIndicators("test", "test", "test", "test", 1, "test", true, "test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/threat-signals/skills":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2ThreatSignalsSkills("test", 1, 1)

  test "GET /accounts/{account_id}/cloudforce-one/v2/threat-signals/skills/{skill_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillId("test", "test")

  test "DELETE /accounts/{account_id}/cloudforce-one/v2/threat-signals/skills/{skill_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillId("test", "test")

