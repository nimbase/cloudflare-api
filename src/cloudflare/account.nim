# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


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
