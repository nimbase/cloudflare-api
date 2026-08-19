# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdSettingsGoogleTagGatewayConfig*(client: CloudflareClient,
                                                   zoneId: types.GoogleTagGatewayIdentifier): Future[JsonNode] {.async.} =
  ## Gets the Google Tag Gateway configuration for a zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/google-tag-gateway/config")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdSettingsGoogleTagGatewayConfig*(client: CloudflareClient,
                                                   zoneId: types.GoogleTagGatewayIdentifier,
                                                   body: types.GoogleTagGatewayGoogleTagGatewayConfig): Future[JsonNode] {.async.} =
  ## Updates the Google Tag Gateway configuration for a zone.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/settings/google-tag-gateway/config", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
