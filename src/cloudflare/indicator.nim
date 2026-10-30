# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsResponse* = object
    indicators: seq[JsonNode]
    pagination: JsonNode
  DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsResponse* = object
    deleted_count: int64
      ## Number of indicators deleted.
    missing_u_u_i_ds: seq[string]
      ## Requested UUIDs that were not found in the dataset. Omitted when every UUID was
      ## deleted.
  PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsBulkRequest = object
    auto_create_type: Option[bool]
    indicators: seq[JsonNode]
  PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsCreateRequest = object
    auto_create_type: Option[bool]
    indicator_type: string
    related_events: Option[seq[JsonNode]]
    tags: Option[seq[JsonNode]]
    tlp: Option[string]
    value: string
  PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsCreateResponse* = object
    created_at: string
    dataset_id: string
      ## The dataset ID this indicator belongs to. Included in list responses.
    indicator_type: string
    related_events: seq[JsonNode]
      ## Related events, capped by `relatedEventsLimit` (default 2). Check
      ## `relatedEventsHasMore` to detect a capped list; pass `relatedEventsLimit=-1` to
      ## retrieve all of them.
    related_events_has_more: bool
      ## True when this indicator appears in more events than `relatedEvents` contains
      ## because `relatedEventsLimit` capped the list. Pass `relatedEventsLimit=-1` to
      ## retrieve every related event.
    tags: seq[JsonNode]
    tlp: string
      ## Traffic Light Protocol designation. UPPERCASE. Possible values: CLEAR, GREEN,
      ## AMBER, AMBER-STRICT, RED, PURPLE. Null when not set.
    updated_at: string
    uuid: string
    value: string
  GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdResponse* = object
    created_at: string
    dataset_id: string
      ## The dataset ID this indicator belongs to. Included in list responses.
    indicator_type: string
    related_events: seq[JsonNode]
      ## Related events, capped by `relatedEventsLimit` (default 2). Check
      ## `relatedEventsHasMore` to detect a capped list; pass `relatedEventsLimit=-1` to
      ## retrieve all of them.
    related_events_has_more: bool
      ## True when this indicator appears in more events than `relatedEvents` contains
      ## because `relatedEventsLimit` capped the list. Pass `relatedEventsLimit=-1` to
      ## retrieve every related event.
    tags: seq[JsonNode]
    tlp: string
      ## Traffic Light Protocol designation. UPPERCASE. Possible values: CLEAR, GREEN,
      ## AMBER, AMBER-STRICT, RED, PURPLE. Null when not set.
    updated_at: string
    uuid: string
    value: string
  DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdResponse* = object
    message: string
    success: bool
  PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRequest = object
    indicator_type: Option[string]
    related_events: Option[seq[JsonNode]]
    tags: Option[seq[JsonNode]]
    tlp: Option[string]
    value: Option[string]
  PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdResponse* = object
    created_at: string
    dataset_id: string
      ## The dataset ID this indicator belongs to. Included in list responses.
    indicator_type: string
    related_events: seq[JsonNode]
      ## Related events, capped by `relatedEventsLimit` (default 2). Check
      ## `relatedEventsHasMore` to detect a capped list; pass `relatedEventsLimit=-1` to
      ## retrieve all of them.
    related_events_has_more: bool
      ## True when this indicator appears in more events than `relatedEvents` contains
      ## because `relatedEventsLimit` capped the list. Pass `relatedEventsLimit=-1` to
      ## retrieve every related event.
    tags: seq[JsonNode]
    tlp: string
      ## Traffic Light Protocol designation. UPPERCASE. Possible values: CLEAR, GREEN,
      ## AMBER, AMBER-STRICT, RED, PURPLE. Null when not set.
    updated_at: string
    uuid: string
    value: string
  GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsResponse* = object
    result: JsonNode
    success: bool
  PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsRequest = object
    confidence: Option[int64]
    metadata: Option[JsonNode]
    target_id: string
    target_type: string
    `type`: string
  PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsResponse* = object
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsRelUuidResponse* = object
    result: JsonNode
    success: bool
  PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsRelUuidRequest = object
    confidence: Option[int64]
    metadata: Option[JsonNode]
    `type`: Option[string]
  PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsRelUuidResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdCloudforceOneEventsIndicatorsResponse* = object
    properties: JsonNode
    `type`: string
  GetAccountsAccountIdCloudforceOneEventsIndicatorsAggregateResponse* = object
    aggregate_by: string
      ## Column(s) that were aggregated by
    aggregations: seq[JsonNode]
      ## Array of aggregation results with dynamic fields based on aggregateBy columns
    failed_datasets: float64
      ## Number of datasets whose aggregation failed and were excluded from the result
    total: float64
      ## Total count in the aggregation: indicator rows when measure=indicators, or
      ## linked-event rows when measure=relationships
  IndicatorFormatOption* = enum
    formatJson = "json"
    formatStix2 = "stix2"
    formatTaxii = "taxii"

  IndicatorCacheOption* = enum
    cacheFromGraph = "from-graph"

  IndicatorMeasureOption* = enum
    measureIndicators = "indicators"
    measureRelationships = "relationships"


proc getAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicators*(client: CloudflareClient,
                                                                        accountId: string,
                                                                        datasetId: string,
                                                                        page: float64 = default(float64),
                                                                        pageSize: float64 = default(float64),
                                                                        name: string = default(string),
                                                                        indicatorType: string = default(string),
                                                                        relatedEvent: seq[string] = @[]): Future[GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsResponse] {.async.} =
  ## Legacy. Use `threat-intel indicators list` (`GET /events/indicators`) instead.
  ## It supports multiple datasets and cursor pagination.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["pageSize"] = $pageSize
  q["name"] = $name
  q["indicatorType"] = $indicatorType
  for v in relatedEvent: q["relatedEvent"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}/indicators", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicators*(client: CloudflareClient,
                                                                           accountId: string,
                                                                           datasetId: string,
                                                                           indicatorIds: seq[string] = @[]): Future[DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsResponse] {.async.} =
  ## Deletes up to 200 indicators from a dataset. Pass the indicator UUIDs in
  ## `indicatorIds`; UUIDs that are not found are returned in `missingUUIDs`.

  var q = initOrderedTable[string, string]()
  for v in indicatorIds: q["indicatorIds"] = $v
  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}/indicators", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsBulk*(client: CloudflareClient,
                                                                             accountId: string,
                                                                             datasetId: string,
                                                                             body: PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsBulkRequest): Future[float64] {.async.} =
  ## Creates multiple indicators in a dataset in one request. Set `autoCreateType` to
  ## create any indicator types that don't exist.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}/indicators/bulk", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, float64)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsCreate*(client: CloudflareClient,
                                                                               accountId: string,
                                                                               datasetId: string,
                                                                               body: PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsCreateRequest): Future[PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsCreateResponse] {.async.} =
  ## Creates an indicator in a dataset. Set `autoCreateType` to create the indicator
  ## type if it doesn't exist.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}/indicators/create", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsCreateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsTags*(client: CloudflareClient,
                                                                            accountId: string,
                                                                            datasetId: string): Future[seq[JsonNode]] {.async.} =
  ## Lists the tags applied to indicators in a dataset. Results are not paginated.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}/indicators/tags")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[JsonNode])
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorId*(client: CloudflareClient,
                                                                                   accountId: string,
                                                                                   datasetId: string,
                                                                                   indicatorId: string): Future[GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdResponse] {.async.} =
  ## Returns an indicator by its UUID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}/indicators/{indicatorId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorId*(client: CloudflareClient,
                                                                                      accountId: string,
                                                                                      datasetId: string,
                                                                                      indicatorId: string): Future[DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdResponse] {.async.} =
  ## Deletes an indicator by its UUID.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}/indicators/{indicatorId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorId*(client: CloudflareClient,
                                                                                     accountId: string,
                                                                                     datasetId: string,
                                                                                     indicatorId: string,
                                                                                     body: PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRequest): Future[PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdResponse] {.async.} =
  ## Updates the given fields of an indicator and leaves the other fields unchanged.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}/indicators/{indicatorId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationships*(client: CloudflareClient,
                                                                                                accountId: string,
                                                                                                datasetId: string,
                                                                                                indicatorId: string,
                                                                                                search: seq[string] = @[],
                                                                                                expand: seq[string] = @[],
                                                                                                cursor: string = default(string),
                                                                                                pageSize: int64 = 25): Future[GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsResponse] {.async.} =
  ## Lists the relationships that start at an indicator. Use `search` to filter them
  ## and `expand` to include the related entities in the response.

  var q = initOrderedTable[string, string]()
  for v in search: q["search"] = $v
  for v in expand: q["expand"] = $v
  q["cursor"] = $cursor
  q["pageSize"] = $pageSize
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}/indicators/{indicatorId}/relationships", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationships*(client: CloudflareClient,
                                                                                                 accountId: string,
                                                                                                 datasetId: string,
                                                                                                 indicatorId: string,
                                                                                                 body: PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsRequest): Future[PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsResponse] {.async.} =
  ## Creates a relationship from an indicator to an event or tag (`targetType`).
  ## Relationships between two indicators are not supported.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}/indicators/{indicatorId}/relationships", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsRelUuid*(client: CloudflareClient,
                                                                                                          accountId: string,
                                                                                                          datasetId: string,
                                                                                                          indicatorId: string,
                                                                                                          relUuid: string): Future[DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsRelUuidResponse] {.async.} =
  ## Deletes an indicator relationship by its UUID. Returns `deleted: false` if the
  ## relationship doesn't exist.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}/indicators/{indicatorId}/relationships/{relUuid}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsRelUuidResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsRelUuid*(client: CloudflareClient,
                                                                                                         accountId: string,
                                                                                                         datasetId: string,
                                                                                                         indicatorId: string,
                                                                                                         relUuid: string,
                                                                                                         body: PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsRelUuidRequest): Future[PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsRelUuidResponse] {.async.} =
  ## Updates the given fields of an indicator relationship and leaves the other
  ## fields unchanged.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}/indicators/{indicatorId}/relationships/{relUuid}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdRelationshipsRelUuidResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsIndicators*(client: CloudflareClient,
                                                        accountId: string,
                                                        datasetIds: seq[string] = @[],
                                                        page: float64 = default(float64),
                                                        pageSize: float64 = default(float64),
                                                        search: seq[string] = @[],
                                                        name: string = default(string),
                                                        indicatorType: string = default(string),
                                                        relatedEvents: seq[string] = @[],
                                                        tags: seq[string] = @[],
                                                        tagSearch: seq[string] = @[],
                                                        createdAfter: string = default(string),
                                                        createdBefore: string = default(string),
                                                        relatedEventsLimit: float64 = default(float64),
                                                        includeTags: bool = default(bool),
                                                        includeTotalCount: bool = default(bool),
                                                        format: IndicatorFormatOption = formatJson,
                                                        cache: IndicatorCacheOption = cacheFromGraph,
                                                        cursor: string = default(string)): Future[GetAccountsAccountIdCloudforceOneEventsIndicatorsResponse] {.async.} =
  ## Lists indicators across datasets, newest first. `datasetIds` accepts dataset
  ## UUIDs or one scope value used alone: `all` (or `*`) and `operational` select the
  ## intelligence datasets you can read, and `analytics` selects the analytics
  ## datasets you can read. Without `datasetIds`, the default dataset is used.

  var q = initOrderedTable[string, string]()
  for v in datasetIds: q["datasetIds"] = $v
  q["page"] = $page
  q["pageSize"] = $pageSize
  for v in search: q["search"] = $v
  q["name"] = $name
  q["indicatorType"] = $indicatorType
  for v in relatedEvents: q["relatedEvents"] = $v
  for v in tags: q["tags"] = $v
  for v in tagSearch: q["tagSearch"] = $v
  q["createdAfter"] = $createdAfter
  q["createdBefore"] = $createdBefore
  q["relatedEventsLimit"] = $relatedEventsLimit
  q["includeTags"] = $includeTags
  q["includeTotalCount"] = $includeTotalCount
  q["format"] = $format
  q["cache"] = $cache
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/indicators", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsIndicatorsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsIndicatorsAggregate*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 aggregateBy: string,
                                                                 measure: IndicatorMeasureOption = measureIndicators,
                                                                 tagUuid: string = default(string),
                                                                 datasetIds: seq[string] = @[],
                                                                 createdAfter: JsonNode = default(JsonNode),
                                                                 createdBefore: JsonNode = default(JsonNode),
                                                                 eventDateAfter: string = default(string),
                                                                 eventDateBefore: string = default(string),
                                                                 limit: float64 = default(float64)): Future[GetAccountsAccountIdCloudforceOneEventsIndicatorsAggregateResponse] {.async.} =
  ## Aggregate threat indicators by one or more columns (e.g., indicatorType, value)
  ## across datasets. Returns top-N groups ordered by count.

  var q = initOrderedTable[string, string]()
  q["aggregateBy"] = $aggregateBy
  q["measure"] = $measure
  q["tagUuid"] = $tagUuid
  for v in datasetIds: q["datasetIds"] = $v
  q["createdAfter"] = $createdAfter
  q["createdBefore"] = $createdBefore
  q["eventDateAfter"] = $eventDateAfter
  q["eventDateBefore"] = $eventDateBefore
  q["limit"] = $limit
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/indicators/aggregate", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsIndicatorsAggregateResponse)
  else:
    raise newException(CloudflareClientError, body)
