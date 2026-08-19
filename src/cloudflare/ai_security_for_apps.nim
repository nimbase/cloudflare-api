# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdAiSecurityCustomTopics*(client: CloudflareClient,
                                           zoneId: types.WafProductApiBundleZoneId): Future[types.WafProductApiBundleResponseCustomTopics] {.async.} =
  ## Get the AI Security for Apps custom topic categories for a zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/ai-security/custom-topics")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleResponseCustomTopics)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdAiSecurityCustomTopics*(client: CloudflareClient,
                                           zoneId: types.WafProductApiBundleZoneId,
                                           body: types.WafProductApiBundleCustomTopics): Future[types.WafProductApiBundleResponseCustomTopics] {.async.} =
  ## Set the AI Security for Apps custom topic categories for a zone.
  ##
  ## A maximum of 20 custom topics can be configured per zone.
  ## Each topic label must be 2–20 characters using only lowercase letters (a–z),
  ## digits (0–9), and hyphens.
  ## Each topic description must be 2–50 printable ASCII characters.
  ##
  ## Changes can take up to a minute to propagate to the zone.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/ai-security/custom-topics", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleResponseCustomTopics)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdAiSecuritySettings*(client: CloudflareClient,
                                       zoneId: types.WafProductApiBundleZoneId): Future[types.WafProductApiBundleResponseSettings] {.async.} =
  ## Get whether AI Security for Apps is enabled or disabled for a zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/ai-security/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleResponseSettings)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdAiSecuritySettings*(client: CloudflareClient,
                                       zoneId: types.WafProductApiBundleZoneId,
                                       body: types.WafProductApiBundleSettings): Future[types.WafProductApiBundleResponseSettings] {.async.} =
  ## Enable or disable AI Security for Apps for a zone.
  ##
  ## Changes can take up to a minute to propagate to the zone.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/ai-security/settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleResponseSettings)
  else:
    raise newException(CloudflareClientError, body)
