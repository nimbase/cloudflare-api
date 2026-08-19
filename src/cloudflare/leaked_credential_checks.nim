# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdLeakedCredentialChecks*(client: CloudflareClient,
                                           zoneId: types.WafProductApiBundleIdentifier): Future[types.WafProductApiBundleResponseStatus] {.async.} =
  ## Retrieves the current status of Leaked Credential Checks.

  let res = await client.httpGET(fmt"/zones/{zoneId}/leaked-credential-checks")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleResponseStatus)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdLeakedCredentialChecks*(client: CloudflareClient,
                                            zoneId: types.WafProductApiBundleIdentifier,
                                            body: types.WafProductApiBundleStatus): Future[types.WafProductApiBundleResponseStatus] {.async.} =
  ## Updates the current status of Leaked Credential Checks.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/leaked-credential-checks", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleResponseStatus)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdLeakedCredentialChecksDetections*(client: CloudflareClient,
                                                     zoneId: types.WafProductApiBundleIdentifier): Future[types.WafProductApiBundleResponseCustomDetectionCollection] {.async.} =
  ## List user-defined detection patterns for Leaked Credential Checks.

  let res = await client.httpGET(fmt"/zones/{zoneId}/leaked-credential-checks/detections")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleResponseCustomDetectionCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdLeakedCredentialChecksDetections*(client: CloudflareClient,
                                                      zoneId: types.WafProductApiBundleIdentifier,
                                                      body: types.WafProductApiBundleCustomDetection): Future[types.WafProductApiBundleResponseCustomDetection] {.async.} =
  ## Create user-defined detection pattern for Leaked Credential Checks.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/leaked-credential-checks/detections", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleResponseCustomDetection)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdLeakedCredentialChecksDetectionsDetectionId*(client: CloudflareClient,
                                                                zoneId: types.WafProductApiBundleIdentifier,
                                                                detectionId: types.WafProductApiBundleDetectionId): Future[types.WafProductApiBundleResponseCustomDetection] {.async.} =
  ## Get user-defined detection pattern for Leaked Credential Checks.

  let res = await client.httpGET(fmt"/zones/{zoneId}/leaked-credential-checks/detections/{detectionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleResponseCustomDetection)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdLeakedCredentialChecksDetectionsDetectionId*(client: CloudflareClient,
                                                                zoneId: types.WafProductApiBundleIdentifier,
                                                                detectionId: types.WafProductApiBundleDetectionId,
                                                                body: types.WafProductApiBundleCustomDetection): Future[types.WafProductApiBundleResponseCustomDetection] {.async.} =
  ## Update user-defined detection pattern for Leaked Credential Checks.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/leaked-credential-checks/detections/{detectionId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleResponseCustomDetection)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdLeakedCredentialChecksDetectionsDetectionId*(client: CloudflareClient,
                                                                   zoneId: types.WafProductApiBundleIdentifier,
                                                                   detectionId: types.WafProductApiBundleDetectionId): Future[types.WafProductApiBundleApiResponseCommon] {.async.} =
  ## Remove user-defined detection pattern for Leaked Credential Checks.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/leaked-credential-checks/detections/{detectionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)
