# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdWorkersObservabilitySharedQueryRequest = object
    chart: Option[bool]
    chart_type: Option[string]
    compare: Option[bool]
    distribution_scale: Option[string]
    dry: Option[bool]
    granularity: Option[float64]
    ignore_series: Option[bool]
    limit: Option[float64]
    offset: Option[string]
    offset_by: Option[float64]
    offset_direction: Option[string]
    parameters: Option[JsonNode]
    query_id: string
    timeframe: JsonNode
    view: Option[string]
  PostAccountsAccountIdWorkersObservabilitySharedQueryResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  GetAccountsAccountIdWorkersObservabilitySharedQueryIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: types.WorkersObservabilityQueryResults
    success: bool
  SharedViewOption* = enum
    viewEvents = "events"
    viewInvocations = "invocations"
    viewCalculations = "calculations"


proc postAccountsAccountIdWorkersObservabilitySharedQuery*(client: CloudflareClient,
                                                           body: PostAccountsAccountIdWorkersObservabilitySharedQueryRequest): Future[PostAccountsAccountIdWorkersObservabilitySharedQueryResponse] {.async.} =
  ## Shared queries store the results of a previously run query, allowing you to
  ## share the results with others.

  let res = await client.httpPOST("/accounts/{account_id}/workers/observability/shared/query", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdWorkersObservabilitySharedQueryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersObservabilitySharedQueryId*(client: CloudflareClient,
                                                            id: string,
                                                            view: SharedViewOption): Future[GetAccountsAccountIdWorkersObservabilitySharedQueryIdResponse] {.async.} =
  ## Shared queries store the results of a previously run query, allowing you to
  ## share the results with others.

  var q = initOrderedTable[string, string]()
  q["view"] = $view
  let res = await client.httpGET(fmt"/accounts/{account_id}/workers/observability/shared/query/{id}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkersObservabilitySharedQueryIdResponse)
  else:
    raise newException(CloudflareClientError, body)
