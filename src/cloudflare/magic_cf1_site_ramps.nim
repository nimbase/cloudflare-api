# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdMagicCf1SitesCf1SiteIdRamps*(client: CloudflareClient,
                                                      accountId: types.MagicIdentifier,
                                                      cf1SiteId: types.MagicIdentifier): Future[types.MagicCf1SiteRampsCollectionResponse] {.async.} =
  ## Lists ramps (network connections) associated with a CF1 Site. Ramps represent
  ## GRE tunnels, IPsec tunnels, interconnects, or MCONN links.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/cf1_sites/{cf1SiteId}/ramps")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicCf1SiteRampsCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicCf1SitesCf1SiteIdRamps*(client: CloudflareClient,
                                                       accountId: types.MagicIdentifier,
                                                       cf1SiteId: types.MagicIdentifier): Future[types.MagicCf1SiteRampsCollectionResponse] {.async.} =
  ## Creates ramps (network connections) for a CF1 Site.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/cf1_sites/{cf1SiteId}/ramps", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicCf1SiteRampsCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicCf1SitesCf1SiteIdRampsRampId*(client: CloudflareClient,
                                                            accountId: types.MagicIdentifier,
                                                            cf1SiteId: types.MagicIdentifier,
                                                            rampId: types.MagicIdentifier): Future[types.MagicCf1SiteRampSingleResponse] {.async.} =
  ## Gets a specific ramp for a CF1 Site.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/cf1_sites/{cf1SiteId}/ramps/{rampId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicCf1SiteRampSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicCf1SitesCf1SiteIdRampsRampId*(client: CloudflareClient,
                                                               accountId: types.MagicIdentifier,
                                                               cf1SiteId: types.MagicIdentifier,
                                                               rampId: types.MagicIdentifier): Future[types.MagicCf1SiteRampSingleResponse] {.async.} =
  ## Deletes a specific ramp from a CF1 Site.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/cf1_sites/{cf1SiteId}/ramps/{rampId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicCf1SiteRampSingleResponse)
  else:
    raise newException(CloudflareClientError, body)
