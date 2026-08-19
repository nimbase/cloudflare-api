# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdMagicApps*(client: CloudflareClient,
                                    accountId: types.MagicIdentifier): Future[types.MagicAppsCollectionResponse] {.async.} =
  ## Lists Apps associated with an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/apps")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicAppsCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicApps*(client: CloudflareClient,
                                     accountId: types.MagicIdentifier,
                                     body: types.MagicAppAddSingleRequest): Future[types.MagicAppSingleResponse] {.async.} =
  ## Creates a new App for an account

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/apps", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.MagicAppSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMagicAppsAccountAppId*(client: CloudflareClient,
                                                accountId: types.MagicIdentifier,
                                                accountAppId: types.MagicIdentifier,
                                                body: types.MagicAppUpdateRequest): Future[types.MagicAppSingleResponse] {.async.} =
  ## Updates an Account App

  let res = await client.httpPUT(fmt"/accounts/{accountId}/magic/apps/{accountAppId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicAppSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAppsAccountAppId*(client: CloudflareClient,
                                                   accountId: types.MagicIdentifier,
                                                   accountAppId: types.MagicIdentifier): Future[types.MagicAppSingleResponse] {.async.} =
  ## Deletes specific Account App.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/apps/{accountAppId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicAppSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicAppsAccountAppId*(client: CloudflareClient,
                                                  accountId: types.MagicIdentifier,
                                                  accountAppId: types.MagicIdentifier,
                                                  body: types.MagicAppUpdateRequest): Future[types.MagicAppSingleResponse] {.async.} =
  ## Updates an Account App

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/apps/{accountAppId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicAppSingleResponse)
  else:
    raise newException(CloudflareClientError, body)
