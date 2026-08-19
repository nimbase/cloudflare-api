# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient

type
  GetAccountsAccountIdWorkersObservabilityMetricsexportResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: seq[JsonNode]
    success: bool
  PostAccountsAccountIdWorkersObservabilityMetricsexportResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: seq[JsonNode]
    success: bool
  DeleteAccountsAccountIdWorkersObservabilityMetricsexportRequest = object
    resource_id: string
    resource_type: string
  DeleteAccountsAccountIdWorkersObservabilityMetricsexportResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool

proc getAccountsAccountIdWorkersObservabilityMetricsexport*(client: CloudflareClient): Future[GetAccountsAccountIdWorkersObservabilityMetricsexportResponse] {.async.} =
  ## List resources configured for Workers Observability metrics export.

  let res = await client.httpGET("/accounts/{account_id}/workers/observability/metricsexport")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkersObservabilityMetricsexportResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdWorkersObservabilityMetricsexport*(client: CloudflareClient): Future[PostAccountsAccountIdWorkersObservabilityMetricsexportResponse] {.async.} =
  ## Create or replace resources configured for Workers Observability metrics export.

  let res = await client.httpPOST("/accounts/{account_id}/workers/observability/metricsexport", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, PostAccountsAccountIdWorkersObservabilityMetricsexportResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdWorkersObservabilityMetricsexport*(client: CloudflareClient,
                                                               body: DeleteAccountsAccountIdWorkersObservabilityMetricsexportRequest): Future[DeleteAccountsAccountIdWorkersObservabilityMetricsexportResponse] {.async.} =
  ## Delete one resource configured for Workers Observability metrics export.

  let res = await client.httpDELETE("/accounts/{account_id}/workers/observability/metricsexport", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdWorkersObservabilityMetricsexportResponse)
  else:
    raise newException(CloudflareClientError, body)
