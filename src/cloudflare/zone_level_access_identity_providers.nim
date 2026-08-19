# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdAccessIdentityProviders*(client: CloudflareClient,
                                            zoneId: types.AccessIdentifier): Future[types.AccessResponseCollection17] {.async.} =
  ## Lists all configured identity providers.

  let res = await client.httpGET(fmt"/zones/{zoneId}/access/identity_providers")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection17)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdAccessIdentityProviders*(client: CloudflareClient,
                                             zoneId: types.AccessIdentifier,
                                             body: types.AccessIdentityProviders2): Future[types.AccessSingleResponse16] {.async.} =
  ## Adds a new identity provider to Access.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/access/identity_providers", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AccessSingleResponse16)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdAccessIdentityProvidersIdentityProviderId*(client: CloudflareClient,
                                                              identityProviderId: types.AccessUuid,
                                                              zoneId: types.AccessIdentifier): Future[types.AccessSingleResponse16] {.async.} =
  ## Fetches a configured identity provider.

  let res = await client.httpGET(fmt"/zones/{zoneId}/access/identity_providers/{identityProviderId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse16)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdAccessIdentityProvidersIdentityProviderId*(client: CloudflareClient,
                                                              identityProviderId: types.AccessUuid,
                                                              zoneId: types.AccessIdentifier,
                                                              body: types.AccessIdentityProviders2): Future[types.AccessSingleResponse16] {.async.} =
  ## Updates a configured identity provider.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/access/identity_providers/{identityProviderId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse16)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdAccessIdentityProvidersIdentityProviderId*(client: CloudflareClient,
                                                                 identityProviderId: types.AccessUuid,
                                                                 zoneId: types.AccessIdentifier): Future[types.AccessIdResponse] {.async.} =
  ## Deletes an identity provider from Access.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/access/identity_providers/{identityProviderId}")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.AccessIdResponse)
  else:
    raise newException(CloudflareClientError, body)
