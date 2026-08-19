# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdWorkersRoutes*(client: CloudflareClient,
                                  zoneId: types.WorkersIdentifier): Future[JsonNode] {.async.} =
  ## Returns routes for a zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/workers/routes")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdWorkersRoutes*(client: CloudflareClient,
                                   zoneId: types.WorkersIdentifier,
                                   body: types.WorkersRoute): Future[JsonNode] {.async.} =
  ## Creates a route that maps a URL pattern to a Worker.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/workers/routes", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdWorkersRoutesRouteId*(client: CloudflareClient,
                                         routeId: types.WorkersIdentifier,
                                         zoneId: types.WorkersIdentifier): Future[JsonNode] {.async.} =
  ## Returns information about a route, including URL pattern and Worker.

  let res = await client.httpGET(fmt"/zones/{zoneId}/workers/routes/{routeId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdWorkersRoutesRouteId*(client: CloudflareClient,
                                         routeId: types.WorkersIdentifier,
                                         zoneId: types.WorkersIdentifier,
                                         body: types.WorkersRoute): Future[JsonNode] {.async.} =
  ## Updates the URL pattern or Worker associated with a route.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/workers/routes/{routeId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdWorkersRoutesRouteId*(client: CloudflareClient,
                                            routeId: types.WorkersIdentifier,
                                            zoneId: types.WorkersIdentifier): Future[JsonNode] {.async.} =
  ## Deletes a route.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/workers/routes/{routeId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
