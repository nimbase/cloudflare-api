# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdSettingsOhttpGateway*(client: CloudflareClient,
                                         zoneId: types.OhttpGatewayIdentifier): Future[types.OhttpGatewayGetApiSuccessResponse] {.async.} =
  ## Returns the state of Oblivious HTTP enablement for the zone. Requires product
  ## subscription to call.

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/ohttp-gateway")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.OhttpGatewayGetApiSuccessResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdSettingsOhttpGateway*(client: CloudflareClient,
                                         zoneId: types.OhttpGatewayIdentifier): Future[types.OhttpGatewayCreateApiSuccessResponse] {.async.} =
  ## Idempotently enables OHTTP Gateway for the zone. Requires product subscription
  ## to call.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/settings/ohttp-gateway")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.OhttpGatewayCreateApiSuccessResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdSettingsOhttpGateway*(client: CloudflareClient,
                                            zoneId: types.OhttpGatewayIdentifier): Future[types.OhttpGatewayDeleteApiSuccessResponse] {.async.} =
  ## Idempotently disables Oblivious HTTP Gateway for the zone. Requires product
  ## subscription to call.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/settings/ohttp-gateway")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.OhttpGatewayDeleteApiSuccessResponse)
  else:
    raise newException(CloudflareClientError, body)
