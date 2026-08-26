# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdIntelSinkholes*(client: CloudflareClient,
                                         accountId: types.IntelSinkholesIdentifier): Future[types.IntelSinkholesSinkholeCollectionResponse] {.async.} =
  ## Lists sinkholes owned by the account for redirecting malicious traffic.

  let res = await client.httpGET(fmt"/accounts/{accountId}/intel/sinkholes")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IntelSinkholesSinkholeCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdIntelSinkholes*(client: CloudflareClient,
                                          accountId: types.IntelSinkholesIdentifier,
                                          body: types.IntelSinkholesSinkholeCreateParams): Future[types.IntelSinkholesSinkholeSingleResponse] {.async.} =
  ## Create a new sinkhole. Logs of large request bodies will be truncated, but the
  ## full request body can be recorded in R2. If you wish to record large request
  ## bodies in R2, include the R2 key ID, key secret, and bucket name in the request
  ## body.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/intel/sinkholes", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.IntelSinkholesSinkholeSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdIntelSinkholesSinkholeId*(client: CloudflareClient,
                                                   accountId: types.IntelSinkholesIdentifier,
                                                   sinkholeId: string): Future[types.IntelSinkholesSinkholeSingleResponse] {.async.} =
  ## Get the specified sinkhole by its unique identifier.

  let res = await client.httpGET(fmt"/accounts/{accountId}/intel/sinkholes/{sinkholeId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IntelSinkholesSinkholeSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdIntelSinkholesSinkholeId*(client: CloudflareClient,
                                                   accountId: types.IntelSinkholesIdentifier,
                                                   sinkholeId: string,
                                                   body: types.IntelSinkholesSinkholeCreateParams): Future[types.IntelSinkholesApiResponseSingleEmpty] {.async.} =
  ## Replaces the name or R2 configuration of the specified sinkhole. This is a full
  ## replacement. All fields, including r2_secret, must be re-supplied. Omitting
  ## r2_secret overwrites the stored value with an empty string.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/intel/sinkholes/{sinkholeId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IntelSinkholesApiResponseSingleEmpty)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdIntelSinkholesSinkholeId*(client: CloudflareClient,
                                                      accountId: types.IntelSinkholesIdentifier,
                                                      sinkholeId: string): Future[types.IntelSinkholesApiResponseSingleEmpty] {.async.} =
  ## Delete the specified sinkhole. The sinkhole must not have any active ingress
  ## rules defined. A 409 response code indicates that this condition is not met.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/intel/sinkholes/{sinkholeId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IntelSinkholesApiResponseSingleEmpty)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdIntelSinkholesSinkholeIdIngresses*(client: CloudflareClient,
                                                            accountId: types.IntelSinkholesIdentifier,
                                                            sinkholeId: string): Future[types.IntelSinkholesIngressCollectionResponse] {.async.} =
  ## Returns all ingress rules associated with the specified sinkhole.

  let res = await client.httpGET(fmt"/accounts/{accountId}/intel/sinkholes/{sinkholeId}/ingresses")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IntelSinkholesIngressCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdIntelSinkholesSinkholeIdIngresses*(client: CloudflareClient,
                                                       zoneId: types.IntelSinkholesIdentifier,
                                                       sinkholeId: string,
                                                       body: types.IntelSinkholesIngressCreateParams): Future[types.IntelSinkholesIngressSingleResponse] {.async.} =
  ## Create a new ingress rule for the specified sinkhole. The CIDR block must be a
  ## Cloudflare BYOIP associated with your account. The zone_id must be a zone with
  ## the ability to create Spectrum Apps. The sinkhole must belong to the same
  ## account as the zone.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/intel/sinkholes/{sinkholeId}/ingresses", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.IntelSinkholesIngressSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdIntelSinkholesSinkholeIdIngressesIngressId*(client: CloudflareClient,
                                                               zoneId: types.IntelSinkholesIdentifier,
                                                               sinkholeId: string,
                                                               ingressId: string): Future[types.IntelSinkholesIngressSingleResponse] {.async.} =
  ## Get the specified ingress rule associated with a sinkhole. The sinkhole must
  ## belong to the same account as the zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/intel/sinkholes/{sinkholeId}/ingresses/{ingressId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IntelSinkholesIngressSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdIntelSinkholesSinkholeIdIngressesIngressId*(client: CloudflareClient,
                                                               zoneId: types.IntelSinkholesIdentifier,
                                                               sinkholeId: string,
                                                               ingressId: string,
                                                               body: types.IntelSinkholesIngressCreateParams): Future[types.IntelSinkholesApiResponseSingleEmpty] {.async.} =
  ## Replaces the specified ingress rule. The sinkhole must belong to the same
  ## account as the zone.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/intel/sinkholes/{sinkholeId}/ingresses/{ingressId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IntelSinkholesApiResponseSingleEmpty)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdIntelSinkholesSinkholeIdIngressesIngressId*(client: CloudflareClient,
                                                                  zoneId: types.IntelSinkholesIdentifier,
                                                                  sinkholeId: string,
                                                                  ingressId: string): Future[types.IntelSinkholesApiResponseSingleEmpty] {.async.} =
  ## Delete the specified ingress rule. The sinkhole must belong to the same account
  ## as the zone.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/intel/sinkholes/{sinkholeId}/ingresses/{ingressId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IntelSinkholesApiResponseSingleEmpty)
  else:
    raise newException(CloudflareClientError, body)
