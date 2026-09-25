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
  PutZonesZoneIdCustomPagesIdentifierRequest = object
    state: types.CustomPagesState
    url: types.CustomPagesUrl

proc getZonesZoneIdCustomPages*(client: CloudflareClient,
                                zoneId: types.CustomPagesIdentifier): Future[types.CustomPagesCustomPageResultList] {.async.} =
  ## Lists all custom page configurations for a zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/custom_pages")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomPageResultList)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdCustomPagesPreviewTokens*(client: CloudflareClient,
                                              zoneId: types.CustomPagesIdentifier,
                                              body: types.CustomPagesPreviewRequest): Future[types.CustomPagesPreviewTokenResult] {.async.} =
  ## Creates a signed JWT for previewing a zone-level custom page before it is
  ## published.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/custom_pages/preview_tokens", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesPreviewTokenResult)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdCustomPagesIdentifier*(client: CloudflareClient,
                                          identifier: types.CustomPagesErrorPageType,
                                          zoneId: types.CustomPagesIdentifier): Future[types.CustomPagesCustomPage] {.async.} =
  ## Returns the configuration for a custom page type at the zone level.

  let res = await client.httpGET(fmt"/zones/{zoneId}/custom_pages/{identifier}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomPage)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdCustomPagesIdentifier*(client: CloudflareClient,
                                          identifier: types.CustomPagesErrorPageType,
                                          zoneId: types.CustomPagesIdentifier,
                                          body: PutZonesZoneIdCustomPagesIdentifierRequest): Future[types.CustomPagesCustomPageResult] {.async.} =
  ## Updates the configuration for a custom page type at the zone level.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/custom_pages/{identifier}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomPageResult)
  else:
    raise newException(CloudflareClientError, body)
