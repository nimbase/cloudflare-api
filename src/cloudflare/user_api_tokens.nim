# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types

type
  UserApiTokenDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getUserTokens*(client: CloudflareClient, page: float64 = default(float64),
                    perPage: float64 = default(float64),
                    direction: set[UserApiTokenDirectionOption] = {},
                    includeExpired: bool = false): Future[types.IamCollectionTokensResponse] {.async.} =
  ## List all access tokens you created. Results include active, disabled, and
  ## recently-expired tokens when include_expired is set to true.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  for v in direction: q["direction"] = $v
  q["include_expired"] = $includeExpired
  let res = await client.httpGET("/user/tokens", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamCollectionTokensResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postUserTokens*(client: CloudflareClient, body: types.IamCreatePayload): Future[types.IamSingleTokenCreateResponse] {.async.} =
  ## Create a new access token.

  let res = await client.httpPOST("/user/tokens", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSingleTokenCreateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getUserTokensPermissionGroups*(client: CloudflareClient,
                                    name: string = default(string),
                                    scope: string = default(string)): Future[types.IamPermissionsGroupResponseCollection] {.async.} =
  ## Find all available permission groups for API Tokens.

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  q["scope"] = $scope
  let res = await client.httpGET("/user/tokens/permission_groups", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamPermissionsGroupResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getUserTokensVerify*(client: CloudflareClient): Future[types.IamTokenVerifyResponseSingleSegment] {.async.} =
  ## Test whether a token works.

  let res = await client.httpGET("/user/tokens/verify")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamTokenVerifyResponseSingleSegment)
  else:
    raise newException(CloudflareClientError, body)

proc getUserTokensTokenId*(client: CloudflareClient,
                           tokenId: types.IamTokenIdentifier): Future[types.IamSingleTokenResponse] {.async.} =
  ## Get information about a specific token.

  let res = await client.httpGET(fmt"/user/tokens/{tokenId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSingleTokenResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putUserTokensTokenId*(client: CloudflareClient,
                           tokenId: types.IamTokenIdentifier,
                           body: types.IamTokenBody): Future[types.IamSingleTokenResponse] {.async.} =
  ## Update an existing token.

  let res = await client.httpPUT(fmt"/user/tokens/{tokenId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSingleTokenResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteUserTokensTokenId*(client: CloudflareClient,
                              tokenId: types.IamTokenIdentifier): Future[types.IamApiResponseSingleId] {.async.} =
  ## Destroy a token.

  let res = await client.httpDELETE(fmt"/user/tokens/{tokenId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamApiResponseSingleId)
  else:
    raise newException(CloudflareClientError, body)

proc putUserTokensTokenIdValue*(client: CloudflareClient,
                                tokenId: types.IamTokenIdentifier): Future[types.IamResponseSingleValue] {.async.} =
  ## Roll the token secret.

  let res = await client.httpPUT(fmt"/user/tokens/{tokenId}/value", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamResponseSingleValue)
  else:
    raise newException(CloudflareClientError, body)
