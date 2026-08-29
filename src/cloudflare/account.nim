# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types

type
  GetAccountsAccountIdAiGatewayLoggingStateResponse* = object
    result: JsonNode
    success: bool
  PatchAccountsAccountIdAiGatewayLoggingStateResponse* = object
    result: JsonNode
    success: bool

proc getAccountsAccountIdAiGatewayLoggingState*(client: CloudflareClient,
                                                accountId: string): Future[GetAccountsAccountIdAiGatewayLoggingStateResponse] {.async.} =
  ## Returns the canonical logging platform and migration availability for an
  ## account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/logging-state")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayLoggingStateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdAiGatewayLoggingState*(client: CloudflareClient,
                                                  accountId: string): Future[PatchAccountsAccountIdAiGatewayLoggingStateResponse] {.async.} =
  ## Irreversibly migrates an eligible account to Workers Observability logging.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/ai-gateway/logging-state")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdAiGatewayLoggingStateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBuildsAccountLimits*(client: CloudflareClient,
                                              accountId: types.BuildsAccountId): Future[JsonNode] {.async.} =
  ## Retrieve account limits and usage information

  let res = await client.httpGET(fmt"/accounts/{accountId}/builds/account/limits")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
