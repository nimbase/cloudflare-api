# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdCloudforceOneEventsAggregateResponse* = object
    aggregate_by: string
      ## Column(s) that were aggregated by
    aggregations: seq[JsonNode]
      ## Array of aggregation results with dynamic fields based on aggregateBy columns
    date_range: JsonNode
      ## Date range used for filtering
    total: float64
      ## Total number of events in the aggregation
  PostAccountsAccountIdCloudforceOneEventsCreateRequest = object
    account_id: Option[float64]
    attacker: Option[string]
    attacker_country: Option[string]
    category: string
    dataset_id: Option[string]
    date: string
    event: string
    indicator: Option[string]
    indicator_type: Option[string]
    indicators: Option[seq[JsonNode]]
    insight: Option[string]
    raw: JsonNode
    tags: Option[seq[string]]
    target_country: Option[string]
    target_industry: Option[string]
    tlp: string
  PostAccountsAccountIdCloudforceOneEventsCreateResponse* = object
    attacker: string
    attacker_country: string
    attacker_country_alpha3: string
    category: string
    dataset_id: string
    date: string
    event: string
    has_children: bool
    indicator: string
    indicator_type: string
    indicator_type_id: float64
    insight: string
    kill_chain: float64
    mitre_attack: seq[string]
    mitre_capec: seq[string]
    num_referenced: float64
    num_references: float64
    raw_id: string
    referenced: seq[string]
    referenced_ids: seq[float64]
    references: seq[string]
    references_ids: seq[float64]
    releasability_id: string
    tags: seq[string]
    target_country: string
    target_country_alpha3: string
    target_industry: string
    tlp: string
    uuid: string
  PostAccountsAccountIdCloudforceOneEventsCreateBulkRequest = object
    data: seq[JsonNode]
    dataset_id: string
    include_created_events: Option[bool]
  PostAccountsAccountIdCloudforceOneEventsCreateBulkResponse* = object
    ## Detailed result of bulk event creation with auto-tag management
    create_bulk_events_request_id: string
      ## Correlation ID for async indicator processing
    created_events: seq[JsonNode]
      ## Array of created events with UUIDs and shard locations. Only present when
      ## includeCreatedEvents=true
    created_events_count: float64
      ## Number of events created
    created_tags_count: float64
      ## Number of new tags created in SoT
    error_count: float64
      ## Number of errors encountered
    errors: seq[JsonNode]
      ## Array of error details
    queued_indicators_count: float64
      ## Number of indicators queued for async processing
  PostAccountsAccountIdCloudforceOneEventsCreateBulkRelationshipsRequest = object
    data: seq[JsonNode]
    dataset_id: string
  PostAccountsAccountIdCloudforceOneEventsCreateBulkRelationshipsResponse* = object
    ## Result of bulk relationship creation operation
    created_events_count: float64
      ## Number of events created
    created_indicators_count: float64
      ## Number of indicators created
    created_relationships_count: float64
      ## Number of relationships created
    error_count: float64
      ## Number of errors encountered
    errors: seq[JsonNode]
      ## Array of error details
  PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdCopyRequest = object
    dest_dataset_id: string
    event_ids: seq[string]
  PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdCopyResponse* = object
    copied: float64
      ## Number of events successfully copied
    indicators_copied: float64
      ## Number of indicators successfully copied
    insert_failures: seq[JsonNode]
      ## Array of events that failed to insert into destination
    relationships_copied: float64
      ## Number of relationships successfully copied
  GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdEventsEventIdResponse* = object
    attacker: string
    attacker_country: string
    attacker_country_alpha3: string
    category: string
    dataset_id: string
    date: string
    event: string
    has_children: bool
    indicator: string
    indicator_type: string
    indicator_type_id: float64
    insight: string
    kill_chain: float64
    mitre_attack: seq[string]
    mitre_capec: seq[string]
    num_referenced: float64
    num_references: float64
    raw_id: string
    referenced: seq[string]
    referenced_ids: seq[float64]
    references: seq[string]
    references_ids: seq[float64]
    releasability_id: string
    tags: seq[string]
    target_country: string
    target_country_alpha3: string
    target_industry: string
    tlp: string
    uuid: string
  PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdMoveRequest = object
    dest_dataset_id: string
    event_ids: seq[string]
  PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdMoveResponse* = object
    deletion_failures: seq[JsonNode]
      ## Array of source datasets where deletion failed
    indicators_copied: float64
      ## Number of indicators successfully copied
    insert_failures: seq[JsonNode]
      ## Array of events that failed to insert into destination
    moved: float64
      ## Number of events successfully moved
    relationships_copied: float64
      ## Number of relationships successfully copied
  DeleteAccountsAccountIdCloudforceOneEventsEventTagEventIdRequest = object
    tags: seq[string]
  DeleteAccountsAccountIdCloudforceOneEventsEventTagEventIdResponse* = object
    result: JsonNode
    success: bool
  PostAccountsAccountIdCloudforceOneEventsEventTagEventIdCreateRequest = object
    tags: seq[string]
  PostAccountsAccountIdCloudforceOneEventsEventTagEventIdCreateResponse* = object
    result: JsonNode
    success: bool
  PostAccountsAccountIdCloudforceOneEventsGraphqlResponse* = object
    data: JsonNode
    errors: seq[JsonNode]
  PostAccountsAccountIdCloudforceOneEventsQueriesCreateRequest = object
    alert_enabled: bool
    alert_rollup_enabled: bool
    name: string
    query_json: string
    rule_enabled: bool
    rule_scope: Option[string]
  PostAccountsAccountIdCloudforceOneEventsQueriesCreateResponse* = object
    account_id: int64
      ## Account ID
    alert_enabled: bool
      ## Whether alerts are enabled
    alert_rollup_enabled: bool
      ## Whether alert rollup is enabled
    created_at: string
      ## Creation timestamp
    custom_threat_feed_id: int64
      ## Intel Indicator Feed ID (numeric)
    id: int64
      ## Unique identifier for the saved query
    name: string
      ## Name of the saved query
    query_json: string
      ## JSON string containing the query parameters
    rule_enabled: bool
      ## Whether rule is enabled
    rule_list_id: string
      ## WAF rules list ID for blocking
    rule_scope: string
      ## Scope for the rule
    updated_at: string
      ## Last update timestamp
    user_email: string
      ## Email of the user who created the query
  GetAccountsAccountIdCloudforceOneEventsQueriesQueryIdResponse* = object
    account_id: int64
      ## Account ID
    alert_enabled: bool
      ## Whether alerts are enabled
    alert_rollup_enabled: bool
      ## Whether alert rollup is enabled
    created_at: string
      ## Creation timestamp
    custom_threat_feed_id: int64
      ## Intel Indicator Feed ID (numeric)
    id: int64
      ## Unique identifier for the saved query
    name: string
      ## Name of the saved query
    query_json: string
      ## JSON string containing the query parameters
    rule_enabled: bool
      ## Whether rule is enabled
    rule_list_id: string
      ## WAF rules list ID for blocking
    rule_scope: string
      ## Scope for the rule
    updated_at: string
      ## Last update timestamp
    user_email: string
      ## Email of the user who created the query
  PostAccountsAccountIdCloudforceOneEventsQueriesQueryIdRequest = object
    alert_enabled: Option[bool]
    alert_rollup_enabled: Option[bool]
    name: Option[string]
    query_json: Option[string]
    rule_enabled: Option[bool]
    rule_scope: Option[string]
  PostAccountsAccountIdCloudforceOneEventsQueriesQueryIdResponse* = object
    account_id: int64
      ## Account ID
    alert_enabled: bool
      ## Whether alerts are enabled
    alert_rollup_enabled: bool
      ## Whether alert rollup is enabled
    created_at: string
      ## Creation timestamp
    custom_threat_feed_id: int64
      ## Intel Indicator Feed ID (numeric)
    id: int64
      ## Unique identifier for the saved query
    name: string
      ## Name of the saved query
    query_json: string
      ## JSON string containing the query parameters
    rule_enabled: bool
      ## Whether rule is enabled
    rule_list_id: string
      ## WAF rules list ID for blocking
    rule_scope: string
      ## Scope for the rule
    updated_at: string
      ## Last update timestamp
    user_email: string
      ## Email of the user who created the query
  PatchAccountsAccountIdCloudforceOneEventsQueriesQueryIdRequest = object
    alert_enabled: Option[bool]
    alert_rollup_enabled: Option[bool]
    name: Option[string]
    query_json: Option[string]
    rule_enabled: Option[bool]
    rule_scope: Option[string]
  PatchAccountsAccountIdCloudforceOneEventsQueriesQueryIdResponse* = object
    account_id: int64
      ## Account ID
    alert_enabled: bool
      ## Whether alerts are enabled
    alert_rollup_enabled: bool
      ## Whether alert rollup is enabled
    created_at: string
      ## Creation timestamp
    custom_threat_feed_id: int64
      ## Intel Indicator Feed ID (numeric)
    id: int64
      ## Unique identifier for the saved query
    name: string
      ## Name of the saved query
    query_json: string
      ## JSON string containing the query parameters
    rule_enabled: bool
      ## Whether rule is enabled
    rule_list_id: string
      ## WAF rules list ID for blocking
    rule_scope: string
      ## Scope for the rule
    updated_at: string
      ## Last update timestamp
    user_email: string
      ## Email of the user who created the query
  GetAccountsAccountIdCloudforceOneEventsRawDatasetIdEventIdResponse* = object
    account_id: float64
    created: string
    data: string
    id: float64
    source: string
    tlp: string
  DeleteAccountsAccountIdCloudforceOneEventsRelateEventIdRequest = object
    events: seq[string]
  DeleteAccountsAccountIdCloudforceOneEventsRelateEventIdResponse* = object
    result: JsonNode
    success: bool
  PostAccountsAccountIdCloudforceOneEventsRelateEventIdCreateRequest = object
    events: seq[string]
  PostAccountsAccountIdCloudforceOneEventsRelateEventIdCreateResponse* = object
    result: JsonNode
    success: bool
  PostAccountsAccountIdCloudforceOneEventsRelationshipsCreateRequest = object
    child_ids: seq[string]
    dataset_id: string
    parent_id: string
    relationship_type: string
  PostAccountsAccountIdCloudforceOneEventsRelationshipsCreateResponse* = object
    child_ids: seq[string]
      ## Array of child event UUIDs that were processed
    errors: seq[JsonNode]
      ## Array of errors for relationships that failed to be created (only present if
      ## some relationships failed)
    message: string
      ## Human-readable message describing the operation result
    relationships: seq[JsonNode]
      ## Array of successfully created relationship objects
    relationships_created: float64
      ## Number of relationships that were successfully created
    success: bool
      ## Whether the relationship creation operation completed successfully
  PatchAccountsAccountIdCloudforceOneEventsUpdateBulkRequest = object
    dataset_id: string
    event_ids: seq[string]
    updates: JsonNode
  PatchAccountsAccountIdCloudforceOneEventsUpdateBulkResponse* = object
    failed_count: float64
    failures: seq[JsonNode]
      ## List of events that failed to update with error messages
    updated_count: float64
  GetAccountsAccountIdCloudforceOneEventsEventIdResponse* = object
    attacker: string
    attacker_country: string
    attacker_country_alpha3: string
    category: string
    dataset_id: string
    date: string
    event: string
    has_children: bool
    indicator: string
    indicator_type: string
    indicator_type_id: float64
    insight: string
    kill_chain: float64
    mitre_attack: seq[string]
    mitre_capec: seq[string]
    num_referenced: float64
    num_references: float64
    raw_id: string
    referenced: seq[string]
    referenced_ids: seq[float64]
    references: seq[string]
    references_ids: seq[float64]
    releasability_id: string
    tags: seq[string]
    target_country: string
    target_country_alpha3: string
    target_industry: string
    tlp: string
    uuid: string
  PostAccountsAccountIdCloudforceOneEventsEventIdRequest = object
    attacker: Option[string]
    attacker_country: Option[string]
    category: Option[string]
    created_at: Option[string]
    dataset_id: string
    date: Option[string]
    event: Option[string]
    indicator: Option[string]
    indicator_type: Option[string]
    insight: Option[string]
    raw: Option[JsonNode]
    target_country: Option[string]
    target_industry: Option[string]
    tlp: Option[string]
  PostAccountsAccountIdCloudforceOneEventsEventIdResponse* = object
    attacker: string
    attacker_country: string
    attacker_country_alpha3: string
    category: string
    dataset_id: string
    date: string
    event: string
    has_children: bool
    indicator: string
    indicator_type: string
    indicator_type_id: float64
    insight: string
    kill_chain: float64
    mitre_attack: seq[string]
    mitre_capec: seq[string]
    num_referenced: float64
    num_references: float64
    raw_id: string
    referenced: seq[string]
    referenced_ids: seq[float64]
    references: seq[string]
    references_ids: seq[float64]
    releasability_id: string
    tags: seq[string]
    target_country: string
    target_country_alpha3: string
    target_industry: string
    tlp: string
    uuid: string
  PatchAccountsAccountIdCloudforceOneEventsEventIdRequest = object
    attacker: Option[string]
    attacker_country: Option[string]
    category: Option[string]
    created_at: Option[string]
    dataset_id: string
    date: Option[string]
    event: Option[string]
    indicator: Option[string]
    indicator_type: Option[string]
    insight: Option[string]
    raw: Option[JsonNode]
    target_country: Option[string]
    target_industry: Option[string]
    tlp: Option[string]
  PatchAccountsAccountIdCloudforceOneEventsEventIdResponse* = object
    attacker: string
    attacker_country: string
    attacker_country_alpha3: string
    category: string
    dataset_id: string
    date: string
    event: string
    has_children: bool
    indicator: string
    indicator_type: string
    indicator_type_id: float64
    insight: string
    kill_chain: float64
    mitre_attack: seq[string]
    mitre_capec: seq[string]
    num_referenced: float64
    num_references: float64
    raw_id: string
    referenced: seq[string]
    referenced_ids: seq[float64]
    references: seq[string]
    references_ids: seq[float64]
    releasability_id: string
    tags: seq[string]
    target_country: string
    target_country_alpha3: string
    target_industry: string
    tlp: string
    uuid: string
  GetAccountsAccountIdCloudforceOneEventsEventIdRawRawIdResponse* = object
    account_id: float64
    created: string
    data: JsonNode
    id: string
    source: string
    tlp: string
  PostAccountsAccountIdCloudforceOneEventsEventIdRawRawIdRequest = object
    data: Option[JsonNode]
    source: Option[string]
    tlp: Option[string]
  PostAccountsAccountIdCloudforceOneEventsEventIdRawRawIdResponse* = object
    data: JsonNode
    id: string
  PatchAccountsAccountIdCloudforceOneEventsEventIdRawRawIdRequest = object
    data: Option[JsonNode]
    source: Option[string]
    tlp: Option[string]
  PatchAccountsAccountIdCloudforceOneEventsEventIdRawRawIdResponse* = object
    data: JsonNode
    id: string
  PostAccountsAccountIdCloudforceOneV2EventsGraphqlResponse* = object
    data: JsonNode
    errors: seq[JsonNode]
  EventOrderOption* = enum
    orderAsc = "asc"
    orderDesc = "desc"

  EventFormatOption* = enum
    formatJson = "json"
    formatStix2 = "stix2"
    formatTaxii = "taxii"

  EventCacheOption* = enum
    cacheFromGraph = "from-graph"

  EventDirectionOption* = enum
    directionAncestors = "ancestors"
    directionDescendants = "descendants"
    directionBoth = "both"


proc getAccountsAccountIdCloudforceOneEvents*(client: CloudflareClient,
                                              accountId: string,
                                              cursor: string = default(string),
                                              search: seq[string] = @[],
                                              page: float64 = default(float64),
                                              pageSize: float64 = default(float64),
                                              orderBy: string = default(string),
                                              order: set[EventOrderOption] = {},
                                              datasetId: seq[string] = @[],
                                              forceRefresh: bool = default(bool),
                                              format: set[EventFormatOption] = {},
                                              cache: set[EventCacheOption] = {}): Future[seq[JsonNode]] {.async.} =
  ## Use `datasetId=all` or `datasetId=*` to query all event datasets for the account
  ## (limited to 50). When `datasetId` is unspecified, events are listed from the
  ## default Cloudforce One Threat Events dataset. To list existing datasets, use the
  ## [`ListDatasets`](https://developers.cloudflare.com/api/resources/cloudforce_one
  ## /subresources/threat_events/subresources/datasets/methods/list/) endpoint.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  for v in search: q["search"] = $v
  q["page"] = $page
  q["pageSize"] = $pageSize
  q["orderBy"] = $orderBy
  for v in order: q["order"] = $v
  for v in datasetId: q["datasetId"] = $v
  q["forceRefresh"] = $forceRefresh
  for v in format: q["format"] = $v
  for v in cache: q["cache"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[JsonNode])
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsAggregate*(client: CloudflareClient,
                                                       accountId: string,
                                                       aggregateBy: string,
                                                       datasetId: seq[string] = @[],
                                                       startDate: string = default(string),
                                                       endDate: string = default(string),
                                                       groupByDate: bool = default(bool),
                                                       limit: float64 = default(float64)): Future[GetAccountsAccountIdCloudforceOneEventsAggregateResponse] {.async.} =
  ## Aggregate threat events by one or more columns (e.g., attacker, targetIndustry)
  ## with optional date filtering and daily grouping. Supports multi-dimensional
  ## aggregation for cross-analysis.

  var q = initOrderedTable[string, string]()
  q["aggregateBy"] = $aggregateBy
  for v in datasetId: q["datasetId"] = $v
  q["startDate"] = $startDate
  q["endDate"] = $endDate
  q["groupByDate"] = $groupByDate
  q["limit"] = $limit
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/aggregate", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsAggregateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsCreate*(client: CloudflareClient,
                                                     accountId: string,
                                                     body: PostAccountsAccountIdCloudforceOneEventsCreateRequest): Future[PostAccountsAccountIdCloudforceOneEventsCreateResponse] {.async.} =
  ## To create a dataset, see the [`CreateDataset`](https://developers.cloudflare.co
  ## m/api/resources/cloudforce_one/subresources/threat_events/subresources/datasets/
  ## methods/create/) endpoint. When `datasetId` parameter is unspecified, it will be
  ## created in a default dataset named `Cloudforce One Threat Events`.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/create", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsCreateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsCreateBulk*(client: CloudflareClient,
                                                         accountId: string,
                                                         body: PostAccountsAccountIdCloudforceOneEventsCreateBulkRequest): Future[PostAccountsAccountIdCloudforceOneEventsCreateBulkResponse] {.async.} =
  ## The `datasetId` parameter must be defined. To list existing datasets (and their
  ## IDs) in your account, use the [`ListDatasets`](https://developers.cloudflare.co
  ## m/api/resources/cloudforce_one/subresources/threat_events/subresources/datasets/
  ## methods/list/) endpoint.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/create/bulk", body)
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsCreateBulkResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsCreateBulkRelationships*(client: CloudflareClient,
                                                                      accountId: string,
                                                                      body: PostAccountsAccountIdCloudforceOneEventsCreateBulkRelationshipsRequest): Future[PostAccountsAccountIdCloudforceOneEventsCreateBulkRelationshipsResponse] {.async.} =
  ## This method is deprecated. Please use `event_create_bulk` instead

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/create/bulk/relationships", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsCreateBulkRelationshipsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsDatasetDatasetIdCopy*(client: CloudflareClient,
                                                                   accountId: string,
                                                                   datasetId: string,
                                                                   keepRawData: bool = default(bool),
                                                                   body: PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdCopyRequest): Future[PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdCopyResponse] {.async.} =
  ## Copies specified events from one dataset to another dataset

  var q = initOrderedTable[string, string]()
  q["keepRawData"] = $keepRawData
  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}/copy", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdCopyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsDatasetDatasetIdEventsEventId*(client: CloudflareClient,
                                                                           accountId: string,
                                                                           datasetId: string,
                                                                           eventId: string): Future[GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdEventsEventIdResponse] {.async.} =
  ## Retrieves a specific event by its UUID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}/events/{eventId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdEventsEventIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsDatasetDatasetIdMove*(client: CloudflareClient,
                                                                   accountId: string,
                                                                   datasetId: string,
                                                                   keepRawData: bool = default(bool),
                                                                   body: PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdMoveRequest): Future[PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdMoveResponse] {.async.} =
  ## Moves specified events from one dataset to another dataset

  var q = initOrderedTable[string, string]()
  q["keepRawData"] = $keepRawData
  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}/move", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdMoveResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneEventsEventTagEventId*(client: CloudflareClient,
                                                                accountId: string,
                                                                eventId: string,
                                                                body: DeleteAccountsAccountIdCloudforceOneEventsEventTagEventIdRequest): Future[DeleteAccountsAccountIdCloudforceOneEventsEventTagEventIdResponse] {.async.} =
  ## Removes a tag from a threat event in Cloudforce One.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/events/event_tag/{eventId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneEventsEventTagEventIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsEventTagEventIdCreate*(client: CloudflareClient,
                                                                    accountId: string,
                                                                    eventId: string,
                                                                    body: PostAccountsAccountIdCloudforceOneEventsEventTagEventIdCreateRequest): Future[PostAccountsAccountIdCloudforceOneEventsEventTagEventIdCreateResponse] {.async.} =
  ## Adds a tag to a threat event in Cloudforce One for classification and filtering.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/event_tag/{eventId}/create", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsEventTagEventIdCreateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsGraphql*(client: CloudflareClient,
                                                      accountId: string): Future[PostAccountsAccountIdCloudforceOneEventsGraphqlResponse] {.async.} =
  ## Execute GraphQL aggregations over threat events. Supports multi-dimensional
  ## group-bys, optional date range filtering, and multi-dataset aggregation.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/graphql")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsGraphqlResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsQueries*(client: CloudflareClient,
                                                     accountId: string): Future[seq[JsonNode]] {.async.} =
  ## Retrieve all saved event queries for the account

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/queries")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[JsonNode])
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsQueriesCreate*(client: CloudflareClient,
                                                            accountId: string,
                                                            body: PostAccountsAccountIdCloudforceOneEventsQueriesCreateRequest): Future[PostAccountsAccountIdCloudforceOneEventsQueriesCreateResponse] {.async.} =
  ## Create a new saved event query for the account

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/queries/create", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsQueriesCreateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsQueriesQueryId*(client: CloudflareClient,
                                                            accountId: string,
                                                            queryId: int64): Future[GetAccountsAccountIdCloudforceOneEventsQueriesQueryIdResponse] {.async.} =
  ## Retrieve a saved event query by its ID

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/queries/{queryId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsQueriesQueryIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsQueriesQueryId*(client: CloudflareClient,
                                                             accountId: string,
                                                             queryId: int64,
                                                             body: PostAccountsAccountIdCloudforceOneEventsQueriesQueryIdRequest): Future[PostAccountsAccountIdCloudforceOneEventsQueriesQueryIdResponse] {.async.} =
  ## Update an existing saved event query by its ID

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/queries/{queryId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsQueriesQueryIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneEventsQueriesQueryId*(client: CloudflareClient,
                                                               accountId: string,
                                                               queryId: int64): Future[AsyncResponse] {.async.} =
  ## Delete a saved event query by its ID

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/events/queries/{queryId}")
  return res

proc patchAccountsAccountIdCloudforceOneEventsQueriesQueryId*(client: CloudflareClient,
                                                              accountId: string,
                                                              queryId: int64,
                                                              body: PatchAccountsAccountIdCloudforceOneEventsQueriesQueryIdRequest): Future[PatchAccountsAccountIdCloudforceOneEventsQueriesQueryIdResponse] {.async.} =
  ## Update an existing saved event query by its ID

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/events/queries/{queryId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneEventsQueriesQueryIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsRawDatasetIdEventId*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 eventId: string,
                                                                 datasetId: string): Future[GetAccountsAccountIdCloudforceOneEventsRawDatasetIdEventIdResponse] {.async.} =
  ## Retrieves the raw data associated with an event. Searches across all shards in
  ## the dataset.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/raw/{datasetId}/{eventId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsRawDatasetIdEventIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneEventsRelateEventId*(client: CloudflareClient,
                                                              accountId: string,
                                                              eventId: string,
                                                              body: DeleteAccountsAccountIdCloudforceOneEventsRelateEventIdRequest): Future[DeleteAccountsAccountIdCloudforceOneEventsRelateEventIdResponse] {.async.} =
  ## Removes a reference link between related threat events in Cloudforce One.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/events/relate/{eventId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneEventsRelateEventIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsRelateEventIdCreate*(client: CloudflareClient,
                                                                  accountId: string,
                                                                  eventId: string,
                                                                  body: PostAccountsAccountIdCloudforceOneEventsRelateEventIdCreateRequest): Future[PostAccountsAccountIdCloudforceOneEventsRelateEventIdCreateResponse] {.async.} =
  ## Creates event references for a event

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/relate/{eventId}/create", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsRelateEventIdCreateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsRelationshipsCreate*(client: CloudflareClient,
                                                                  accountId: string,
                                                                  body: PostAccountsAccountIdCloudforceOneEventsRelationshipsCreateRequest): Future[PostAccountsAccountIdCloudforceOneEventsRelationshipsCreateResponse] {.async.} =
  ## Creates a directed relationship between two events. The relationship is from
  ## parent to child with a specified type.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/relationships/create", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsRelationshipsCreateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdCloudforceOneEventsUpdateBulk*(client: CloudflareClient,
                                                          accountId: string,
                                                          body: PatchAccountsAccountIdCloudforceOneEventsUpdateBulkRequest): Future[PatchAccountsAccountIdCloudforceOneEventsUpdateBulkResponse] {.async.} =
  ## Updates multiple events with the same field values. Maximum 100 events per
  ## request.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/events/update/bulk", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneEventsUpdateBulkResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneEventsDatasetIdDelete*(client: CloudflareClient,
                                                                accountId: string,
                                                                datasetId: string,
                                                                eventIds: seq[string] = @[]): Future[float64] {.async.} =
  ## Deletes one or more events

  var q = initOrderedTable[string, string]()
  for v in eventIds: q["eventIds"] = $v
  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/events/{datasetId}/delete", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, float64)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsEventId*(client: CloudflareClient,
                                                     accountId: string,
                                                     eventId: string): Future[GetAccountsAccountIdCloudforceOneEventsEventIdResponse] {.async.} =
  ## This Method is deprecated. Please use
  ## /events/dataset/:dataset_id/events/:event_id instead.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/{eventId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsEventIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsEventId*(client: CloudflareClient,
                                                      accountId: string,
                                                      eventId: string,
                                                      body: PostAccountsAccountIdCloudforceOneEventsEventIdRequest): Future[PostAccountsAccountIdCloudforceOneEventsEventIdResponse] {.async.} =
  ## Updates an event

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/{eventId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsEventIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdCloudforceOneEventsEventId*(client: CloudflareClient,
                                                       accountId: string,
                                                       eventId: string,
                                                       body: PatchAccountsAccountIdCloudforceOneEventsEventIdRequest): Future[PatchAccountsAccountIdCloudforceOneEventsEventIdResponse] {.async.} =
  ## Partially updates a threat event in Cloudforce One, modifying specific fields
  ## without replacing the entire event.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/events/{eventId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneEventsEventIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsEventIdRawRawId*(client: CloudflareClient,
                                                             accountId: string,
                                                             eventId: string,
                                                             rawId: string): Future[GetAccountsAccountIdCloudforceOneEventsEventIdRawRawIdResponse] {.async.} =
  ## Retrieves raw threat event data for a specific event in Cloudforce One.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/{eventId}/raw/{rawId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsEventIdRawRawIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsEventIdRawRawId*(client: CloudflareClient,
                                                              accountId: string,
                                                              eventId: string,
                                                              rawId: string,
                                                              body: PostAccountsAccountIdCloudforceOneEventsEventIdRawRawIdRequest): Future[PostAccountsAccountIdCloudforceOneEventsEventIdRawRawIdResponse] {.async.} =
  ## Updates a raw event

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/{eventId}/raw/{rawId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsEventIdRawRawIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdCloudforceOneEventsEventIdRawRawId*(client: CloudflareClient,
                                                               accountId: string,
                                                               eventId: string,
                                                               rawId: string,
                                                               body: PatchAccountsAccountIdCloudforceOneEventsEventIdRawRawIdRequest): Future[PatchAccountsAccountIdCloudforceOneEventsEventIdRawRawIdResponse] {.async.} =
  ## Partially updates raw threat event data in Cloudforce One, modifying specific
  ## fields of the event.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/events/{eventId}/raw/{rawId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneEventsEventIdRawRawIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsEventIdRelationships*(client: CloudflareClient,
                                                                  accountId: string,
                                                                  eventId: string,
                                                                  direction: string = "both",
                                                                  maxDepth: float64 = default(float64),
                                                                  relationshipTypes: JsonNode = default(JsonNode),
                                                                  indicatorTypeIds: seq[string] = @[],
                                                                  datasetId: string,
                                                                  includeParent: bool = true,
                                                                  page: float64 = default(float64),
                                                                  pageSize: float64 = default(float64)): Future[seq[JsonNode]] {.async.} =
  ## The `event_id` must be defined (to list existing events (and their IDs), use the
  ## [`Filter and ListEvents`](https://developers.cloudflare.com/api/resources/cloud
  ## force_one/subresources/threat_events/methods/list/) endpoint). Also, must
  ## provide query parameters.

  var q = initOrderedTable[string, string]()
  for v in direction: q["direction"] = $v
  q["maxDepth"] = $maxDepth
  q["relationshipTypes"] = $relationshipTypes
  for v in indicatorTypeIds: q["indicatorTypeIds"] = $v
  q["datasetId"] = $datasetId
  q["includeParent"] = $includeParent
  q["page"] = $page
  q["pageSize"] = $pageSize
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/{eventId}/relationships", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[JsonNode])
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneV2EventsGraphql*(client: CloudflareClient,
                                                        accountId: string): Future[PostAccountsAccountIdCloudforceOneV2EventsGraphqlResponse] {.async.} =
  ## Execute GraphQL aggregations over threat events. Supports multi-dimensional
  ## group-bys, optional date range filtering, and multi-dataset aggregation.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/events/graphql")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneV2EventsGraphqlResponse)
  else:
    raise newException(CloudflareClientError, body)
