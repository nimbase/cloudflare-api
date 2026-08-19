# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdUrlNormalization*(client: CloudflareClient,
                                     zoneId: types.RulesetsZoneId): Future[JsonNode] {.async.} =
  ## Fetches the current URL Normalization settings.

  let res = await client.httpGET(fmt"/zones/{zoneId}/url_normalization")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdUrlNormalization*(client: CloudflareClient,
                                     zoneId: types.RulesetsZoneId,
                                     body: types.RulesetsUrlNormalization): Future[JsonNode] {.async.} =
  ## Updates the URL Normalization settings.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/url_normalization", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdUrlNormalization*(client: CloudflareClient,
                                        zoneId: types.RulesetsZoneId): Future[AsyncResponse] {.async.} =
  ## Deletes the URL Normalization settings.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/url_normalization")
  return res
