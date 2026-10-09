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

  test "round-trips PatchAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesResponse":
    let obj = cloudflare.PatchAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdSkillsResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdSkillsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdSkillsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdSkillsSkillIdOutputResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdSkillsSkillIdOutputResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdSkillsSkillIdOutputResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdSkillsSkillIdRunResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdSkillsSkillIdRunResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdSkillsSkillIdRunResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagsResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagsResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagsTagIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagsTagIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagsTagIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2ThreatSignalsCategoriesResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsCategoriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsCategoriesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsOptOutResponse":
    let obj = cloudflare.PatchAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsOptOutResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsOptOutResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsPollResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsPollResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsPollResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdSkillsResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdSkillsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdSkillsResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdSkillsResponse":
    let obj = cloudflare.PutAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdSkillsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdSkillsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2ThreatSignalsHealthResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsHealthResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsHealthResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2ThreatSignalsIndicatorsResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsIndicatorsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsIndicatorsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2ThreatSignalsSearchResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsSearchResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsSearchResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdResponse)) == openjson.toJson(obj)

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
    discard waitFor client.getAccountsAccountIdCloudforceOneV2ThreatSignalsArticles("test", "test", 1, "test", @["test"], true, @["test"], @["test"], "test", "test", true, "test", "test", "test", "test", "test", "test", sourceTypeCurated, tagAppliedByAi, "test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/threat-signals/articles/{article_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleId("test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/threat-signals/articles/{article_id}/content":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdContent("test", "test", formatText)

  test "GET /accounts/{account_id}/cloudforce-one/v2/threat-signals/articles/{article_id}/skills":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdSkills("test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/threat-signals/articles/{article_id}/skills/{skill_id}/output":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdSkillsSkillIdOutput("test", "test", "test")

  test "POST /accounts/{account_id}/cloudforce-one/v2/threat-signals/articles/{article_id}/skills/{skill_id}/run":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdSkillsSkillIdRun("test", "test", openjson.newJObject())

  test "POST /accounts/{account_id}/cloudforce-one/v2/threat-signals/articles/{article_id}/tag":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTag("test", "test")

  test "DELETE /accounts/{account_id}/cloudforce-one/v2/threat-signals/articles/{article_id}/tags/{tag_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagsTagId("test", "test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/threat-signals/categories":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2ThreatSignalsCategories("test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/threat-signals/curated-feeds":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeeds("test", "test", true)

  test "GET /accounts/{account_id}/cloudforce-one/v2/threat-signals/feeds":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2ThreatSignalsFeeds("test", 1, 1, 1, "test", "test", sourceTypeCurated, true, "test")

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
    discard waitFor client.getAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdRaw("test", "test", formatText)

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

  test "GET /accounts/{account_id}/cloudforce-one/v2/threat-signals/search":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2ThreatSignalsSearch("test", "test", openjson.newJObject(), "test")

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

