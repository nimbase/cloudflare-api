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
  GetAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsIdResponse* = object
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
  ## Lists the provider keys stored for an AI Gateway. Responses show a masked
  ## preview of each key, never the key itself.

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
  ## Stores an upstream AI provider API key for an AI Gateway in the Secrets Store
  ## configured on the gateway, with an optional rate limit. Pass `secret` to store a
  ## new key, or omit it to use an existing Secrets Store secret.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/provider_configs", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsId*(client: CloudflareClient,
                                                                      accountId: string,
                                                                      gatewayId: string,
                                                                      id: string): Future[GetAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsIdResponse] {.async.} =
  ## Retrieves a provider key configuration for an AI Gateway. The response shows a
  ## masked preview of the key, never the key itself.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/provider_configs/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsId*(client: CloudflareClient,
                                                                      accountId: string,
                                                                      gatewayId: string,
                                                                      id: string,
                                                                      body: PutAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsIdRequest): Future[PutAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsIdResponse] {.async.} =
  ## Replaces the stored API key of a provider key configuration. Only the key can
  ## change.

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
  ## Deletes a provider key configuration from an AI Gateway and deletes its secret
  ## from the Secrets Store.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/provider_configs/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdProviderConfigsIdResponse)
  else:
    raise newException(CloudflareClientError, body)
