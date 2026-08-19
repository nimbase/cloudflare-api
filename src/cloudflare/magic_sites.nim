# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdMagicSites*(client: CloudflareClient,
                                     accountId: types.MagicIdentifier,
                                     connectorid: types.MagicIdentifier = default(types.MagicIdentifier)): Future[types.MagicSitesCollectionResponse] {.async.} =
  ## Lists Sites associated with an account. Use connectorid query param to return
  ## sites where connectorid matches either site.ConnectorID or
  ## site.SecondaryConnectorID.

  var q = initOrderedTable[string, string]()
  q["connectorid"] = $connectorid
  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/sites", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicSitesCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicSites*(client: CloudflareClient,
                                      accountId: types.MagicIdentifier,
                                      body: types.MagicSitesAddSingleRequest): Future[types.MagicSiteSingleResponse] {.async.} =
  ## Creates a new Site

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/sites", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicSiteSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicSitesSiteId*(client: CloudflareClient,
                                           siteId: types.MagicIdentifier,
                                           accountId: types.MagicIdentifier): Future[types.MagicSiteSingleResponse] {.async.} =
  ## Get a specific Site.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/sites/{siteId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicSiteSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMagicSitesSiteId*(client: CloudflareClient,
                                           siteId: types.MagicIdentifier,
                                           accountId: types.MagicIdentifier,
                                           body: types.MagicSiteUpdateRequest): Future[types.MagicSiteModifiedResponse] {.async.} =
  ## Update a specific Site.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/magic/sites/{siteId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicSiteModifiedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicSitesSiteId*(client: CloudflareClient,
                                              siteId: types.MagicIdentifier,
                                              accountId: types.MagicIdentifier): Future[types.MagicSiteDeletedResponse] {.async.} =
  ## Remove a specific Site.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/sites/{siteId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicSiteDeletedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicSitesSiteId*(client: CloudflareClient,
                                             siteId: types.MagicIdentifier,
                                             accountId: types.MagicIdentifier,
                                             body: types.MagicSiteUpdateRequest): Future[types.MagicSiteModifiedResponse] {.async.} =
  ## Patch a specific Site.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/sites/{siteId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicSiteModifiedResponse)
  else:
    raise newException(CloudflareClientError, body)
