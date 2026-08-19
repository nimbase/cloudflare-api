# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsResponse* = object
    result: seq[JsonNode]
    success: bool
  PostAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsRequest = object
    enable: bool
    filters: seq[JsonNode]
    name: string
  PostAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsIdResponse* = object
    result: JsonNode
    success: bool
  PutAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsIdRequest = object
    enable: bool
    filters: seq[JsonNode]
    name: string
  PutAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsIdResponse* = object
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsIdResponse* = object
    result: JsonNode
    success: bool

proc getAccountsAccountIdAiGatewayGatewaysGatewayIdDatasets*(client: CloudflareClient,
                                                             accountId: string,
                                                             gatewayId: string,
                                                             page: int64 = 1,
                                                             perPage: int64 = 20,
                                                             name: string = default(string),
                                                             enable: bool = default(bool),
                                                             search: string = default(string)): Future[GetAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsResponse] {.async.} =
  ## Lists all AI Gateway evaluator types configured for the account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["name"] = $name
  q["enable"] = $enable
  q["search"] = $search
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/datasets", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiGatewayGatewaysGatewayIdDatasets*(client: CloudflareClient,
                                                              gatewayId: string,
                                                              accountId: string,
                                                              body: PostAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsRequest): Future[PostAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsResponse] {.async.} =
  ## Creates a new AI Gateway.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/datasets", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsId*(client: CloudflareClient,
                                                               accountId: string,
                                                               gatewayId: string,
                                                               id: string): Future[GetAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsIdResponse] {.async.} =
  ## Retrieves details for a specific AI Gateway dataset.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/datasets/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsId*(client: CloudflareClient,
                                                               accountId: string,
                                                               gatewayId: string,
                                                               id: string,
                                                               body: PutAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsIdRequest): Future[PutAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsIdResponse] {.async.} =
  ## Updates an existing AI Gateway dataset.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/datasets/{id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsId*(client: CloudflareClient,
                                                                  accountId: string,
                                                                  gatewayId: string,
                                                                  id: string): Future[DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsIdResponse] {.async.} =
  ## Deletes an AI Gateway dataset.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/datasets/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdDatasetsIdResponse)
  else:
    raise newException(CloudflareClientError, body)
