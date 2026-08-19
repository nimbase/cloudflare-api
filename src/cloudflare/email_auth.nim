# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdEmailAuthDmarcReports*(client: CloudflareClient,
                                          zoneId: types.EmailAuthIdentifier): Future[JsonNode] {.async.} =
  ## Retrieves the current DMARC report configuration and status for a zone.
  ## Returns the RUA prefix, enabled status, approved sources, and DNS records.

  let res = await client.httpGET(fmt"/zones/{zoneId}/email/auth/dmarc-reports")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdEmailAuthDmarcReports*(client: CloudflareClient,
                                            zoneId: types.EmailAuthIdentifier,
                                            body: types.EmailAuthConfigureDmarcReportsRequest): Future[JsonNode] {.async.} =
  ## Updates the DMARC report configuration for a zone.
  ## At least one of `enabled` or `skip_wizard` must be provided.
  ## When enabling, the handler will ensure the DMARC RUA record exists in DNS.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/email/auth/dmarc-reports", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdEmailAuthSpfInspect*(client: CloudflareClient,
                                        zoneId: types.EmailAuthIdentifier,
                                        id: string): Future[JsonNode] {.async.} =
  ## Inspects a specific SPF TXT record and returns a parsed tree structure
  ## in the spflimit-worker format.
  ##
  ## The record ID must be provided via the `id` query parameter.
  ##
  ## Returns a recursive tree showing:
  ## - Parsed components with their qualifiers and types
  ## - Nested includes recursively resolved within components
  ## - Per-component and total lookup counts
  ## - Detailed error information with context

  var q = initOrderedTable[string, string]()
  q["id"] = $id
  let res = await client.httpGET(fmt"/zones/{zoneId}/email/auth/spf/inspect", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
