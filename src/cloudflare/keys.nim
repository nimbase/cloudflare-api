# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[options, json]
import ./private/metaclient

type
  PostAccountsAccountIdWorkersObservabilityTelemetryKeysRequest = object
    datasets: Option[seq[string]]
    filters: Option[seq[JsonNode]]
    `from`: Option[float64]
    key_needle: Option[JsonNode]
    limit: Option[float64]
    needle: Option[JsonNode]
    to: Option[float64]
  PostAccountsAccountIdWorkersObservabilityTelemetryKeysResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: seq[JsonNode]
    success: bool

proc postAccountsAccountIdWorkersObservabilityTelemetryKeys*(client: CloudflareClient,
                                                             body: PostAccountsAccountIdWorkersObservabilityTelemetryKeysRequest): Future[PostAccountsAccountIdWorkersObservabilityTelemetryKeysResponse] {.async.} =
  ## List all the keys in your telemetry events.

  let res = await client.httpPOST("/accounts/{account_id}/workers/observability/telemetry/keys", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdWorkersObservabilityTelemetryKeysResponse)
  else:
    raise newException(CloudflareClientError, body)
