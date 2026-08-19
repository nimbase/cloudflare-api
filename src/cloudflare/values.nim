# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[options, json]
import ./private/metaclient

type
  PostAccountsAccountIdWorkersObservabilityTelemetryValuesRequest = object
    datasets: seq[string]
    filters: Option[seq[JsonNode]]
    key: string
    limit: Option[float64]
    needle: Option[JsonNode]
    timeframe: JsonNode
    `type`: string
  PostAccountsAccountIdWorkersObservabilityTelemetryValuesResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: seq[JsonNode]
    success: bool

proc postAccountsAccountIdWorkersObservabilityTelemetryValues*(client: CloudflareClient,
                                                               body: PostAccountsAccountIdWorkersObservabilityTelemetryValuesRequest): Future[PostAccountsAccountIdWorkersObservabilityTelemetryValuesResponse] {.async.} =
  ## List unique values found in your events.

  let res = await client.httpPOST("/accounts/{account_id}/workers/observability/telemetry/values", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdWorkersObservabilityTelemetryValuesResponse)
  else:
    raise newException(CloudflareClientError, body)
