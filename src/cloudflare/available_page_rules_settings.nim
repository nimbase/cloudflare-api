# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdPagerulesSettings*(client: CloudflareClient,
                                      zoneId: types.ZonesIdentifier2): Future[JsonNode] {.async.} =
  ## Returns a list of settings (and their details) that Page Rules can apply to
  ## matching requests.

  let res = await client.httpGET(fmt"/zones/{zoneId}/pagerules/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
