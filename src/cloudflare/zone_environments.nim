# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import ./private/metaclient
import ./private/types


proc getZonesZoneIdEnvironments*(client: CloudflareClient): Future[types.KaminoEnvironmentsResponse] {.async.} =
  ## Lists configured environments for a zone.

  let res = await client.httpGET("/zones/{zone_id}/environments")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.KaminoEnvironmentsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdEnvironments*(client: CloudflareClient,
                                  body: types.KaminoEnvironmentsRequest): Future[types.KaminoEnvironmentsResponse] {.async.} =
  ## Creates environments for a zone.

  let res = await client.httpPOST("/zones/{zone_id}/environments", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.KaminoEnvironmentsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdEnvironments*(client: CloudflareClient,
                                 body: types.KaminoEnvironmentsRequest): Future[types.KaminoEnvironmentsResponse] {.async.} =
  ## Replaces the full environment configuration for a zone.

  let res = await client.httpPUT("/zones/{zone_id}/environments", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.KaminoEnvironmentsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdEnvironments*(client: CloudflareClient,
                                   body: types.KaminoEnvironmentsRequest): Future[types.KaminoEnvironmentsResponse] {.async.} =
  ## Applies partial updates to zone environments.

  let res = await client.httpPATCH("/zones/{zone_id}/environments", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.KaminoEnvironmentsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdEnvironmentsEnvironmentId*(client: CloudflareClient): Future[types.KaminoEnvironmentsResponse] {.async.} =
  ## Deletes a zone environment by reference identifier.

  let res = await client.httpDELETE("/zones/{zone_id}/environments/{environment_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.KaminoEnvironmentsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdEnvironmentsEnvironmentIdRollback*(client: CloudflareClient): Future[types.KaminoEnvironmentsResponse] {.async.} =
  ## Rolls a zone environment back to its previous version.

  let res = await client.httpPOST("/zones/{zone_id}/environments/{environment_id}/rollback")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.KaminoEnvironmentsResponse)
  else:
    raise newException(CloudflareClientError, body)
