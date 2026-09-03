# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesResponse* = object
    errors: seq[JsonNode]
    result: JsonNode
    success: bool
  PatchAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesRequest = object
    article_ids: seq[string]
    read: bool
  PatchAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdRequest = object
    read: bool
  PostAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagsRequest = object
    tag_id: string
  PostAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsRequest = object
    category: string
    display_order: Option[int64]
    is_active: Option[bool]
    name: string
    url: string
    why_valuable: Option[string]
  PostAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsBulkRequest = object
    feeds: seq[JsonNode]
  PatchAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsOptOutRequest = object
    opted_out: bool
  PatchAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsCuratedFeedIdRequest = object
    category: Option[string]
    display_order: Option[int64]
    is_active: Option[bool]
    name: Option[string]
    url: Option[string]
    why_valuable: Option[string]
  PostAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsRequest = object
    category: Option[string]
    curated_feed_id: Option[string]
    display_name: Option[string]
    enabled: Option[bool]
    poll_interval_s: Option[int64]
    title: Option[string]
    url: Option[string]
  PatchAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdRequest = object
    category: Option[string]
    display_name: Option[string]
    enabled: Option[bool]
    poll_interval_s: Option[int64]
    title: Option[string]
  PutAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdSkillsRequest = object
    skill_ids: seq[string]
  GetAccountsAccountIdCloudforceOneV2ThreatSignalsIndicatorsResponse* = object
    errors: seq[JsonNode]
    result: JsonNode
    success: bool
  PostAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsRequest = object
    name: string
    output_schema: string
    prompt: string
    `type`: string
  PatchAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdRequest = object
    config: Option[string]
    is_active: Option[bool]
    name: Option[string]
    output_schema: Option[string]
    prompt: Option[string]
  GetAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdTagCategoriesResponse* = object
    errors: seq[JsonNode]
    result: JsonNode
    success: bool
  PutAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdTagCategoriesRequest = object
    category_uuids: seq[string]
  PutAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdTagCategoriesResponse* = object
    errors: seq[JsonNode]
    result: JsonNode
    success: bool
  ThreatSignalSourceTypeOption* = enum
    sourceTypeCurated = "curated"
    sourceTypeCustom = "custom"

  ThreatSignalTagAppliedByOption* = enum
    tagAppliedByAi = "ai"
    tagAppliedByAnalyst = "analyst"

  ThreatSignalFormatOption* = enum
    formatText = "text"
    formatHtml = "html"


proc getAccountsAccountIdCloudforceOneV2ThreatSignalsArticles*(client: CloudflareClient,
                                                               accountId: string,
                                                               cursor: string = default(string),
                                                               perPage: int64 = 20,
                                                               feedId: string = default(string),
                                                               read: bool = default(bool),
                                                               tagId: string = default(string),
                                                               tag: string = default(string),
                                                               tagCategory: string = default(string),
                                                               includeTotal: bool = false,
                                                               search: string = default(string),
                                                               publishedAfter: string = default(string),
                                                               publishedBefore: string = default(string),
                                                               fetchedAfter: string = default(string),
                                                               fetchedBefore: string = default(string),
                                                               feedCategory: string = default(string),
                                                               sourceType: ThreatSignalSourceTypeOption,
                                                               tagAppliedBy: ThreatSignalTagAppliedByOption,
                                                               sort: string = "-fetched_at"): Future[GetAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesResponse] {.async.} =
  ## List Threat Signals articles.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  q["feed_id"] = $feedId
  q["read"] = $read
  q["tag_id"] = $tagId
  q["tag"] = $tag
  q["tag_category"] = $tagCategory
  q["include_total"] = $includeTotal
  q["search"] = $search
  q["published_after"] = $publishedAfter
  q["published_before"] = $publishedBefore
  q["fetched_after"] = $fetchedAfter
  q["fetched_before"] = $fetchedBefore
  q["feed_category"] = $feedCategory
  q["source_type"] = $sourceType
  q["tag_applied_by"] = $tagAppliedBy
  q["sort"] = $sort
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/articles", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdCloudforceOneV2ThreatSignalsArticles*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 body: PatchAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesRequest): Future[AsyncResponse] {.async.} =
  ## Bulk update Threat Signals article read status.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/articles", body)
  return res

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleId*(client: CloudflareClient,
                                                                        accountId: string,
                                                                        articleId: string): Future[AsyncResponse] {.async.} =
  ## Get Threat Signals article.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/articles/{articleId}")
  return res

proc patchAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleId*(client: CloudflareClient,
                                                                          accountId: string,
                                                                          articleId: string,
                                                                          body: PatchAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdRequest): Future[AsyncResponse] {.async.} =
  ## Update Threat Signals article read status.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/articles/{articleId}", body)
  return res

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdContent*(client: CloudflareClient,
                                                                               accountId: string,
                                                                               articleId: string,
                                                                               format: ThreatSignalFormatOption): Future[AsyncResponse] {.async.} =
  ## Get Threat Signals article content.

  var q = initOrderedTable[string, string]()
  q["format"] = $format
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/articles/{articleId}/content", q)
  return res

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdSkillsSkillIdOutput*(client: CloudflareClient,
                                                                                           accountId: string,
                                                                                           articleId: string,
                                                                                           skillId: string): Future[AsyncResponse] {.async.} =
  ## Get Threat Signals article skill output.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/articles/{articleId}/skills/{skillId}/output")
  return res

proc postAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTag*(client: CloudflareClient,
                                                                            accountId: string,
                                                                            articleId: string): Future[AsyncResponse] {.async.} =
  ## Generate Threat Signals article AI tags.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/articles/{articleId}/tag")
  return res

proc postAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTags*(client: CloudflareClient,
                                                                             accountId: string,
                                                                             articleId: string,
                                                                             body: PostAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagsRequest): Future[AsyncResponse] {.async.} =
  ## Add tag to Threat Signals article.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/articles/{articleId}/tags", body)
  return res

proc deleteAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagsTagId*(client: CloudflareClient,
                                                                                    accountId: string,
                                                                                    articleId: string,
                                                                                    tagId: string): Future[AsyncResponse] {.async.} =
  ## Remove tag from Threat Signals article.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/articles/{articleId}/tags/{tagId}")
  return res

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeeds*(client: CloudflareClient,
                                                                   accountId: string,
                                                                   category: string = default(string),
                                                                   includeInactive: bool = false): Future[AsyncResponse] {.async.} =
  ## List curated Threat Signals feeds.

  var q = initOrderedTable[string, string]()
  q["category"] = $category
  q["include_inactive"] = $includeInactive
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/curated-feeds", q)
  return res

proc postAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeeds*(client: CloudflareClient,
                                                                    accountId: string,
                                                                    body: PostAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsRequest): Future[AsyncResponse] {.async.} =
  ## Create curated Threat Signals feed.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/curated-feeds", body)
  return res

proc postAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsBulk*(client: CloudflareClient,
                                                                        accountId: string,
                                                                        body: PostAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsBulkRequest): Future[AsyncResponse] {.async.} =
  ## Bulk create curated Threat Signals feeds.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/curated-feeds/bulk", body)
  return res

proc patchAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsOptOut*(client: CloudflareClient,
                                                                           accountId: string,
                                                                           body: PatchAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsOptOutRequest): Future[AsyncResponse] {.async.} =
  ## Opt out of curated Threat Signals feeds.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/curated-feeds/opt-out", body)
  return res

proc deleteAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsCuratedFeedId*(client: CloudflareClient,
                                                                                   accountId: string,
                                                                                   curatedFeedId: string): Future[AsyncResponse] {.async.} =
  ## Delete curated Threat Signals feed.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/curated-feeds/{curatedFeedId}")
  return res

proc patchAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsCuratedFeedId*(client: CloudflareClient,
                                                                                  accountId: string,
                                                                                  curatedFeedId: string,
                                                                                  body: PatchAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsCuratedFeedIdRequest): Future[AsyncResponse] {.async.} =
  ## Update curated Threat Signals feed.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/curated-feeds/{curatedFeedId}", body)
  return res

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsFeeds*(client: CloudflareClient,
                                                            accountId: string,
                                                            page: int64 = 1,
                                                            perPage: int64 = 20,
                                                            limit: int64 = default(int64),
                                                            sort: string = "-created_at",
                                                            category: string = default(string),
                                                            sourceType: ThreatSignalSourceTypeOption,
                                                            enabled: bool = default(bool),
                                                            status: string = default(string)): Future[AsyncResponse] {.async.} =
  ## List Threat Signals feeds.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["limit"] = $limit
  q["sort"] = $sort
  q["category"] = $category
  q["source_type"] = $sourceType
  q["enabled"] = $enabled
  q["status"] = $status
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/feeds", q)
  return res

proc postAccountsAccountIdCloudforceOneV2ThreatSignalsFeeds*(client: CloudflareClient,
                                                             accountId: string,
                                                             body: PostAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsRequest): Future[AsyncResponse] {.async.} =
  ## Create Threat Signals feed.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/feeds", body)
  return res

proc postAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsPoll*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 feedId: JsonNode = default(JsonNode)): Future[AsyncResponse] {.async.} =
  ## Trigger Threat Signals feed poll.

  var q = initOrderedTable[string, string]()
  q["feed_id"] = $feedId
  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/feeds/poll", q)
  return res

proc deleteAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedId*(client: CloudflareClient,
                                                                     accountId: string,
                                                                     feedId: string): Future[AsyncResponse] {.async.} =
  ## Delete Threat Signals feed.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/feeds/{feedId}")
  return res

proc patchAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedId*(client: CloudflareClient,
                                                                    accountId: string,
                                                                    feedId: string,
                                                                    body: PatchAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdRequest): Future[AsyncResponse] {.async.} =
  ## Update Threat Signals feed.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/feeds/{feedId}", body)
  return res

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdRaw*(client: CloudflareClient,
                                                                     accountId: string,
                                                                     feedId: string,
                                                                     format: ThreatSignalFormatOption): Future[AsyncResponse] {.async.} =
  ## Get Threat Signals feed XML.

  var q = initOrderedTable[string, string]()
  q["format"] = $format
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/feeds/{feedId}/raw", q)
  return res

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdSkills*(client: CloudflareClient,
                                                                        accountId: string,
                                                                        feedId: string): Future[AsyncResponse] {.async.} =
  ## Get Threat Signals feed skills.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/feeds/{feedId}/skills")
  return res

proc putAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdSkills*(client: CloudflareClient,
                                                                        accountId: string,
                                                                        feedId: string,
                                                                        body: PutAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdSkillsRequest): Future[AsyncResponse] {.async.} =
  ## Set Threat Signals feed skills.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/feeds/{feedId}/skills", body)
  return res

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsHealth*(client: CloudflareClient,
                                                             accountId: string): Future[AsyncResponse] {.async.} =
  ## Check Threat Signals service health.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/health")
  return res

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsIndicators*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 feedId: string = default(string),
                                                                 articleId: string = default(string),
                                                                 search: string = default(string),
                                                                 perPage: int64 = 20,
                                                                 sort: string = "id",
                                                                 includeTotal: bool = false,
                                                                 cursor: string = default(string)): Future[GetAccountsAccountIdCloudforceOneV2ThreatSignalsIndicatorsResponse] {.async.} =
  ## List Threat Signals article indicators.

  var q = initOrderedTable[string, string]()
  q["feed_id"] = $feedId
  q["article_id"] = $articleId
  q["search"] = $search
  q["per_page"] = $perPage
  q["sort"] = $sort
  q["include_total"] = $includeTotal
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/indicators", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2ThreatSignalsIndicatorsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsSkills*(client: CloudflareClient,
                                                             accountId: string,
                                                             page: int64 = 1,
                                                             perPage: int64 = 20): Future[AsyncResponse] {.async.} =
  ## List Threat Signals skills.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/skills", q)
  return res

proc postAccountsAccountIdCloudforceOneV2ThreatSignalsSkills*(client: CloudflareClient,
                                                              accountId: string,
                                                              body: PostAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsRequest): Future[AsyncResponse] {.async.} =
  ## Create Threat Signals skill.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/skills", body)
  return res

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillId*(client: CloudflareClient,
                                                                    accountId: string,
                                                                    skillId: string): Future[AsyncResponse] {.async.} =
  ## Get Threat Signals skill.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/skills/{skillId}")
  return res

proc deleteAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillId*(client: CloudflareClient,
                                                                       accountId: string,
                                                                       skillId: string): Future[AsyncResponse] {.async.} =
  ## Delete Threat Signals skill.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/skills/{skillId}")
  return res

proc patchAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillId*(client: CloudflareClient,
                                                                      accountId: string,
                                                                      skillId: string,
                                                                      body: PatchAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdRequest): Future[AsyncResponse] {.async.} =
  ## Update Threat Signals skill.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/skills/{skillId}", body)
  return res

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdTagCategories*(client: CloudflareClient,
                                                                                 accountId: string,
                                                                                 skillId: SkillId): Future[GetAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdTagCategoriesResponse] {.async.} =
  ## Get Threat Signals skill tag categories.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/skills/{skillId}/tag-categories")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdTagCategoriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdTagCategories*(client: CloudflareClient,
                                                                                 accountId: string,
                                                                                 skillId: SkillId,
                                                                                 body: PutAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdTagCategoriesRequest): Future[PutAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdTagCategoriesResponse] {.async.} =
  ## Replace Threat Signals skill tag categories.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/skills/{skillId}/tag-categories", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdTagCategoriesResponse)
  else:
    raise newException(CloudflareClientError, body)
