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
  PutZonesZoneIdentifierCustomPagesIdentifierRequest = object
    state: types.CustomPagesState
    url: types.CustomPagesUrl

proc getZonesZoneIdentifierCustomPages*(client: CloudflareClient,
                                        zoneIdentifier: types.CustomPagesIdentifier): Future[types.CustomPagesCustomPageResultList] {.async.} =
  ## Fetches all the custom pages at the zone level.

  let res = await client.httpGET(fmt"/zones/{zoneIdentifier}/custom_pages")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomPageResultList)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdentifierCustomPagesPreviewTokens*(client: CloudflareClient,
                                                      zoneIdentifier: types.CustomPagesIdentifier,
                                                      body: types.CustomPagesPreviewRequest): Future[types.CustomPagesPreviewTokenResult] {.async.} =
  ## Creates a signed JWT token used to preview custom pages before they are
  ## published. The API gateway rewrites zone-scoped requests to the account-level
  ## service endpoint.

  let res = await client.httpPOST(fmt"/zones/{zoneIdentifier}/custom_pages/preview_tokens", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesPreviewTokenResult)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdentifierCustomPagesIdentifier*(client: CloudflareClient,
                                                  identifier: types.CustomPagesErrorPageType,
                                                  zoneIdentifier: types.CustomPagesIdentifier): Future[types.CustomPagesCustomPage] {.async.} =
  ## Fetches the details of a custom page.

  let res = await client.httpGET(fmt"/zones/{zoneIdentifier}/custom_pages/{identifier}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomPage)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdentifierCustomPagesIdentifier*(client: CloudflareClient,
                                                  identifier: types.CustomPagesErrorPageType,
                                                  zoneIdentifier: types.CustomPagesIdentifier,
                                                  body: PutZonesZoneIdentifierCustomPagesIdentifierRequest): Future[types.CustomPagesCustomPageResult] {.async.} =
  ## Updates the configuration of an existing custom page.

  let res = await client.httpPUT(fmt"/zones/{zoneIdentifier}/custom_pages/{identifier}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomPageResult)
  else:
    raise newException(CloudflareClientError, body)
