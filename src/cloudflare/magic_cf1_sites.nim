# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdMagicCf1Sites*(client: CloudflareClient,
                                        accountId: types.MagicIdentifier): Future[types.MagicCf1SitesCollectionResponse] {.async.} =
  ## Lists CF1 Sites associated with an account. A CF1 Site represents a physical
  ## customer network location with optional geographic coordinates.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/cf1_sites")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicCf1SitesCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicCf1Sites*(client: CloudflareClient,
                                         accountId: types.MagicIdentifier): Future[types.MagicCf1SitesCollectionResponse] {.async.} =
  ## Creates new CF1 Sites for an account. Each site must have a unique name within
  ## the account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/cf1_sites", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicCf1SitesCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicCf1SitesCf1SiteId*(client: CloudflareClient,
                                                 accountId: types.MagicIdentifier,
                                                 cf1SiteId: types.MagicIdentifier): Future[types.MagicCf1SiteSingleResponse] {.async.} =
  ## Gets a specific CF1 Site for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/cf1_sites/{cf1SiteId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicCf1SiteSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicCf1SitesCf1SiteId*(client: CloudflareClient,
                                                    accountId: types.MagicIdentifier,
                                                    cf1SiteId: types.MagicIdentifier): Future[types.MagicCf1SiteSingleResponse] {.async.} =
  ## Deletes a specific CF1 Site for an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/cf1_sites/{cf1SiteId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicCf1SiteSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicCf1SitesCf1SiteId*(client: CloudflareClient,
                                                   accountId: types.MagicIdentifier,
                                                   cf1SiteId: types.MagicIdentifier,
                                                   body: types.MagicCf1SiteUpdate): Future[types.MagicCf1SiteSingleResponse] {.async.} =
  ## Partially updates a specific CF1 Site for an account. Only the fields included
  ## in the request body are modified; omitted fields retain their existing values.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/cf1_sites/{cf1SiteId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicCf1SiteSingleResponse)
  else:
    raise newException(CloudflareClientError, body)
