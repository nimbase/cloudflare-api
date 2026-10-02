# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdAiGatewayCustomProvidersCostsResponse* = object
    result: seq[JsonNode]
    success: bool
  PostAccountsAccountIdAiGatewayCustomProvidersCostsRequest = object
    account_provider_id: string
    cost_in: Option[float64]
    cost_out: Option[float64]
    cost_type: Option[string]
    enable: Option[bool]
    model: string
    model_rule: Option[string]
    token_pricing: Option[JsonNode]
  PostAccountsAccountIdAiGatewayCustomProvidersCostsResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiGatewayCustomProvidersCostsIdResponse* = object
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdAiGatewayCustomProvidersCostsIdResponse* = object
    result: JsonNode
    success: bool
  PatchAccountsAccountIdAiGatewayCustomProvidersCostsIdRequest = object
    cost_in: Option[float64]
    cost_out: Option[float64]
    cost_type: Option[string]
    enable: Option[bool]
    model: Option[string]
    model_rule: Option[string]
    token_pricing: Option[JsonNode]
  PatchAccountsAccountIdAiGatewayCustomProvidersCostsIdResponse* = object
    result: JsonNode
    success: bool
  AiGatewayCustomProviderCostModelRuleOption* = enum
    modelRuleEquals = "equals"
    modelRuleStartsWith = "starts-with"
    modelRuleContains = "contains"


proc getAccountsAccountIdAiGatewayCustomProvidersCosts*(client: CloudflareClient,
                                                        accountId: string,
                                                        page: int64 = 1,
                                                        perPage: int64 = 20,
                                                        enable: bool = default(bool),
                                                        accountProviderId: string = default(string),
                                                        modelRule: AiGatewayCustomProviderCostModelRuleOption = modelRuleEquals,
                                                        costType: string = "tokens",
                                                        search: string = default(string)): Future[GetAccountsAccountIdAiGatewayCustomProvidersCostsResponse] {.async.} =
  ## Lists the pricing rules for custom providers in the account, most recently
  ## modified first.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["enable"] = $enable
  q["account_provider_id"] = $accountProviderId
  q["model_rule"] = $modelRule
  q["cost_type"] = $costType
  q["search"] = $search
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/custom-providers/costs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayCustomProvidersCostsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiGatewayCustomProvidersCosts*(client: CloudflareClient,
                                                         accountId: string,
                                                         body: PostAccountsAccountIdAiGatewayCustomProvidersCostsRequest): Future[PostAccountsAccountIdAiGatewayCustomProvidersCostsResponse] {.async.} =
  ## Creates a pricing rule that sets per-token costs for models matched on a custom
  ## provider. AI Gateway uses these rules to calculate request costs.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-gateway/custom-providers/costs", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiGatewayCustomProvidersCostsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiGatewayCustomProvidersCostsId*(client: CloudflareClient,
                                                          accountId: string,
                                                          id: string): Future[GetAccountsAccountIdAiGatewayCustomProvidersCostsIdResponse] {.async.} =
  ## Retrieves a custom provider pricing rule, including its model match rule and
  ## token prices.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/custom-providers/costs/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayCustomProvidersCostsIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAiGatewayCustomProvidersCostsId*(client: CloudflareClient,
                                                             accountId: string,
                                                             id: string): Future[DeleteAccountsAccountIdAiGatewayCustomProvidersCostsIdResponse] {.async.} =
  ## Deletes a custom provider pricing rule. Requests to the matched model stop using
  ## its prices.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/ai-gateway/custom-providers/costs/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAiGatewayCustomProvidersCostsIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdAiGatewayCustomProvidersCostsId*(client: CloudflareClient,
                                                            accountId: string,
                                                            id: string,
                                                            body: PatchAccountsAccountIdAiGatewayCustomProvidersCostsIdRequest): Future[PatchAccountsAccountIdAiGatewayCustomProvidersCostsIdResponse] {.async.} =
  ## Updates the specified fields of a custom provider pricing rule. Changes clear
  ## cached costs for the matched model.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/ai-gateway/custom-providers/costs/{id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdAiGatewayCustomProvidersCostsIdResponse)
  else:
    raise newException(CloudflareClientError, body)
