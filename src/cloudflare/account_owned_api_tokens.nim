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
  AccountOwnedApiTokenDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdTokens*(client: CloudflareClient,
                                 accountId: types.IamAccountIdentifier,
                                 page: float64 = default(float64),
                                 perPage: float64 = default(float64),
                                 direction: AccountOwnedApiTokenDirectionOption,
                                 includeExpired: bool = false): Future[types.IamCollectionTokensResponse] {.async.} =
  ## List all Account Owned API tokens created for this account. Results include
  ## active, disabled, and recently-expired tokens when include_expired is set to
  ## true.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["direction"] = $direction
  q["include_expired"] = $includeExpired
  let res = await client.httpGET(fmt"/accounts/{accountId}/tokens", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamCollectionTokensResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdTokens*(client: CloudflareClient,
                                  accountId: types.IamAccountIdentifier,
                                  body: types.IamCreatePayload): Future[types.IamSingleTokenCreateResponse] {.async.} =
  ## Create a new Account Owned API token.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/tokens", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSingleTokenCreateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdTokensPermissionGroups*(client: CloudflareClient,
                                                 accountId: types.IamAccountIdentifier,
                                                 name: string = default(string),
                                                 scope: string = default(string)): Future[types.IamPermissionsGroupResponseCollection] {.async.} =
  ## Find all available permission groups for Account Owned API Tokens

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  q["scope"] = $scope
  let res = await client.httpGET(fmt"/accounts/{accountId}/tokens/permission_groups", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamPermissionsGroupResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdTokensVerify*(client: CloudflareClient,
                                       accountId: types.IamAccountIdentifier): Future[types.IamTokenVerifyResponseSingleSegment] {.async.} =
  ## Test whether a token works.

  let res = await client.httpGET(fmt"/accounts/{accountId}/tokens/verify")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamTokenVerifyResponseSingleSegment)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdTokensTokenId*(client: CloudflareClient,
                                        accountId: types.IamAccountIdentifier,
                                        tokenId: types.IamTokenIdentifier): Future[types.IamSingleTokenResponse] {.async.} =
  ## Get information about a specific Account Owned API token.

  let res = await client.httpGET(fmt"/accounts/{accountId}/tokens/{tokenId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSingleTokenResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdTokensTokenId*(client: CloudflareClient,
                                        accountId: types.IamAccountIdentifier,
                                        tokenId: types.IamTokenIdentifier,
                                        body: types.IamTokenBody): Future[types.IamSingleTokenResponse] {.async.} =
  ## Update an existing token.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/tokens/{tokenId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSingleTokenResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdTokensTokenId*(client: CloudflareClient,
                                           accountId: types.IamAccountIdentifier,
                                           tokenId: types.IamTokenIdentifier): Future[types.IamApiResponseSingleId] {.async.} =
  ## Destroy an Account Owned API token.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/tokens/{tokenId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamApiResponseSingleId)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdTokensTokenIdValue*(client: CloudflareClient,
                                             accountId: types.IamAccountIdentifier,
                                             tokenId: types.IamTokenIdentifier): Future[types.IamResponseSingleValue] {.async.} =
  ## Roll the Account Owned API token secret.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/tokens/{tokenId}/value", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamResponseSingleValue)
  else:
    raise newException(CloudflareClientError, body)
