# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdAccessAppsCa*(client: CloudflareClient,
                                 zoneId: types.AccessIdentifier): Future[types.AccessResponseCollection20] {.async.} =
  ## Lists short-lived certificate CAs and their public keys.

  let res = await client.httpGET(fmt"/zones/{zoneId}/access/apps/ca")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection20)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdAccessAppsAppIdCa*(client: CloudflareClient,
                                      appId: types.AccessUuid,
                                      zoneId: types.AccessIdentifier): Future[types.AccessSingleResponse19] {.async.} =
  ## Fetches a short-lived certificate CA and its public key.

  let res = await client.httpGET(fmt"/zones/{zoneId}/access/apps/{appId}/ca")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse19)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdAccessAppsAppIdCa*(client: CloudflareClient,
                                       appId: types.AccessUuid,
                                       zoneId: types.AccessIdentifier): Future[types.AccessSingleResponse19] {.async.} =
  ## Generates a new short-lived certificate CA and public key.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/access/apps/{appId}/ca")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse19)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdAccessAppsAppIdCa*(client: CloudflareClient,
                                         appId: types.AccessUuid,
                                         zoneId: types.AccessIdentifier): Future[types.AccessIdResponse5] {.async.} =
  ## Deletes a short-lived certificate CA.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/access/apps/{appId}/ca")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.AccessIdResponse5)
  else:
    raise newException(CloudflareClientError, body)
