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
  PutZonesZoneIdContentUploadScanSettingsRequest = object
    value: string

proc postZonesZoneIdContentUploadScanDisable*(client: CloudflareClient,
                                              zoneId: types.WafProductApiBundleIdentifier): Future[types.WafProductApiBundleApiResponseCommon2] {.async.} =
  ## Disable Content Scanning.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/content-upload-scan/disable")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleApiResponseCommon2)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdContentUploadScanEnable*(client: CloudflareClient,
                                             zoneId: types.WafProductApiBundleIdentifier): Future[types.WafProductApiBundleApiResponseCommon2] {.async.} =
  ## Enable Content Scanning.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/content-upload-scan/enable")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleApiResponseCommon2)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdContentUploadScanPayloads*(client: CloudflareClient,
                                              zoneId: types.WafProductApiBundleIdentifier): Future[types.WafProductApiBundleResponseCustomScanCollection] {.async.} =
  ## Get a list of existing custom scan expressions for Content Scanning.

  let res = await client.httpGET(fmt"/zones/{zoneId}/content-upload-scan/payloads")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleResponseCustomScanCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdContentUploadScanPayloads*(client: CloudflareClient,
                                               zoneId: types.WafProductApiBundleIdentifier): Future[types.WafProductApiBundleResponseCustomScanCollection] {.async.} =
  ## Add custom scan expressions for Content Scanning.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/content-upload-scan/payloads", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleResponseCustomScanCollection)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdContentUploadScanPayloadsExpressionId*(client: CloudflareClient,
                                                             zoneId: types.WafProductApiBundleIdentifier,
                                                             expressionId: types.WafProductApiBundleCustomScanId): Future[types.WafProductApiBundleResponseCustomScanCollection] {.async.} =
  ## Delete a Content Scan Custom Expression.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/content-upload-scan/payloads/{expressionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleResponseCustomScanCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdContentUploadScanSettings*(client: CloudflareClient,
                                              zoneId: types.WafProductApiBundleIdentifier): Future[types.WafProductApiBundleResponseStatus2] {.async.} =
  ## Retrieve the current status of Content Scanning.

  let res = await client.httpGET(fmt"/zones/{zoneId}/content-upload-scan/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleResponseStatus2)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdContentUploadScanSettings*(client: CloudflareClient,
                                              zoneId: types.WafProductApiBundleIdentifier,
                                              body: PutZonesZoneIdContentUploadScanSettingsRequest): Future[types.WafProductApiBundleResponseStatus2] {.async.} =
  ## Update the Content Scanning status.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/content-upload-scan/settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleResponseStatus2)
  else:
    raise newException(CloudflareClientError, body)
