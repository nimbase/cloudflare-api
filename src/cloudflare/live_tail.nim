# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[options, json]
import ./private/metaclient

type
  PostAccountsAccountIdWorkersObservabilityTelemetryLiveTailRequest = object
    filter_combination: Option[string]
    filters: Option[seq[JsonNode]]
    script_id: Option[string]
  PostAccountsAccountIdWorkersObservabilityTelemetryLiveTailResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  PostAccountsAccountIdWorkersObservabilityTelemetryLiveTailHeartbeatRequest = object
    script_id: Option[string]
  PostAccountsAccountIdWorkersObservabilityTelemetryLiveTailHeartbeatResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool

proc postAccountsAccountIdWorkersObservabilityTelemetryLiveTail*(client: CloudflareClient,
                                                                 body: PostAccountsAccountIdWorkersObservabilityTelemetryLiveTailRequest): Future[PostAccountsAccountIdWorkersObservabilityTelemetryLiveTailResponse] {.async.} =
  ## Prepare websocket server for live tail.

  let res = await client.httpPOST("/accounts/{account_id}/workers/observability/telemetry/live-tail", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdWorkersObservabilityTelemetryLiveTailResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdWorkersObservabilityTelemetryLiveTailHeartbeat*(client: CloudflareClient,
                                                                          body: PostAccountsAccountIdWorkersObservabilityTelemetryLiveTailHeartbeatRequest): Future[PostAccountsAccountIdWorkersObservabilityTelemetryLiveTailHeartbeatResponse] {.async.} =
  ## Notify live tail that user is still eligible to receive live events.

  let res = await client.httpPOST("/accounts/{account_id}/workers/observability/telemetry/live-tail/heartbeat", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdWorkersObservabilityTelemetryLiveTailHeartbeatResponse)
  else:
    raise newException(CloudflareClientError, body)
