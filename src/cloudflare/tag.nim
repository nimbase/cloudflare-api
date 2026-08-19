# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdTagsTagUuidIndicatorsResponse* = object
    indicators: seq[JsonNode]
    pagination: JsonNode
  GetAccountsAccountIdCloudforceOneEventsTagsResponse* = object
    pagination: JsonNode
    tags: seq[JsonNode]
  PostAccountsAccountIdCloudforceOneEventsTagsCreateRequest = object
    active_duration: Option[string]
    actor_category: Option[string]
    actor_category_confidence: Option[int64]
    alias_group_names: Option[seq[string]]
    alias_group_names_internal: Option[seq[string]]
    aliases: Option[seq[JsonNode]]
    analytic_priority: Option[float64]
    attribution_confidence: Option[string]
    attribution_confidence_score: Option[int64]
    attribution_organization: Option[string]
    category_uuid: Option[string]
    date_of_discovery: Option[string]
    external_reference_links: Option[seq[string]]
    external_references: Option[seq[JsonNode]]
    internal_aliases: Option[seq[JsonNode]]
    internal_description: Option[string]
    motive: Option[string]
    motive_confidence: Option[int64]
    opsec_level: Option[string]
    origin_country_confidence: Option[int64]
    origin_country_i_s_o: Option[string]
    origin_country_tlp: Option[string]
    priority: Option[float64]
    sophistication_level: Option[string]
    value: string
  PostAccountsAccountIdCloudforceOneEventsTagsCreateResponse* = object
    active_duration: string
    actor_category: string
    actor_category_confidence: int64
      ## Confidence (1-10) in the actor variety (actorCategory). CFONE-only: stripped
      ## from responses to non-CFONE accounts.
    alias_group_names: seq[string]
    alias_group_names_internal: seq[string]
    aliases: seq[JsonNode]
      ## Structured aliases ({ value, confidence 1-10, tlp }). CFONE-only: stripped from
      ## responses to non-CFONE accounts.
    analytic_priority: float64
    attribution_confidence: string
    attribution_confidence_score: int64
    attribution_organization: string
    category_name: string
    category_uuid: string
    date_of_discovery: string
    external_reference_links: seq[string]
    external_references: seq[JsonNode]
      ## Structured external references ({ url, description }). Public: returned to all
      ## accounts.
    internal_aliases: seq[JsonNode]
      ## Internal structured aliases ({ value, confidence 1-10, tlp }). CFONE-only: never
      ## returned to non-CFONE accounts.
    internal_description: string
    motive: string
    motive_confidence: int64
      ## Confidence (1-10) in the actor motive. CFONE-only: stripped from responses to
      ## non-CFONE accounts.
    opsec_level: string
    origin_country_confidence: int64
      ## Confidence (1-10) in the origin-country attribution. CFONE-only: stripped from
      ## responses to non-CFONE accounts.
    origin_country_i_s_o: string
    origin_country_i_s_o_alpha3: string
    origin_country_tlp: string
      ## TLP marking for the origin-country attribution. CFONE-only: stripped from
      ## responses to non-CFONE accounts.
    priority: float64
    sophistication_level: string
    uuid: string
    value: string
  DeleteAccountsAccountIdCloudforceOneEventsTagsTagUuidResponse* = object
    uuid: string
  PatchAccountsAccountIdCloudforceOneEventsTagsTagUuidRequest = object
    active_duration: Option[string]
    actor_category: Option[string]
    actor_category_confidence: Option[int64]
    alias_group_names: Option[seq[string]]
    alias_group_names_internal: Option[seq[string]]
    aliases: Option[seq[JsonNode]]
    analytic_priority: Option[float64]
    attribution_confidence: Option[string]
    attribution_confidence_score: Option[int64]
    attribution_organization: Option[string]
    category_uuid: Option[string]
    date_of_discovery: Option[string]
    external_reference_links: Option[seq[string]]
    external_references: Option[seq[JsonNode]]
    internal_aliases: Option[seq[JsonNode]]
    internal_description: Option[string]
    motive: Option[string]
    motive_confidence: Option[int64]
    opsec_level: Option[string]
    origin_country_confidence: Option[int64]
    origin_country_i_s_o: Option[string]
    origin_country_tlp: Option[string]
    priority: Option[float64]
    sophistication_level: Option[string]
    value: Option[string]
  PatchAccountsAccountIdCloudforceOneEventsTagsTagUuidResponse* = object
    active_duration: string
    actor_category: string
    actor_category_confidence: int64
      ## Confidence (1-10) in the actor variety (actorCategory). CFONE-only: stripped
      ## from responses to non-CFONE accounts.
    alias_group_names: seq[string]
    alias_group_names_internal: seq[string]
    aliases: seq[JsonNode]
      ## Structured aliases ({ value, confidence 1-10, tlp }). CFONE-only: stripped from
      ## responses to non-CFONE accounts.
    analytic_priority: float64
    attribution_confidence: string
    attribution_confidence_score: int64
    attribution_organization: string
    category_name: string
    category_uuid: string
    date_of_discovery: string
    external_reference_links: seq[string]
    external_references: seq[JsonNode]
      ## Structured external references ({ url, description }). Public: returned to all
      ## accounts.
    internal_aliases: seq[JsonNode]
      ## Internal structured aliases ({ value, confidence 1-10, tlp }). CFONE-only: never
      ## returned to non-CFONE accounts.
    internal_description: string
    motive: string
    motive_confidence: int64
      ## Confidence (1-10) in the actor motive. CFONE-only: stripped from responses to
      ## non-CFONE accounts.
    opsec_level: string
    origin_country_confidence: int64
      ## Confidence (1-10) in the origin-country attribution. CFONE-only: stripped from
      ## responses to non-CFONE accounts.
    origin_country_i_s_o: string
    origin_country_i_s_o_alpha3: string
    origin_country_tlp: string
      ## TLP marking for the origin-country attribution. CFONE-only: stripped from
      ## responses to non-CFONE accounts.
    priority: float64
    sophistication_level: string
    uuid: string
    value: string
  GetAccountsAccountIdCloudforceOneEventsTagsTagUuidIndicatorsResponse* = object
    indicators: seq[JsonNode]
    pagination: JsonNode
  TagCacheOption* = enum
    cacheFromGraph = "from-graph"


proc getAccountsAccountIdCloudforceOneEventsDatasetDatasetIdTagsTagUuidIndicators*(client: CloudflareClient,
                                                                                   accountId: string,
                                                                                   tagUuid: string,
                                                                                   datasetId: string,
                                                                                   page: float64 = default(float64),
                                                                                   pageSize: float64 = default(float64),
                                                                                   indicatorType: string = default(string),
                                                                                   relatedEvent: seq[string] = @[],
                                                                                   search: seq[string] = @[]): Future[GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdTagsTagUuidIndicatorsResponse] {.async.} =
  ## This endpoint is deprecated. Use GET
  ## /:account_id/events/tags/:tag_uuid/indicators with the optional datasetIds query
  ## parameter instead. Returns indicators associated with the provided tag UUID
  ## within a single dataset's indicator shards, with pagination.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["pageSize"] = $pageSize
  q["indicatorType"] = $indicatorType
  for v in relatedEvent: q["relatedEvent"] = $v
  for v in search: q["search"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}/tags/{tagUuid}/indicators", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdTagsTagUuidIndicatorsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsTags*(client: CloudflareClient,
                                                  accountId: string,
                                                  page: float64 = default(float64),
                                                  pageSize: float64 = default(float64),
                                                  search: string = default(string),
                                                  categoryUuid: string = default(string),
                                                  filters: seq[string] = @[],
                                                  cache: set[TagCacheOption] = {}): Future[GetAccountsAccountIdCloudforceOneEventsTagsResponse] {.async.} =
  ## Returns all Source-of-Truth tags for an account. Supports legacy free-text
  ## `search` on tag value and `categoryUuid` exact match, plus a structured
  ## `filters` JSON array for filtering by metadata fields (originCountryISO,
  ## actorCategory, motive, priority, etc.). Country values may be passed as alpha-2,
  ## alpha-3, name, or common alias.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["pageSize"] = $pageSize
  q["search"] = $search
  q["categoryUuid"] = $categoryUuid
  for v in filters: q["filters"] = $v
  for v in cache: q["cache"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/tags", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsTagsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsTagsCreate*(client: CloudflareClient,
                                                         accountId: string,
                                                         body: PostAccountsAccountIdCloudforceOneEventsTagsCreateRequest): Future[PostAccountsAccountIdCloudforceOneEventsTagsCreateResponse] {.async.} =
  ## Creates a new tag to be used accross threat events.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/tags/create", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsTagsCreateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneEventsTagsTagUuid*(client: CloudflareClient,
                                                            accountId: string,
                                                            tagUuid: string): Future[DeleteAccountsAccountIdCloudforceOneEventsTagsTagUuidResponse] {.async.} =
  ## Deletes a Source-of-Truth tag by UUID.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/events/tags/{tagUuid}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneEventsTagsTagUuidResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdCloudforceOneEventsTagsTagUuid*(client: CloudflareClient,
                                                           accountId: string,
                                                           tagUuid: string,
                                                           body: PatchAccountsAccountIdCloudforceOneEventsTagsTagUuidRequest): Future[PatchAccountsAccountIdCloudforceOneEventsTagsTagUuidResponse] {.async.} =
  ## Updates a Source-of-Truth tag by UUID.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/events/tags/{tagUuid}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneEventsTagsTagUuidResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsTagsTagUuidIndicators*(client: CloudflareClient,
                                                                   accountId: string,
                                                                   tagUuid: string,
                                                                   datasetIds: seq[string] = @[],
                                                                   page: float64 = default(float64),
                                                                   pageSize: float64 = default(float64),
                                                                   indicatorType: string = default(string),
                                                                   relatedEvent: seq[string] = @[],
                                                                   search: seq[string] = @[]): Future[GetAccountsAccountIdCloudforceOneEventsTagsTagUuidIndicatorsResponse] {.async.} =
  ## Returns indicators associated with the provided tag UUID, with pagination. By
  ## default fans out across every indicator dataset the account can read; pass
  ## datasetIds to scope to specific datasets.

  var q = initOrderedTable[string, string]()
  for v in datasetIds: q["datasetIds"] = $v
  q["page"] = $page
  q["pageSize"] = $pageSize
  q["indicatorType"] = $indicatorType
  for v in relatedEvent: q["relatedEvent"] = $v
  for v in search: q["search"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/tags/{tagUuid}/indicators", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsTagsTagUuidIndicatorsResponse)
  else:
    raise newException(CloudflareClientError, body)
