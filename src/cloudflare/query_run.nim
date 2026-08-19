# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[options, json]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdWorkersObservabilityTelemetryQueryRequest = object
    chart: Option[bool]
    chart_type: Option[string]
    compare: Option[bool]
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
  PostAccountsAccountIdWorkersObservabilityTelemetryQueryResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: types.WorkersObservabilityQueryResults
    success: bool

proc postAccountsAccountIdWorkersObservabilityTelemetryQuery*(client: CloudflareClient,
                                                              body: PostAccountsAccountIdWorkersObservabilityTelemetryQueryRequest): Future[PostAccountsAccountIdWorkersObservabilityTelemetryQueryResponse] {.async.} =
  ## Run a temporary or saved query.

  let res = await client.httpPOST("/accounts/{account_id}/workers/observability/telemetry/query", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdWorkersObservabilityTelemetryQueryResponse)
  else:
    raise newException(CloudflareClientError, body)
