# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdPrecursor*(client: CloudflareClient,
                              zoneId: types.PrecursorIdentifier): Future[types.PrecursorPrecursorConfigResponseBody] {.async.} =
  ## Retrieve a zone's Precursor configuration: the detection `mode`,
  ## whether to `show_interstitial`, and the ordered list of `rules`.

  let res = await client.httpGET(fmt"/zones/{zoneId}/precursor")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PrecursorPrecursorConfigResponseBody)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdPrecursor*(client: CloudflareClient,
                              zoneId: types.PrecursorIdentifier,
                              body: types.PrecursorPrecursorConfig): Future[types.PrecursorPrecursorConfigResponseBody] {.async.} =
  ## Updates the Precursor configuration for a zone.
  ##
  ## `mode` controls whether Precursor detection is off, monitoring, or
  ## armed. `show_interstitial` controls the zone-level response when armed.
  ## `rules` is the ordered list of overrides for matching requests.
  ##
  ## This is a partial update: only the fields present in the request body
  ## are changed.
  ##
  ## - Sending an empty array (`[]`) clears all rules.
  ## - At least one of `mode`, `show_interstitial`, or `rules` must be
  ## present; an empty body (`{}`) is rejected with `400`.
  ## - Rule `id` is read-only (assigned by Cloudflare) and ignored on input.
  ## - Rule `show_interstitial` is required and controls the response for
  ## requests that match that rule.
  ## - Rule `expression` is limited to 4000 characters. The limit applies to
  ## each rule individually, not to the combined size of all rules.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/precursor", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PrecursorPrecursorConfigResponseBody)
  else:
    raise newException(CloudflareClientError, body)
