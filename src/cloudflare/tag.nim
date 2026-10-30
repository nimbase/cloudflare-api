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
  GetAccountsAccountIdCloudforceOneEventsTagsCategoriesActorsResponse* = object
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
      ## Structured aliases ({ value, confidence 1-10, tlp }). Public: returned to all
      ## accounts with per-entry TLP filtering (entries with tlp: purple are removed for
      ## non-CFONE accounts).
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
      ## Owner-private structured aliases ({ value, confidence 1-10, tlp }). Returned to
      ## the owning account and omitted from shared-catalog non-owner responses.
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
      ## Structured aliases ({ value, confidence 1-10, tlp }). Public: returned to all
      ## accounts with per-entry TLP filtering (entries with tlp: purple are removed for
      ## non-CFONE accounts).
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
      ## Owner-private structured aliases ({ value, confidence 1-10, tlp }). Returned to
      ## the owning account and omitted from shared-catalog non-owner responses.
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
      ## Structured aliases ({ value, confidence 1-10, tlp }). Public: returned to all
      ## accounts with per-entry TLP filtering (entries with tlp: purple are removed for
      ## non-CFONE accounts).
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
      ## Owner-private structured aliases ({ value, confidence 1-10, tlp }). Returned to
      ## the owning account and omitted from shared-catalog non-owner responses.
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
                                                  cache: TagCacheOption = cacheFromGraph): Future[GetAccountsAccountIdCloudforceOneEventsTagsResponse] {.async.} =
  ## Lists the account's tags. Use `search` to match tag values, `categoryUuid` to
  ## limit results to one category, and `filters` (a JSON array) to filter by fields
  ## such as `originCountryISO`, `actorCategory`, `motive`, or `priority`. Country
  ## filters accept alpha-2 or alpha-3 codes, names, or common aliases. Tags marked
  ## TLP:PURPLE are visible only to Cloudforce One.

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

proc getAccountsAccountIdCloudforceOneEventsTagsCategoriesActors*(client: CloudflareClient,
                                                                  accountId: string,
                                                                  page: float64 = default(float64),
                                                                  pageSize: float64 = default(float64),
                                                                  value: string = default(string),
                                                                  filters: seq[string] = @[]): Future[GetAccountsAccountIdCloudforceOneEventsTagsCategoriesActorsResponse] {.async.} =
  ## Lists threat actors from the Cloudforce One actor catalog. Use `value` to match
  ## actor names and `filters` to filter by fields such as origin country. Accounts
  ## outside Cloudforce One receive only public fields: identity, description,
  ## discovery date, TLP, confidence, custom properties, origin country, public
  ## aliases, and external references. Fields such as internal aliases, attribution,
  ## motive, and OPSEC level are omitted.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["pageSize"] = $pageSize
  q["value"] = $value
  for v in filters: q["filters"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/tags/categories/actors", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsTagsCategoriesActorsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsTagsCreate*(client: CloudflareClient,
                                                         accountId: string,
                                                         body: PostAccountsAccountIdCloudforceOneEventsTagsCreateRequest): Future[PostAccountsAccountIdCloudforceOneEventsTagsCreateResponse] {.async.} =
  ## Creates a tag in the account and returns the complete tag.

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
  ## Returns a tag by its UUID, including its custom fields (`properties`). Tags
  ## marked TLP:PURPLE are visible only to Cloudforce One.

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
  ## Deletes a tag by its UUID.

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
  ## Updates the given fields of a tag and returns the complete tag.

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
  ## Lists the indicators that carry a tag, with pagination. By default, every
  ## intelligence dataset you can read is searched; use `datasetIds` to limit the
  ## search to specific datasets or a scope value. Analytics datasets don't store tag
  ## associations, so the `analytics` scope returns no results.

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
  ## Lists the relationships that start at a tag, across the intelligence datasets
  ## you can read. Use `datasets` to limit the datasets (`all` and `operational` are
  ## equivalent here) and `expand` to include the related entities. Analytics
  ## datasets don't store tag associations, so the `analytics` scope returns no
  ## results.

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
  ## Creates a relationship from a tag to an event or indicator (`targetType`) in the
  ## dataset given by `datasetId`. Relationships between two tags are not supported.

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
  ## Deletes a tag relationship by its UUID. `datasetId` is required. Returns
  ## `deleted: false` if the relationship doesn't exist.

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
  ## Updates the given fields of a tag relationship and leaves the other fields
  ## unchanged. `datasetId` is required.

  var q = initOrderedTable[string, string]()
  q["datasetId"] = $datasetId
  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/events/tags/{tagUuid}/relationships/{relUuid}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneEventsTagsTagUuidRelationshipsRelUuidResponse)
  else:
    raise newException(CloudflareClientError, body)
