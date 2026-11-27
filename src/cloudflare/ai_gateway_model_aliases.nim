# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  PostAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesRequest = object
    models: seq[JsonNode]
    name: string
    routing: Option[JsonNode]
  PostAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesIdResponse* = object
    result: JsonNode
    success: bool
  PutAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesIdRequest = object
    models: seq[JsonNode]
    name: string
    routing: Option[JsonNode]
  PutAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesIdResponse* = object
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesIdResponse* = object
    result: JsonNode
    success: bool

proc getAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliases*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 gatewayId: string,
                                                                 page: int64 = 1,
                                                                 perPage: int64 = 100): Future[GetAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesResponse] {.async.} =
  ## Lists the model aliases configured on a gateway, sorted by name.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/model_aliases", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliases*(client: CloudflareClient,
                                                                  accountId: string,
                                                                  gatewayId: string,
                                                                  body: PostAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesRequest): Future[PostAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesResponse] {.async.} =
  ## Creates a model alias on a gateway: a named, ordered list of catalog models,
  ## each optionally restricted to providers. Requests address it as `custom/<name>`.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/model_aliases", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesId*(client: CloudflareClient,
                                                                   accountId: string,
                                                                   gatewayId: string,
                                                                   id: string): Future[GetAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesIdResponse] {.async.} =
  ## Retrieves a model alias configured on a gateway.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/model_aliases/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesId*(client: CloudflareClient,
                                                                   accountId: string,
                                                                   gatewayId: string,
                                                                   id: string,
                                                                   body: PutAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesIdRequest): Future[PutAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesIdResponse] {.async.} =
  ## Replaces a model alias. Omitting `routing` clears any previously stored routing
  ## options.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/model_aliases/{id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesId*(client: CloudflareClient,
                                                                      accountId: string,
                                                                      gatewayId: string,
                                                                      id: string): Future[DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesIdResponse] {.async.} =
  ## Deletes a model alias from a gateway.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/model_aliases/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdModelAliasesIdResponse)
  else:
    raise newException(CloudflareClientError, body)
