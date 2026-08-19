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
  PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsBulkRequest = object
    auto_create_type: Option[bool]
    indicators: seq[JsonNode]
  PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsCreateRequest = object
    auto_create_type: Option[bool]
    indicator_type: string
    related_events: Option[seq[JsonNode]]
    tags: Option[seq[JsonNode]]
    value: string
  PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsCreateResponse* = object
    created_at: string
    dataset_id: string
      ## The dataset ID this indicator belongs to. Included in list responses.
    indicator_type: string
    related_events: seq[JsonNode]
    tags: seq[JsonNode]
    updated_at: string
    uuid: string
    value: string
  GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdResponse* = object
    created_at: string
    dataset_id: string
      ## The dataset ID this indicator belongs to. Included in list responses.
    indicator_type: string
    related_events: seq[JsonNode]
    tags: seq[JsonNode]
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
    value: Option[string]
  PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdResponse* = object
    created_at: string
    dataset_id: string
      ## The dataset ID this indicator belongs to. Included in list responses.
    indicator_type: string
    related_events: seq[JsonNode]
    tags: seq[JsonNode]
    updated_at: string
    uuid: string
    value: string
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
  ## This method is deprecated. Please use /events/indicators to retrieve a paginated
  ## list of indicators.

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

proc postAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsBulk*(client: CloudflareClient,
                                                                             accountId: string,
                                                                             datasetId: string,
                                                                             body: PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsBulkRequest): Future[float64] {.async.} =
  ## Creates multiple indicators at once with their respective types and related
  ## datasets.

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
  ## Creates a new indicator with the specified type and related datasets.

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
  ## Returns all mirrored tags from the indicator dataset (DO mirror table). No
  ## pagination.

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
  ## Retrieves a specific indicator by its UUID.

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
  ## Deletes a specific indicator by its UUID.

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
  ## Updates an existing indicator's properties.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}/indicators/{indicatorId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorsIndicatorIdResponse)
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
                                                        format: set[IndicatorFormatOption] = {},
                                                        cache: set[IndicatorCacheOption] = {},
                                                        cursor: string = default(string)): Future[GetAccountsAccountIdCloudforceOneEventsIndicatorsResponse] {.async.} =
  ## Retrieves indicators across specified datasets, ordered by createdAt descending
  ## then UUID, dataset ID, and shard ID ascending. Use datasetIds=all or
  ## datasetIds=* to query all datasets for the account. If no datasetIds provided,
  ## uses the default dataset.

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
  for v in format: q["format"] = $v
  for v in cache: q["cache"] = $v
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
                                                                 measure: string = "indicators",
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
  for v in measure: q["measure"] = $v
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
