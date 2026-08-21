# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetAccountsAccountIdAiGatewayEvaluationTypesResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsResponse* = object
    result: seq[JsonNode]
    success: bool
  PostAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsRequest = object
    dataset_ids: seq[string]
    evaluation_type_ids: seq[string]
    name: string
  PostAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsIdResponse* = object
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsIdResponse* = object
    result: JsonNode
    success: bool
  AiGatewayEvaluationOrderByDirectionOption* = enum
    orderByDirectionAsc = "asc"
    orderByDirectionDesc = "desc"


proc getAccountsAccountIdAiGatewayEvaluationTypes*(client: CloudflareClient,
                                                   accountId: string,
                                                   page: int64 = 1,
                                                   perPage: int64 = 20,
                                                   orderBy: string = "mandatory",
                                                   orderByDirection: AiGatewayEvaluationOrderByDirectionOption = orderByDirectionDesc): Future[GetAccountsAccountIdAiGatewayEvaluationTypesResponse] {.async.} =
  ## Lists all available evaluator types for scoring AI gateway responses.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["order_by"] = $orderBy
  q["order_by_direction"] = $orderByDirection
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/evaluation-types", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayEvaluationTypesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluations*(client: CloudflareClient,
                                                                accountId: string,
                                                                gatewayId: string,
                                                                page: int64 = 1,
                                                                perPage: int64 = 20,
                                                                name: string = default(string),
                                                                processed: bool = default(bool),
                                                                search: string = default(string)): Future[GetAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsResponse] {.async.} =
  ## Lists all AI Gateway evaluator types configured for the account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["name"] = $name
  q["processed"] = $processed
  q["search"] = $search
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/evaluations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluations*(client: CloudflareClient,
                                                                 gatewayId: string,
                                                                 accountId: string,
                                                                 body: PostAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsRequest): Future[PostAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsResponse] {.async.} =
  ## Creates a new AI Gateway.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/evaluations", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsId*(client: CloudflareClient,
                                                                  accountId: string,
                                                                  gatewayId: string,
                                                                  id: string): Future[GetAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsIdResponse] {.async.} =
  ## Retrieves details for a specific AI Gateway dataset.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/evaluations/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsId*(client: CloudflareClient,
                                                                     accountId: string,
                                                                     gatewayId: string,
                                                                     id: string): Future[DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsIdResponse] {.async.} =
  ## Deletes an AI Gateway dataset.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/evaluations/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdEvaluationsIdResponse)
  else:
    raise newException(CloudflareClientError, body)
