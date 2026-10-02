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
  PatchAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  GetAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdResponse* = object
    errors: seq[JsonNode]
    result: JsonNode
    success: bool
  PatchAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdRequest = object
    read: bool
  PatchAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdResponse* = object
    errors: seq[JsonNode]
    result: JsonNode
    success: bool
  GetAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdSkillsSkillIdOutputResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  PostAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdSkillsSkillIdRunResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  PostAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  PostAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagsRequest = object
    tag_id: string
  PostAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagsTagIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  GetAccountsAccountIdCloudforceOneV2ThreatSignalsCategoriesResponse* = object
    errors: seq[JsonNode]
    result: JsonNode
    success: bool
  GetAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  PatchAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsOptOutRequest = object
    opted_out: bool
  PatchAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsOptOutResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  GetAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  PostAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsRequest = object
    category_id: Option[string]
    curated_feed_id: Option[string]
    display_name: Option[string]
    enabled: Option[bool]
    poll_interval_s: Option[int64]
    title: Option[string]
    url: Option[string]
  PostAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  PostAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsPollResponse* = object
    errors: seq[JsonNode]
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  PatchAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdRequest = object
    category_id: Option[string]
    display_name: Option[string]
    enabled: Option[bool]
    poll_interval_s: Option[int64]
    title: Option[string]
  PatchAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  GetAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdSkillsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  PutAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdSkillsRequest = object
    skill_ids: seq[string]
  PutAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdSkillsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  GetAccountsAccountIdCloudforceOneV2ThreatSignalsHealthResponse* = object
    status: string
  GetAccountsAccountIdCloudforceOneV2ThreatSignalsIndicatorsResponse* = object
    errors: seq[JsonNode]
    result: JsonNode
    success: bool
  GetAccountsAccountIdCloudforceOneV2ThreatSignalsSearchResponse* = object
    errors: seq[JsonNode]
    result: JsonNode
    success: bool
  GetAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  PostAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsRequest = object
    name: string
    output_schema: string
    prompt: string
    `type`: string
  PostAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  GetAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  PatchAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdRequest = object
    config: Option[string]
    is_active: Option[bool]
    name: Option[string]
    output_schema: Option[string]
    prompt: Option[string]
  PatchAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
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
    tagAppliedBySystem = "system"

  ThreatSignalFormatOption* = enum
    formatText = "text"
    formatHtml = "html"


proc getAccountsAccountIdCloudforceOneV2ThreatSignalsArticles*(client: CloudflareClient,
                                                               accountId: string,
                                                               cursor: string = default(string),
                                                               perPage: int64 = 20,
                                                               feedId: string = default(string),
                                                               articleId: seq[string] = @[],
                                                               read: bool = default(bool),
                                                               tagId: seq[string] = @[],
                                                               tagCategoryId: seq[string] = @[],
                                                               tag: string = default(string),
                                                               tagCategory: string = default(string),
                                                               includeTotal: bool = false,
                                                               search: string = default(string),
                                                               publishedAfter: string = default(string),
                                                               publishedBefore: string = default(string),
                                                               fetchedAfter: string = default(string),
                                                               fetchedBefore: string = default(string),
                                                               feedCategory: string = default(string),
                                                               sourceType: ThreatSignalSourceTypeOption = sourceTypeCurated,
                                                               tagAppliedBy: ThreatSignalTagAppliedByOption = tagAppliedByAi,
                                                               sort: string = "-fetched_at"): Future[GetAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesResponse] {.async.} =
  ## Lists articles from the account's Threat Signals feeds.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  q["feed_id"] = $feedId
  for v in articleId: q["article_id"] = $v
  q["read"] = $read
  for v in tagId: q["tag_id"] = $v
  for v in tagCategoryId: q["tag_category_id"] = $v
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
                                                                 body: PatchAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesRequest): Future[PatchAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesResponse] {.async.} =
  ## Marks up to 50 Threat Signals articles as read or unread.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/articles", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleId*(client: CloudflareClient,
                                                                        accountId: string,
                                                                        articleId: string): Future[GetAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdResponse] {.async.} =
  ## Retrieves a Threat Signals article with its summary, tags and indicator status.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/articles/{articleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleId*(client: CloudflareClient,
                                                                          accountId: string,
                                                                          articleId: string,
                                                                          body: PatchAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdRequest): Future[PatchAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdResponse] {.async.} =
  ## Marks a Threat Signals article as read or unread.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/articles/{articleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdContent*(client: CloudflareClient,
                                                                               accountId: string,
                                                                               articleId: string,
                                                                               format: ThreatSignalFormatOption = formatText): Future[AsyncResponse] {.async.} =
  ## Retrieves the stored body of a Threat Signals article as plain text or HTML.

  var q = initOrderedTable[string, string]()
  q["format"] = $format
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/articles/{articleId}/content", q)
  return res

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdSkillsSkillIdOutput*(client: CloudflareClient,
                                                                                           accountId: string,
                                                                                           articleId: string,
                                                                                           skillId: string): Future[GetAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdSkillsSkillIdOutputResponse] {.async.} =
  ## Retrieves the stored output of a skill for a Threat Signals article.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/articles/{articleId}/skills/{skillId}/output")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdSkillsSkillIdOutputResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdSkillsSkillIdRun*(client: CloudflareClient,
                                                                                         accountId: string,
                                                                                         articleId: string,
                                                                                         skillId: JsonNode): Future[PostAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdSkillsSkillIdRunResponse] {.async.} =
  ## Paid customer operation that always persists a managed default skill or an
  ## assigned active custom skill result without exposing diagnostic model data.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/articles/{articleId}/skills/{skillId}/run", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdSkillsSkillIdRunResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTag*(client: CloudflareClient,
                                                                            accountId: string,
                                                                            articleId: string): Future[PostAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagResponse] {.async.} =
  ## Runs the default AI tagging skill on an article and replaces its AI-applied
  ## tags.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/articles/{articleId}/tag")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTags*(client: CloudflareClient,
                                                                             accountId: string,
                                                                             articleId: string,
                                                                             body: PostAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagsRequest): Future[PostAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagsResponse] {.async.} =
  ## Applies a tag from the account's tag catalog to a Threat Signals article.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/articles/{articleId}/tags", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagsTagId*(client: CloudflareClient,
                                                                                    accountId: string,
                                                                                    articleId: string,
                                                                                    tagId: string): Future[DeleteAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagsTagIdResponse] {.async.} =
  ## Removes a tag from a Threat Signals article.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/articles/{articleId}/tags/{tagId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneV2ThreatSignalsArticlesArticleIdTagsTagIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsCategories*(client: CloudflareClient,
                                                                 accountId: string): Future[GetAccountsAccountIdCloudforceOneV2ThreatSignalsCategoriesResponse] {.async.} =
  ## Lists the predefined categories that can be assigned to feeds.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/categories")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2ThreatSignalsCategoriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeeds*(client: CloudflareClient,
                                                                   accountId: string,
                                                                   category: string = default(string),
                                                                   includeInactive: bool = false): Future[GetAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsResponse] {.async.} =
  ## Lists the curated feeds the account can subscribe to.

  var q = initOrderedTable[string, string]()
  q["category"] = $category
  q["include_inactive"] = $includeInactive
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/curated-feeds", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsOptOut*(client: CloudflareClient,
                                                                           accountId: string,
                                                                           body: PatchAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsOptOutRequest): Future[PatchAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsOptOutResponse] {.async.} =
  ## Opts the account out of, or back into, the curated feed catalog.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/curated-feeds/opt-out", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneV2ThreatSignalsCuratedFeedsOptOutResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsFeeds*(client: CloudflareClient,
                                                            accountId: string,
                                                            page: int64 = 1,
                                                            perPage: int64 = 20,
                                                            limit: int64 = default(int64),
                                                            sort: string = "-created_at",
                                                            category: string = default(string),
                                                            sourceType: ThreatSignalSourceTypeOption = sourceTypeCurated,
                                                            enabled: bool = default(bool),
                                                            status: string = default(string)): Future[GetAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsResponse] {.async.} =
  ## Lists the account's Threat Signals feed subscriptions.

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
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneV2ThreatSignalsFeeds*(client: CloudflareClient,
                                                             accountId: string,
                                                             body: PostAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsRequest): Future[PostAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsResponse] {.async.} =
  ## Subscribes the account to a custom or curated Threat Signals feed.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/feeds", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsPoll*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 feedId: JsonNode = default(JsonNode)): Future[PostAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsPollResponse] {.async.} =
  ## Starts an immediate poll of one or all Threat Signals feeds.

  var q = initOrderedTable[string, string]()
  q["feed_id"] = $feedId
  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/feeds/poll", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsPollResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedId*(client: CloudflareClient,
                                                                     accountId: string,
                                                                     feedId: string): Future[DeleteAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdResponse] {.async.} =
  ## Unsubscribes the account from a Threat Signals feed and deletes its articles.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/feeds/{feedId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedId*(client: CloudflareClient,
                                                                    accountId: string,
                                                                    feedId: string,
                                                                    body: PatchAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdRequest): Future[PatchAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdResponse] {.async.} =
  ## Updates a Threat Signals feed subscription.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/feeds/{feedId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdRaw*(client: CloudflareClient,
                                                                     accountId: string,
                                                                     feedId: string,
                                                                     format: ThreatSignalFormatOption = formatText): Future[AsyncResponse] {.async.} =
  ## Retrieves the feed document fetched by the most recent poll.

  var q = initOrderedTable[string, string]()
  q["format"] = $format
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/feeds/{feedId}/raw", q)
  return res

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdSkills*(client: CloudflareClient,
                                                                        accountId: string,
                                                                        feedId: string): Future[GetAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdSkillsResponse] {.async.} =
  ## Retrieves the effective skill pipeline for a Threat Signals feed.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/feeds/{feedId}/skills")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdSkillsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdSkills*(client: CloudflareClient,
                                                                        accountId: string,
                                                                        feedId: string,
                                                                        body: PutAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdSkillsRequest): Future[PutAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdSkillsResponse] {.async.} =
  ## Replaces the ordered custom skills assigned to a Threat Signals feed.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/feeds/{feedId}/skills", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdCloudforceOneV2ThreatSignalsFeedsFeedIdSkillsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsHealth*(client: CloudflareClient,
                                                             accountId: string): Future[GetAccountsAccountIdCloudforceOneV2ThreatSignalsHealthResponse] {.async.} =
  ## Checks that the Threat Signals API is reachable.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/health")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2ThreatSignalsHealthResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsIndicators*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 feedId: string = default(string),
                                                                 articleId: string = default(string),
                                                                 search: string = default(string),
                                                                 perPage: int64 = 20,
                                                                 sort: string = "id",
                                                                 includeTotal: bool = false,
                                                                 cursor: string = default(string)): Future[GetAccountsAccountIdCloudforceOneV2ThreatSignalsIndicatorsResponse] {.async.} =
  ## Lists indicators of compromise extracted from the account's Threat Signals
  ## articles.

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

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsSearch*(client: CloudflareClient,
                                                             accountId: string,
                                                             query: string,
                                                             maxResults: JsonNode = default(JsonNode),
                                                             feedId: string = default(string)): Future[GetAccountsAccountIdCloudforceOneV2ThreatSignalsSearchResponse] {.async.} =
  ## Searches the account's Threat Signals articles using keyword and semantic
  ## retrieval.

  var q = initOrderedTable[string, string]()
  q["query"] = $query
  q["max_results"] = $maxResults
  q["feed_id"] = $feedId
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/search", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2ThreatSignalsSearchResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsSkills*(client: CloudflareClient,
                                                             accountId: string,
                                                             page: int64 = 1,
                                                             perPage: int64 = 20): Future[GetAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsResponse] {.async.} =
  ## Lists the default and custom skills available to the account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/skills", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneV2ThreatSignalsSkills*(client: CloudflareClient,
                                                              accountId: string,
                                                              body: PostAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsRequest): Future[PostAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsResponse] {.async.} =
  ## Creates a custom AI skill for the account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/skills", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillId*(client: CloudflareClient,
                                                                    accountId: string,
                                                                    skillId: string): Future[GetAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdResponse] {.async.} =
  ## Retrieves a default or custom skill by ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/skills/{skillId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillId*(client: CloudflareClient,
                                                                       accountId: string,
                                                                       skillId: string): Future[DeleteAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdResponse] {.async.} =
  ## Deletes a custom skill. Default skills cannot be deleted.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/skills/{skillId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillId*(client: CloudflareClient,
                                                                      accountId: string,
                                                                      skillId: string,
                                                                      body: PatchAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdRequest): Future[PatchAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdResponse] {.async.} =
  ## Updates a custom skill. Default skills are read-only.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/skills/{skillId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdTagCategories*(client: CloudflareClient,
                                                                                 accountId: string,
                                                                                 skillId: SkillId): Future[GetAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdTagCategoriesResponse] {.async.} =
  ## Retrieves the tag categories the default tagging skill may choose tags from.

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
  ## Replaces the tag categories the default tagging skill may choose tags from.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cloudforce-one/v2/threat-signals/skills/{skillId}/tag-categories", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdCloudforceOneV2ThreatSignalsSkillsSkillIdTagCategoriesResponse)
  else:
    raise newException(CloudflareClientError, body)
