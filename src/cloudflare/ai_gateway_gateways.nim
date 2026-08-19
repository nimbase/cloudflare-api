# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdAiGatewayGatewaysResponse* = object
    result: seq[JsonNode]
    success: bool
  PostAccountsAccountIdAiGatewayGatewaysRequest = object
    authentication: Option[bool]
    cache_invalidate_on_update: bool
    cache_ttl: Option[int64]
    collect_logs: bool
    id: string
    log_management: Option[int64]
    log_management_strategy: Option[string]
    logpush: Option[bool]
    logpush_public_key: Option[string]
    rate_limiting_interval: Option[int64]
    rate_limiting_limit: Option[int64]
    rate_limiting_technique: Option[string]
    retry_backoff: Option[string]
    retry_delay: Option[int64]
    retry_max_attempts: Option[int64]
    store_id: Option[string]
    workers_ai_billing_mode: Option[string]
    zdr: Option[bool]
  PostAccountsAccountIdAiGatewayGatewaysResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiGatewayGatewaysGatewayIdUrlProviderResponse* = object
    result: string
    success: bool
  GetAccountsAccountIdAiGatewayGatewaysIdResponse* = object
    result: JsonNode
    success: bool
  PutAccountsAccountIdAiGatewayGatewaysIdRequest = object
    authentication: Option[bool]
    cache_invalidate_on_update: bool
    cache_ttl: Option[int64]
    collect_logs: bool
    dlp: Option[JsonNode]
    guardrails: Option[JsonNode]
    log_classification: Option[bool]
    log_management: Option[int64]
    log_management_strategy: Option[string]
    logpush: Option[bool]
    logpush_public_key: Option[string]
    otel: Option[seq[JsonNode]]
    rate_limiting_interval: Option[int64]
    rate_limiting_limit: Option[int64]
    rate_limiting_technique: Option[string]
    retry_backoff: Option[string]
    retry_delay: Option[int64]
    retry_max_attempts: Option[int64]
    spend_limits: Option[JsonNode]
    store_id: Option[string]
    stripe: Option[JsonNode]
    workers_ai_billing_mode: Option[string]
    zdr: Option[bool]
  PutAccountsAccountIdAiGatewayGatewaysIdResponse* = object
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdAiGatewayGatewaysIdResponse* = object
    result: JsonNode
    success: bool

proc getAccountsAccountIdAiGatewayGateways*(client: CloudflareClient,
                                            accountId: string, page: int64 = 1,
                                            perPage: int64 = 20,
                                            search: string = default(string)): Future[GetAccountsAccountIdAiGatewayGatewaysResponse] {.async.} =
  ## Lists all AI Gateway evaluator types configured for the account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["search"] = $search
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/gateways", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayGatewaysResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiGatewayGateways*(client: CloudflareClient,
                                             accountId: string,
                                             body: PostAccountsAccountIdAiGatewayGatewaysRequest): Future[PostAccountsAccountIdAiGatewayGatewaysResponse] {.async.} =
  ## Creates a new AI Gateway.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-gateway/gateways", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiGatewayGatewaysResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiGatewayGatewaysGatewayIdUrlProvider*(client: CloudflareClient,
                                                                gatewayId: string,
                                                                accountId: string,
                                                                provider: string): Future[GetAccountsAccountIdAiGatewayGatewaysGatewayIdUrlProviderResponse] {.async.} =
  ## Retrieves the endpoint URL for an AI Gateway.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/url/{provider}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayGatewaysGatewayIdUrlProviderResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiGatewayGatewaysId*(client: CloudflareClient,
                                              accountId: string, id: string): Future[GetAccountsAccountIdAiGatewayGatewaysIdResponse] {.async.} =
  ## Retrieves details for a specific AI Gateway dataset.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/gateways/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayGatewaysIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAiGatewayGatewaysId*(client: CloudflareClient,
                                              accountId: string, id: string,
                                              body: PutAccountsAccountIdAiGatewayGatewaysIdRequest): Future[PutAccountsAccountIdAiGatewayGatewaysIdResponse] {.async.} =
  ## Updates an existing AI Gateway dataset.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/ai-gateway/gateways/{id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdAiGatewayGatewaysIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAiGatewayGatewaysId*(client: CloudflareClient,
                                                 accountId: string, id: string): Future[DeleteAccountsAccountIdAiGatewayGatewaysIdResponse] {.async.} =
  ## Deletes an AI Gateway dataset.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/ai-gateway/gateways/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAiGatewayGatewaysIdResponse)
  else:
    raise newException(CloudflareClientError, body)
