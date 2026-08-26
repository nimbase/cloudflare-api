# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import ./private/metaclient
import ./private/types


proc getZonesZoneIdApiGatewayConfiguration*(client: CloudflareClient): Future[types.ApiShieldConfigurationSingleResponse] {.async.} =
  ## Returns the authentication identifier characteristics configured for the zone.
  ## Header, cookie, or JWT claim values identify distinct API sessions.

  let res = await client.httpGET("/zones/{zone_id}/api_gateway/configuration")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ApiShieldConfigurationSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdApiGatewayConfiguration*(client: CloudflareClient,
                                            body: types.ApiShieldConfiguration): Future[types.ApiShieldConfigurationSingleResponse] {.async.} =
  ## Replaces the zone's authentication identifier characteristics used to identify
  ## distinct API sessions.

  let res = await client.httpPUT("/zones/{zone_id}/api_gateway/configuration", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ApiShieldConfigurationSingleResponse)
  else:
    raise newException(CloudflareClientError, body)
