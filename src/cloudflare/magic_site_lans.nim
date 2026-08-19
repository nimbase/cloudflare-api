# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdMagicSitesSiteIdLans*(client: CloudflareClient,
                                               accountId: types.MagicIdentifier,
                                               siteId: types.MagicIdentifier): Future[types.MagicLansCollectionResponse] {.async.} =
  ## Lists Site LANs associated with an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/sites/{siteId}/lans")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicLansCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicSitesSiteIdLans*(client: CloudflareClient,
                                                accountId: types.MagicIdentifier,
                                                siteId: types.MagicIdentifier,
                                                body: types.MagicLansAddSingleRequest): Future[types.MagicLansCollectionResponse] {.async.} =
  ## Creates a new Site LAN. If the site is in high availability mode,
  ## static_addressing is required along with secondary and virtual address.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/sites/{siteId}/lans", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicLansCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicSitesSiteIdLansLanId*(client: CloudflareClient,
                                                    siteId: types.MagicIdentifier,
                                                    accountId: types.MagicIdentifier,
                                                    lanId: types.MagicIdentifier): Future[types.MagicLanSingleResponse] {.async.} =
  ## Get a specific Site LAN.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/sites/{siteId}/lans/{lanId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicLanSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMagicSitesSiteIdLansLanId*(client: CloudflareClient,
                                                    siteId: types.MagicIdentifier,
                                                    accountId: types.MagicIdentifier,
                                                    lanId: types.MagicIdentifier,
                                                    body: types.MagicLanUpdateRequest): Future[types.MagicLanModifiedResponse] {.async.} =
  ## Update a specific Site LAN.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/magic/sites/{siteId}/lans/{lanId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicLanModifiedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicSitesSiteIdLansLanId*(client: CloudflareClient,
                                                       siteId: types.MagicIdentifier,
                                                       accountId: types.MagicIdentifier,
                                                       lanId: types.MagicIdentifier): Future[types.MagicLanDeletedResponse] {.async.} =
  ## Remove a specific Site LAN.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/sites/{siteId}/lans/{lanId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicLanDeletedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicSitesSiteIdLansLanId*(client: CloudflareClient,
                                                      siteId: types.MagicIdentifier,
                                                      accountId: types.MagicIdentifier,
                                                      lanId: types.MagicIdentifier,
                                                      body: types.MagicLanUpdateRequest): Future[types.MagicLanModifiedResponse] {.async.} =
  ## Patch a specific Site LAN.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/sites/{siteId}/lans/{lanId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicLanModifiedResponse)
  else:
    raise newException(CloudflareClientError, body)
