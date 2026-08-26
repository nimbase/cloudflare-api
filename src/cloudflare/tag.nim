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
    active_duration: Option[JsonNode]
    actor_category: Option[JsonNode]
    alias_group_names: Option[seq[string]]
    alias_group_names_internal: Option[seq[string]]
    aliases: Option[seq[JsonNode]]
    attribution_organization: Option[JsonNode]
    category_uuid: Option[string]
    confidence: Option[int64]
    date_of_discovery: Option[string]
    description: Option[string]
    external_reference_links: Option[seq[string]]
    external_references: Option[seq[JsonNode]]
    internal_aliases: Option[seq[JsonNode]]
    internal_description: Option[string]
    last_seen: Option[string]
    motive: Option[JsonNode]
    opsec_level: Option[JsonNode]
    origin_country_i_s_o: Option[JsonNode]
    priority: Option[JsonNode]
    properties: Option[JsonNode]
    sophistication_level: Option[JsonNode]
    tlp: Option[string]
    value: string
  PostAccountsAccountIdCloudforceOneEventsTagsCreateResponse* = object
    active_duration: string
    active_duration_annotated: JsonNode
    actor_category: string
    actor_category_annotated: JsonNode
    alias_group_names: seq[string]
    alias_group_names_internal: seq[string]
    aliases: seq[JsonNode]
      ## Structured aliases ({ value, confidence 1-10, tlp }). CFONE-only: stripped from
      ## responses to non-CFONE accounts.
    attribution_organization: string
    attribution_organization_annotated: JsonNode
    category_name: string
    category_uuid: string
    confidence: int64
      ## Overall tag confidence (1-10).
    created_at: string
    date_of_discovery: string
    description: string
    external_reference_links: seq[string]
    external_references: seq[JsonNode]
      ## Structured external references ({ url, description }). Public: returned to all
      ## accounts.
    external_references_annotated: seq[JsonNode]
    internal_aliases: seq[JsonNode]
      ## Internal structured aliases ({ value, confidence 1-10, tlp }). CFONE-only: never
      ## returned to non-CFONE accounts.
    internal_description: string
    last_seen: string
    motive: string
    motive_annotated: JsonNode
    opsec_level: string
    opsec_level_annotated: JsonNode
    origin_country_i_s_o: string
      ## ISO country code (alpha-2 or alpha-3). Normalized to uppercase on read. Null
      ## when stored value is blank/whitespace.
    origin_country_i_s_o_annotated: JsonNode
    priority: float64
    priority_annotated: JsonNode
    properties: JsonNode
      ## Parsed custom field values. Null when the tag has no custom fields.
    sophistication_level: string
    sophistication_level_annotated: JsonNode
    tlp: string
      ## Tag-level TLP handling marking.
    updated_at: string
    uuid: string
    value: string
    version: float64
  GetAccountsAccountIdCloudforceOneEventsTagsTagUuidResponse* = object
    active_duration: string
    active_duration_annotated: JsonNode
    actor_category: string
    actor_category_annotated: JsonNode
    alias_group_names: seq[string]
    alias_group_names_internal: seq[string]
    aliases: seq[JsonNode]
      ## Structured aliases ({ value, confidence 1-10, tlp }). CFONE-only: stripped from
      ## responses to non-CFONE accounts.
    attribution_organization: string
    attribution_organization_annotated: JsonNode
    category_name: string
    category_uuid: string
    confidence: int64
      ## Overall tag confidence (1-10).
    created_at: string
    date_of_discovery: string
    description: string
    external_reference_links: seq[string]
    external_references: seq[JsonNode]
      ## Structured external references ({ url, description }). Public: returned to all
      ## accounts.
    external_references_annotated: seq[JsonNode]
    internal_aliases: seq[JsonNode]
      ## Internal structured aliases ({ value, confidence 1-10, tlp }). CFONE-only: never
      ## returned to non-CFONE accounts.
    internal_description: string
    last_seen: string
    motive: string
    motive_annotated: JsonNode
    opsec_level: string
    opsec_level_annotated: JsonNode
    origin_country_i_s_o: string
      ## ISO country code (alpha-2 or alpha-3). Normalized to uppercase on read. Null
      ## when stored value is blank/whitespace.
    origin_country_i_s_o_annotated: JsonNode
    priority: float64
    priority_annotated: JsonNode
    properties: JsonNode
      ## Parsed custom field values. Null when the tag has no custom fields.
    sophistication_level: string
    sophistication_level_annotated: JsonNode
    tlp: string
      ## Tag-level TLP handling marking.
    updated_at: string
    uuid: string
    value: string
    version: float64
  DeleteAccountsAccountIdCloudforceOneEventsTagsTagUuidResponse* = object
    uuid: string
  PatchAccountsAccountIdCloudforceOneEventsTagsTagUuidRequest = object
    active_duration: Option[JsonNode]
    actor_category: Option[JsonNode]
    alias_group_names: Option[seq[string]]
    alias_group_names_internal: Option[seq[string]]
    aliases: Option[seq[JsonNode]]
    attribution_organization: Option[JsonNode]
    category_uuid: Option[string]
    confidence: Option[int64]
    date_of_discovery: Option[string]
    description: Option[string]
    external_reference_links: Option[seq[string]]
    external_references: Option[seq[JsonNode]]
    internal_aliases: Option[seq[JsonNode]]
    internal_description: Option[string]
    last_seen: Option[string]
    motive: Option[JsonNode]
    opsec_level: Option[JsonNode]
    origin_country_i_s_o: Option[JsonNode]
    priority: Option[JsonNode]
    properties: Option[JsonNode]
    sophistication_level: Option[JsonNode]
    tlp: Option[string]
    value: Option[string]
  PatchAccountsAccountIdCloudforceOneEventsTagsTagUuidResponse* = object
    active_duration: string
    active_duration_annotated: JsonNode
    actor_category: string
    actor_category_annotated: JsonNode
    alias_group_names: seq[string]
    alias_group_names_internal: seq[string]
    aliases: seq[JsonNode]
      ## Structured aliases ({ value, confidence 1-10, tlp }). CFONE-only: stripped from
      ## responses to non-CFONE accounts.
    attribution_organization: string
    attribution_organization_annotated: JsonNode
    category_name: string
    category_uuid: string
    confidence: int64
      ## Overall tag confidence (1-10).
    created_at: string
    date_of_discovery: string
    description: string
    external_reference_links: seq[string]
    external_references: seq[JsonNode]
      ## Structured external references ({ url, description }). Public: returned to all
      ## accounts.
    external_references_annotated: seq[JsonNode]
    internal_aliases: seq[JsonNode]
      ## Internal structured aliases ({ value, confidence 1-10, tlp }). CFONE-only: never
      ## returned to non-CFONE accounts.
    internal_description: string
    last_seen: string
    motive: string
    motive_annotated: JsonNode
    opsec_level: string
    opsec_level_annotated: JsonNode
    origin_country_i_s_o: string
      ## ISO country code (alpha-2 or alpha-3). Normalized to uppercase on read. Null
      ## when stored value is blank/whitespace.
    origin_country_i_s_o_annotated: JsonNode
    priority: float64
    priority_annotated: JsonNode
    properties: JsonNode
      ## Parsed custom field values. Null when the tag has no custom fields.
    sophistication_level: string
    sophistication_level_annotated: JsonNode
    tlp: string
      ## Tag-level TLP handling marking.
    updated_at: string
    uuid: string
    value: string
    version: float64
  GetAccountsAccountIdCloudforceOneEventsTagsTagUuidIndicatorsResponse* = object
    indicators: seq[JsonNode]
    pagination: JsonNode
  GetAccountsAccountIdCloudforceOneEventsTagsTagUuidRelationshipsResponse* = object
    result: JsonNode
    success: bool
  PostAccountsAccountIdCloudforceOneEventsTagsTagUuidRelationshipsRequest = object
    confidence: Option[int64]
    dataset_id: string
    metadata: Option[JsonNode]
    target_id: string
    target_type: string
    `type`: string
  PostAccountsAccountIdCloudforceOneEventsTagsTagUuidRelationshipsResponse* = object
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdCloudforceOneEventsTagsTagUuidRelationshipsRelUuidResponse* = object
    result: JsonNode
    success: bool
  PatchAccountsAccountIdCloudforceOneEventsTagsTagUuidRelationshipsRelUuidRequest = object
    confidence: Option[int64]
    metadata: Option[JsonNode]
    `type`: Option[string]
  PatchAccountsAccountIdCloudforceOneEventsTagsTagUuidRelationshipsRelUuidResponse* = object
    result: JsonNode
    success: bool
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
                                                  cache: TagCacheOption): Future[GetAccountsAccountIdCloudforceOneEventsTagsResponse] {.async.} =
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
  q["cache"] = $cache
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

proc getAccountsAccountIdCloudforceOneEventsTagsTagUuid*(client: CloudflareClient,
                                                         accountId: string,
                                                         tagUuid: string): Future[GetAccountsAccountIdCloudforceOneEventsTagsTagUuidResponse] {.async.} =
  ## Returns a single Source-of-Truth tag by UUID, including custom fields
  ## (properties).

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/tags/{tagUuid}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsTagsTagUuidResponse)
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

proc getAccountsAccountIdCloudforceOneEventsTagsTagUuidRelationships*(client: CloudflareClient,
                                                                      accountId: string,
                                                                      tagUuid: string,
                                                                      datasets: seq[string] = @[],
                                                                      search: seq[string] = @[],
                                                                      expand: seq[string] = @[],
                                                                      cursor: string = default(string),
                                                                      pageSize: int64 = 25): Future[GetAccountsAccountIdCloudforceOneEventsTagsTagUuidRelationshipsResponse] {.async.} =
  ## Returns sparse relationship edges. Optionally hydrate related entities via
  ## `expand`. Fans out across all accessible indicator dataset shards.

  var q = initOrderedTable[string, string]()
  for v in datasets: q["datasets"] = $v
  for v in search: q["search"] = $v
  for v in expand: q["expand"] = $v
  q["cursor"] = $cursor
  q["pageSize"] = $pageSize
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/tags/{tagUuid}/relationships", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsTagsTagUuidRelationshipsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsTagsTagUuidRelationships*(client: CloudflareClient,
                                                                       accountId: string,
                                                                       tagUuid: string,
                                                                       body: PostAccountsAccountIdCloudforceOneEventsTagsTagUuidRelationshipsRequest): Future[PostAccountsAccountIdCloudforceOneEventsTagsTagUuidRelationshipsResponse] {.async.} =
  ## Creates a new relationship with the tag as the source entity. Requires a
  ## datasetId to locate the Indicators DO.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/tags/{tagUuid}/relationships", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsTagsTagUuidRelationshipsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneEventsTagsTagUuidRelationshipsRelUuid*(client: CloudflareClient,
                                                                                accountId: string,
                                                                                tagUuid: string,
                                                                                relUuid: string,
                                                                                datasetId: string): Future[DeleteAccountsAccountIdCloudforceOneEventsTagsTagUuidRelationshipsRelUuidResponse] {.async.} =
  ## Deletes a relationship by UUID. Idempotent: returns deleted=false if not found.
  ## Requires datasetId query param.

  var q = initOrderedTable[string, string]()
  q["datasetId"] = $datasetId
  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/events/tags/{tagUuid}/relationships/{relUuid}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneEventsTagsTagUuidRelationshipsRelUuidResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdCloudforceOneEventsTagsTagUuidRelationshipsRelUuid*(client: CloudflareClient,
                                                                               accountId: string,
                                                                               tagUuid: string,
                                                                               relUuid: string,
                                                                               datasetId: string,
                                                                               body: PatchAccountsAccountIdCloudforceOneEventsTagsTagUuidRelationshipsRelUuidRequest): Future[PatchAccountsAccountIdCloudforceOneEventsTagsTagUuidRelationshipsRelUuidResponse] {.async.} =
  ## Partially updates a relationship by UUID. Requires datasetId query param.

  var q = initOrderedTable[string, string]()
  q["datasetId"] = $datasetId
  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/events/tags/{tagUuid}/relationships/{relUuid}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneEventsTagsTagUuidRelationshipsRelUuidResponse)
  else:
    raise newException(CloudflareClientError, body)
