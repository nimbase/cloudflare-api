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
    byok_only: Option[bool]
    cache_invalidate_on_update: bool
    cache_ttl: Option[int64]
    collect_logs: bool
    dlp: Option[JsonNode]
    guardrails: Option[JsonNode]
    id: string
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
    byok_only: Option[bool]
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
  ## Lists the AI Gateways in the account. Use `search` to filter by gateway ID.

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
  ## Creates an AI Gateway in the account with the specified caching, rate limiting,
  ## logging, and authentication settings. The gateway ID appears in request URLs and
  ## must be unique within the account.

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
  ## Retrieves the configuration of an AI Gateway.

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
  ## Updates the configuration of an AI Gateway, such as its caching, rate limiting,
  ## logging, and authentication settings.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/ai-gateway/gateways/{id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdAiGatewayGatewaysIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAiGatewayGatewaysId*(client: CloudflareClient,
                                                 accountId: string, id: string): Future[DeleteAccountsAccountIdAiGatewayGatewaysIdResponse] {.async.} =
  ## Permanently deletes an AI Gateway, its configuration, and its stored logs.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/ai-gateway/gateways/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAiGatewayGatewaysIdResponse)
  else:
    raise newException(CloudflareClientError, body)
