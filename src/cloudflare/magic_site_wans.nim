# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdMagicSitesSiteIdWans*(client: CloudflareClient,
                                               accountId: types.MagicIdentifier,
                                               siteId: types.MagicIdentifier): Future[types.MagicWansCollectionResponse] {.async.} =
  ## Lists Site WANs associated with an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/sites/{siteId}/wans")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicWansCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicSitesSiteIdWans*(client: CloudflareClient,
                                                accountId: types.MagicIdentifier,
                                                siteId: types.MagicIdentifier,
                                                body: types.MagicWansAddSingleRequest): Future[types.MagicWansCollectionResponse] {.async.} =
  ## Creates a new Site WAN.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/sites/{siteId}/wans", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicWansCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicSitesSiteIdWansWanId*(client: CloudflareClient,
                                                    siteId: types.MagicIdentifier,
                                                    accountId: types.MagicIdentifier,
                                                    wanId: types.MagicIdentifier): Future[types.MagicWanSingleResponse] {.async.} =
  ## Get a specific Site WAN.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/sites/{siteId}/wans/{wanId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicWanSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMagicSitesSiteIdWansWanId*(client: CloudflareClient,
                                                    siteId: types.MagicIdentifier,
                                                    accountId: types.MagicIdentifier,
                                                    wanId: types.MagicIdentifier,
                                                    body: types.MagicWanUpdateRequest): Future[types.MagicWanModifiedResponse] {.async.} =
  ## Update a specific Site WAN.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/magic/sites/{siteId}/wans/{wanId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicWanModifiedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicSitesSiteIdWansWanId*(client: CloudflareClient,
                                                       siteId: types.MagicIdentifier,
                                                       accountId: types.MagicIdentifier,
                                                       wanId: types.MagicIdentifier): Future[types.MagicWanDeletedResponse] {.async.} =
  ## Remove a specific Site WAN.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/sites/{siteId}/wans/{wanId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicWanDeletedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicSitesSiteIdWansWanId*(client: CloudflareClient,
                                                      siteId: types.MagicIdentifier,
                                                      accountId: types.MagicIdentifier,
                                                      wanId: types.MagicIdentifier,
                                                      body: types.MagicWanUpdateRequest): Future[types.MagicWanModifiedResponse] {.async.} =
  ## Patch a specific Site WAN.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/sites/{siteId}/wans/{wanId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicWanModifiedResponse)
  else:
    raise newException(CloudflareClientError, body)
