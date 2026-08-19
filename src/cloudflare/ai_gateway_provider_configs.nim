# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsResponse* = object
    result: seq[JsonNode]
    success: bool
  PostAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsRequest = object
    alias: string
    default_config: bool
    provider_slug: string
    rate_limit: Option[float64]
    rate_limit_period: Option[float64]
    secret: Option[string]
    secret_id: Option[string]
  PostAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsResponse* = object
    result: JsonNode
    success: bool
  PutAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsIdRequest = object
    secret: string
  PutAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsIdResponse* = object
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsIdResponse* = object
    result: JsonNode
    success: bool

proc getAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigs*(client: CloudflareClient,
                                                                    accountId: string,
                                                                    gatewayId: string,
                                                                    page: int64 = 1,
                                                                    perPage: int64 = 20): Future[GetAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsResponse] {.async.} =
  ## Lists all AI Gateway evaluator types configured for the account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/provider_configs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigs*(client: CloudflareClient,
                                                                     accountId: string,
                                                                     gatewayId: string,
                                                                     body: PostAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsRequest): Future[PostAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsResponse] {.async.} =
  ## Creates a new AI Gateway.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/provider_configs", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsId*(client: CloudflareClient,
                                                                      accountId: string,
                                                                      gatewayId: string,
                                                                      id: string,
                                                                      body: PutAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsIdRequest): Future[PutAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsIdResponse] {.async.} =
  ## Updates an existing AI Gateway dataset.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/provider_configs/{id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsId*(client: CloudflareClient,
                                                                         accountId: string,
                                                                         gatewayId: string,
                                                                         id: string): Future[DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsIdResponse] {.async.} =
  ## Deletes an AI Gateway dataset.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/provider_configs/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsIdResponse)
  else:
    raise newException(CloudflareClientError, body)
