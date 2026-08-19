# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types

type
  PutZonesZoneIdCustomHostnamesFallbackOriginRequest = object
    origin: types.TlsCertificatesAndHostnamesOrigin

proc getZonesZoneIdCustomHostnamesFallbackOrigin*(client: CloudflareClient,
                                                  zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesFallbackOriginResponse] {.async.} =
  ## Retrieves the current fallback origin configuration for custom hostnames on a
  ## zone. The fallback origin handles traffic when specific custom hostname origins
  ## are unavailable.

  let res = await client.httpGET(fmt"/zones/{zoneId}/custom_hostnames/fallback_origin")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesFallbackOriginResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdCustomHostnamesFallbackOrigin*(client: CloudflareClient,
                                                  zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                                  body: PutZonesZoneIdCustomHostnamesFallbackOriginRequest): Future[types.TlsCertificatesAndHostnamesFallbackOriginResponse] {.async.} =
  ## Updates the fallback origin configuration for custom hostnames on a zone. Sets
  ## the default origin server for custom hostname traffic.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/custom_hostnames/fallback_origin", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesFallbackOriginResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdCustomHostnamesFallbackOrigin*(client: CloudflareClient,
                                                     zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesFallbackOriginResponse] {.async.} =
  ## Removes the fallback origin configuration for custom hostnames on a zone. Custom
  ## hostnames without specific origins will no longer have a fallback.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/custom_hostnames/fallback_origin")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesFallbackOriginResponse)
  else:
    raise newException(CloudflareClientError, body)
