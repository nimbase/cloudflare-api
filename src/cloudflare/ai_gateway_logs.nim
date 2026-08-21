# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdAiGatewayGatewaysGatewayIdLogsResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdLogsResponse* = object
    success: bool
  GetAccountsAccountIdAiGatewayGatewaysGatewayIdLogsIdResponse* = object
    result: JsonNode
    success: bool
  PatchAccountsAccountIdAiGatewayGatewaysGatewayIdLogsIdRequest = object
    feedback: Option[float64]
    metadata: Option[JsonNode]
    score: Option[float64]
  PatchAccountsAccountIdAiGatewayGatewaysGatewayIdLogsIdResponse* = object
    result: JsonNode
    success: bool
  AiGatewayLogOrderByOption* = enum
    orderByCreatedAt = "created_at"
    orderByProvider = "provider"
    orderByModel = "model"
    orderByModelType = "model_type"
    orderBySuccess = "success"
    orderByCached = "cached"

  AiGatewayLogOrderByDirectionOption* = enum
    orderByDirectionAsc = "asc"
    orderByDirectionDesc = "desc"

  AiGatewayLogDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdAiGatewayGatewaysGatewayIdLogs*(client: CloudflareClient,
                                                         accountId: string,
                                                         gatewayId: string,
                                                         search: string = default(string),
                                                         page: int64 = 1,
                                                         perPage: int64 = 20,
                                                         orderBy: AiGatewayLogOrderByOption = orderByCreatedAt,
                                                         orderByDirection: AiGatewayLogOrderByDirectionOption = orderByDirectionDesc,
                                                         filters: seq[string] = @[],
                                                         metaInfo: bool = default(bool),
                                                         direction: AiGatewayLogDirectionOption,
                                                         startDate: string = default(string),
                                                         endDate: string = default(string),
                                                         minCost: float64 = default(float64),
                                                         maxCost: float64 = default(float64),
                                                         minTokensIn: float64 = default(float64),
                                                         maxTokensIn: float64 = default(float64),
                                                         minTokensOut: float64 = default(float64),
                                                         maxTokensOut: float64 = default(float64),
                                                         minTotalTokens: float64 = default(float64),
                                                         maxTotalTokens: float64 = default(float64),
                                                         minDuration: float64 = default(float64),
                                                         maxDuration: float64 = default(float64),
                                                         feedback: JsonNode = default(JsonNode),
                                                         success: bool = default(bool),
                                                         cached: bool = default(bool),
                                                         model: string = default(string),
                                                         modelType: string = default(string),
                                                         provider: string = default(string),
                                                         requestContentType: string = default(string),
                                                         responseContentType: string = default(string)): Future[GetAccountsAccountIdAiGatewayGatewaysGatewayIdLogsResponse] {.async.} =
  ## Lists request/response log entries for the AI gateway with filtering and
  ## pagination.

  var q = initOrderedTable[string, string]()
  q["search"] = $search
  q["page"] = $page
  q["per_page"] = $perPage
  q["order_by"] = $orderBy
  q["order_by_direction"] = $orderByDirection
  for v in filters: q["filters"] = $v
  q["meta_info"] = $metaInfo
  q["direction"] = $direction
  q["start_date"] = $startDate
  q["end_date"] = $endDate
  q["min_cost"] = $minCost
  q["max_cost"] = $maxCost
  q["min_tokens_in"] = $minTokensIn
  q["max_tokens_in"] = $maxTokensIn
  q["min_tokens_out"] = $minTokensOut
  q["max_tokens_out"] = $maxTokensOut
  q["min_total_tokens"] = $minTotalTokens
  q["max_total_tokens"] = $maxTotalTokens
  q["min_duration"] = $minDuration
  q["max_duration"] = $maxDuration
  q["feedback"] = $feedback
  q["success"] = $success
  q["cached"] = $cached
  q["model"] = $model
  q["model_type"] = $modelType
  q["provider"] = $provider
  q["request_content_type"] = $requestContentType
  q["response_content_type"] = $responseContentType
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/logs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayGatewaysGatewayIdLogsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAiGatewayGatewaysGatewayIdLogs*(client: CloudflareClient,
                                                            accountId: string,
                                                            gatewayId: string,
                                                            orderBy: AiGatewayLogOrderByOption = orderByCreatedAt,
                                                            orderByDirection: AiGatewayLogOrderByDirectionOption = orderByDirectionAsc,
                                                            filters: seq[string] = @[],
                                                            limit: int64 = 10000): Future[DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdLogsResponse] {.async.} =
  ## Deletes gateway log entries matching the specified criteria.

  var q = initOrderedTable[string, string]()
  q["order_by"] = $orderBy
  q["order_by_direction"] = $orderByDirection
  for v in filters: q["filters"] = $v
  q["limit"] = $limit
  let res = await client.httpDELETE(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/logs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdLogsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiGatewayGatewaysGatewayIdLogsId*(client: CloudflareClient,
                                                           id: string,
                                                           gatewayId: string,
                                                           accountId: string): Future[GetAccountsAccountIdAiGatewayGatewaysGatewayIdLogsIdResponse] {.async.} =
  ## Retrieves detailed information for a specific AI Gateway log entry.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/logs/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayGatewaysGatewayIdLogsIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdAiGatewayGatewaysGatewayIdLogsId*(client: CloudflareClient,
                                                             id: string,
                                                             gatewayId: string,
                                                             accountId: string,
                                                             body: PatchAccountsAccountIdAiGatewayGatewaysGatewayIdLogsIdRequest): Future[PatchAccountsAccountIdAiGatewayGatewaysGatewayIdLogsIdResponse] {.async.} =
  ## Updates metadata for an AI Gateway log entry.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/logs/{id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdAiGatewayGatewaysGatewayIdLogsIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiGatewayGatewaysGatewayIdLogsIdRequest*(client: CloudflareClient,
                                                                  id: string,
                                                                  gatewayId: string,
                                                                  accountId: string): Future[JsonNode] {.async.} =
  ## Retrieves the original request payload for an AI Gateway log entry.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/logs/{id}/request")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiGatewayGatewaysGatewayIdLogsIdResponse*(client: CloudflareClient,
                                                                   id: string,
                                                                   gatewayId: string,
                                                                   accountId: string): Future[JsonNode] {.async.} =
  ## Retrieves the response payload for an AI Gateway log entry.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/logs/{id}/response")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
