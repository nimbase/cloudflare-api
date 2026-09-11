# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdBuildsTokens*(client: CloudflareClient,
                                       accountId: types.BuildsAccountId,
                                       page: int64 = 1, perPage: int64 = 50): Future[JsonNode] {.async.} =
  ## List metadata for build tokens available to the current user without returning
  ## their secrets.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/builds/tokens", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdBuildsTokens*(client: CloudflareClient,
                                        accountId: types.BuildsAccountId,
                                        body: types.BuildsCreateBuildTokenRequest): Future[JsonNode] {.async.} =
  ## Create a new build authentication token

  let res = await client.httpPOST(fmt"/accounts/{accountId}/builds/tokens", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdBuildsTokensBuildTokenUuid*(client: CloudflareClient,
                                                        accountId: types.BuildsAccountId,
                                                        buildTokenUuid: types.BuildsBuildTokenUuid): Future[types.BuildsAPIResponse] {.async.} =
  ## Delete a stored build token owned by the current user.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/builds/tokens/{buildTokenUuid}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BuildsAPIResponse)
  else:
    raise newException(CloudflareClientError, body)
