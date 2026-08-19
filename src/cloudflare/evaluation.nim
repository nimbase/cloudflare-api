# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdFlagshipAppsAppIdEvaluateRequest = object
    context: Option[JsonNode]
    flag_key: string

proc getAccountsAccountIdFlagshipAppsAppIdEvaluate*(client: CloudflareClient,
                                                    accountId: string,
                                                    appId: string,
                                                    flagKey: string,
                                                    targetingKey: string = default(string)): Future[types.FlagshipEvaluationResult] {.async.} =
  ## Evaluates a flag against the provided context. Pass context attributes as query
  ## parameters; values are forwarded as strings. For low-latency in-Worker
  ## evaluation, prefer the Flagship binding over this endpoint.

  var q = initOrderedTable[string, string]()
  q["flagKey"] = $flagKey
  q["targetingKey"] = $targetingKey
  let res = await client.httpGET(fmt"/accounts/{accountId}/flagship/apps/{appId}/evaluate", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FlagshipEvaluationResult)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdFlagshipAppsAppIdEvaluate*(client: CloudflareClient,
                                                     accountId: string,
                                                     appId: string,
                                                     body: PostAccountsAccountIdFlagshipAppsAppIdEvaluateRequest): Future[types.FlagshipEvaluationResult] {.async.} =
  ## Evaluates a flag against the provided context, passed as a JSON request body
  ## (OFREP-shaped) rather than query parameters. Returns the same response shape as
  ## the GET variant.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/flagship/apps/{appId}/evaluate", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FlagshipEvaluationResult)
  else:
    raise newException(CloudflareClientError, body)
