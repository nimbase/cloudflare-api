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
  ## Disable Content Scanning for a zone. The `cf.waf.content_scan.*` fields are no
  ## longer populated, so rules that reference them stop matching.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/content-upload-scan/disable")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleApiResponseCommon2)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdContentUploadScanEnable*(client: CloudflareClient,
                                             zoneId: types.WafProductApiBundleIdentifier): Future[types.WafProductApiBundleApiResponseCommon2] {.async.} =
  ## Enable Content Scanning for a zone, so that Cloudflare inspects content objects
  ## uploaded to the zone and checks them for malware. Scan results populate the
  ## `cf.waf.content_scan.*` fields, which you can reference in custom rules and rate
  ## limiting rules.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/content-upload-scan/enable")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleApiResponseCommon2)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdContentUploadScanPayloads*(client: CloudflareClient,
                                              zoneId: types.WafProductApiBundleIdentifier): Future[types.WafProductApiBundleResponseCustomScanCollection] {.async.} =
  ## List the Content Scanning custom expressions configured for the zone, each with
  ## its own identifier. A custom expression tells the scanner how to reach content
  ## objects in a request it cannot parse on its own, such as files Base64-encoded
  ## inside a JSON body.

  let res = await client.httpGET(fmt"/zones/{zoneId}/content-upload-scan/payloads")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleResponseCustomScanCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdContentUploadScanPayloads*(client: CloudflareClient,
                                               zoneId: types.WafProductApiBundleIdentifier): Future[types.WafProductApiBundleResponseCustomScanCollection] {.async.} =
  ## Create one or more Content Scanning custom expressions, appending them to the
  ## existing list of the zone, and return the updated list. Each expression reaches
  ## content objects the scanner cannot find automatically, for example
  ## `lookup_json_string(http.request.body.raw, "file")`.

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
  ## Delete the Content Scanning custom expression with the given identifier and
  ## return the expressions that remain. Content objects reached only by the deleted
  ## expression are no longer scanned.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/content-upload-scan/payloads/{expressionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleResponseCustomScanCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdContentUploadScanSettings*(client: CloudflareClient,
                                              zoneId: types.WafProductApiBundleIdentifier): Future[types.WafProductApiBundleResponseStatus2] {.async.} =
  ## Get the current Content Scanning status for the zone, together with the date the
  ## status was last modified.

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
  ## Update the Content Scanning status by setting the status value to `enabled` or
  ## `disabled`. This is equivalent to calling the dedicated enable and disable
  ## endpoints.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/content-upload-scan/settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleResponseStatus2)
  else:
    raise newException(CloudflareClientError, body)
