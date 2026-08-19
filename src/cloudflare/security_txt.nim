# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdSecurityCenterSecuritytxt*(client: CloudflareClient,
                                              zoneId: types.SecurityCenterIdentifier): Future[JsonNode] {.async.} =
  ## Retrieves the current security.txt file configuration for a zone, used for
  ## security vulnerability reporting.

  let res = await client.httpGET(fmt"/zones/{zoneId}/security-center/securitytxt")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdSecurityCenterSecuritytxt*(client: CloudflareClient,
                                              zoneId: types.SecurityCenterIdentifier,
                                              body: types.SecurityCenterSecurityTxt): Future[JsonNode] {.async.} =
  ## Updates the security.txt file configuration for a zone, which provides security
  ## researchers with vulnerability reporting information.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/security-center/securitytxt", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdSecurityCenterSecuritytxt*(client: CloudflareClient,
                                                 zoneId: types.SecurityCenterIdentifier): Future[JsonNode] {.async.} =
  ## Removes the security.txt file configuration for a zone. The
  ## /.well-known/security.txt endpoint will no longer be served.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/security-center/securitytxt")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
