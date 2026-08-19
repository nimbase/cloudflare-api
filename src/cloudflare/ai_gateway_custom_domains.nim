# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsResponse* = object
    result: seq[JsonNode]
    success: bool
  PostAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsRequest = object
    domain: string
    min_t_l_s: Option[string]
    zone_id: string
  PostAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsHostnameResponse* = object
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsHostnameResponse* = object
    result: JsonNode
    success: bool
  AiGatewayCustomDomainStatusOption* = enum
    statusInitializing = "initializing"
    statusPendingDcv = "pending_dcv"
    statusActive = "active"
    statusBlocked = "blocked"
    statusError = "error"


proc getAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomains*(client: CloudflareClient,
                                                                  accountId: string,
                                                                  gatewayId: string,
                                                                  page: int64 = 1,
                                                                  perPage: int64 = 20,
                                                                  status: set[AiGatewayCustomDomainStatusOption] = {},
                                                                  search: string = default(string)): Future[GetAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsResponse] {.async.} =
  ## Lists all AI Gateway evaluator types configured for the account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  for v in status: q["status"] = $v
  q["search"] = $search
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/custom-domains", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomains*(client: CloudflareClient,
                                                                   accountId: string,
                                                                   gatewayId: string,
                                                                   body: PostAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsRequest): Future[PostAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsResponse] {.async.} =
  ## Provisions a Cloudflare-for-SaaS custom hostname and returns the CNAME target to
  ## point DNS at.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/custom-domains", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsHostname*(client: CloudflareClient,
                                                                          accountId: string,
                                                                          gatewayId: string,
                                                                          hostname: string): Future[GetAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsHostnameResponse] {.async.} =
  ## Retrieves details for a specific AI Gateway dataset.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/custom-domains/{hostname}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsHostnameResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsHostname*(client: CloudflareClient,
                                                                             accountId: string,
                                                                             gatewayId: string,
                                                                             hostname: string): Future[DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsHostnameResponse] {.async.} =
  ## Deletes an AI Gateway dataset.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/custom-domains/{hostname}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsHostnameResponse)
  else:
    raise newException(CloudflareClientError, body)
