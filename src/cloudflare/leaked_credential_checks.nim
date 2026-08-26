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
  ## Get the current Leaked Credential Checks status for the zone. While enabled,
  ## Cloudflare scans incoming requests for usernames and passwords that were exposed
  ## in known data breaches.

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
  ## Update the Leaked Credential Checks status for the zone, enabling or disabling
  ## the detection. While enabled, the detection populates the
  ## `cf.waf.credential_check.*` fields, which you can reference in custom rules and
  ## rate limiting rules to challenge or block requests carrying compromised
  ## credentials.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/leaked-credential-checks", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleResponseStatus)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdLeakedCredentialChecksDetections*(client: CloudflareClient,
                                                     zoneId: types.WafProductApiBundleIdentifier): Future[types.WafProductApiBundleResponseCustomDetectionCollection] {.async.} =
  ## List the user-defined detection locations configured for Leaked Credential
  ## Checks, each with its own identifier. A custom detection location tells the WAF
  ## where to find the username and password in requests to your application.

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
  ## Create a detection location for credentials that the default scan locations do
  ## not cover, using Rules language expressions such as
  ## `lookup_json_string(http.request.body.raw, "user")`. Only the username
  ## expression is required, and Leaked Credential Checks must be enabled on the
  ## zone.

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
  ## Get the username and password expressions of a single user-defined detection
  ## location, identified by its detection ID.

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
  ## Update the username and password expressions of an existing detection location,
  ## identified by its detection ID. Both expressions are overwritten, so omitting
  ## the password expression clears it.

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
  ## Delete a user-defined detection location, identified by its detection ID.
  ## Incoming requests are then scanned using only the default scan locations and the
  ## detection locations that remain.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/leaked-credential-checks/detections/{detectionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)
