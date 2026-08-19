# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdHealthchecks*(client: CloudflareClient,
                                 zoneId: types.HealthchecksIdentifier,
                                 page: float64 = default(float64),
                                 perPage: float64 = default(float64)): Future[types.HealthchecksResponseCollection] {.async.} =
  ## List configured health checks.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/zones/{zoneId}/healthchecks", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.HealthchecksResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdHealthchecks*(client: CloudflareClient,
                                  zoneId: types.HealthchecksIdentifier,
                                  body: types.HealthchecksQueryHealthcheck): Future[types.HealthchecksSingleResponse] {.async.} =
  ## Create a new health check.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/healthchecks", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.HealthchecksSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdHealthchecksPreview*(client: CloudflareClient,
                                         zoneId: types.HealthchecksIdentifier,
                                         body: types.HealthchecksQueryHealthcheck): Future[types.HealthchecksSingleResponse] {.async.} =
  ## Create a new preview health check.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/healthchecks/preview", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.HealthchecksSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdHealthchecksPreviewHealthcheckId*(client: CloudflareClient,
                                                     healthcheckId: types.HealthchecksIdentifier,
                                                     zoneId: types.HealthchecksIdentifier): Future[types.HealthchecksSingleResponse] {.async.} =
  ## Fetch a single configured health check preview.

  let res = await client.httpGET(fmt"/zones/{zoneId}/healthchecks/preview/{healthcheckId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.HealthchecksSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdHealthchecksPreviewHealthcheckId*(client: CloudflareClient,
                                                        healthcheckId: types.HealthchecksIdentifier,
                                                        zoneId: types.HealthchecksIdentifier): Future[types.HealthchecksIdResponse] {.async.} =
  ## Delete a health check.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/healthchecks/preview/{healthcheckId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.HealthchecksIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdHealthchecksHealthcheckId*(client: CloudflareClient,
                                              healthcheckId: types.HealthchecksIdentifier,
                                              zoneId: types.HealthchecksIdentifier): Future[types.HealthchecksSingleResponse] {.async.} =
  ## Fetch a single configured health check.

  let res = await client.httpGET(fmt"/zones/{zoneId}/healthchecks/{healthcheckId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.HealthchecksSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdHealthchecksHealthcheckId*(client: CloudflareClient,
                                              healthcheckId: types.HealthchecksIdentifier,
                                              zoneId: types.HealthchecksIdentifier,
                                              body: types.HealthchecksQueryHealthcheck): Future[types.HealthchecksSingleResponse] {.async.} =
  ## Update a configured health check.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/healthchecks/{healthcheckId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.HealthchecksSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdHealthchecksHealthcheckId*(client: CloudflareClient,
                                                 healthcheckId: types.HealthchecksIdentifier,
                                                 zoneId: types.HealthchecksIdentifier): Future[types.HealthchecksIdResponse] {.async.} =
  ## Delete a health check.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/healthchecks/{healthcheckId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.HealthchecksIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdHealthchecksHealthcheckId*(client: CloudflareClient,
                                                healthcheckId: types.HealthchecksIdentifier,
                                                zoneId: types.HealthchecksIdentifier,
                                                body: types.HealthchecksQueryHealthcheck): Future[types.HealthchecksSingleResponse] {.async.} =
  ## Patch a configured health check.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/healthchecks/{healthcheckId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.HealthchecksSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSmartShieldHealthchecks*(client: CloudflareClient,
                                            zoneId: types.SmartshieldIdentifier,
                                            page: float64 = default(float64),
                                            perPage: float64 = default(float64)): Future[types.SmartshieldResponseCollection] {.async.} =
  ## List configured health checks.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/zones/{zoneId}/smart_shield/healthchecks", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SmartshieldResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdSmartShieldHealthchecks*(client: CloudflareClient,
                                             zoneId: types.SmartshieldIdentifier,
                                             body: types.SmartshieldQueryHealthcheck): Future[types.SmartshieldSingleHcResponse] {.async.} =
  ## Create a new health check.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/smart_shield/healthchecks", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SmartshieldSingleHcResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSmartShieldHealthchecksHealthcheckId*(client: CloudflareClient,
                                                         healthcheckId: types.SmartshieldIdentifier,
                                                         zoneId: types.SmartshieldIdentifier): Future[types.SmartshieldSingleHcResponse] {.async.} =
  ## Fetch a single configured health check.

  let res = await client.httpGET(fmt"/zones/{zoneId}/smart_shield/healthchecks/{healthcheckId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SmartshieldSingleHcResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdSmartShieldHealthchecksHealthcheckId*(client: CloudflareClient,
                                                         healthcheckId: types.SmartshieldIdentifier,
                                                         zoneId: types.SmartshieldIdentifier,
                                                         body: types.SmartshieldSingleHcResponse): Future[types.SmartshieldSingleHcResponse] {.async.} =
  ## Update a configured health check.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/smart_shield/healthchecks/{healthcheckId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SmartshieldSingleHcResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdSmartShieldHealthchecksHealthcheckId*(client: CloudflareClient,
                                                            healthcheckId: types.SmartshieldIdentifier,
                                                            zoneId: types.SmartshieldIdentifier): Future[types.SmartshieldSingleHcIdResponse] {.async.} =
  ## Delete a health check.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/smart_shield/healthchecks/{healthcheckId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SmartshieldSingleHcIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSmartShieldHealthchecksHealthcheckId*(client: CloudflareClient,
                                                           healthcheckId: types.SmartshieldIdentifier,
                                                           zoneId: types.SmartshieldIdentifier,
                                                           body: types.SmartshieldQueryHealthcheck): Future[types.SmartshieldSingleHcResponse] {.async.} =
  ## Patch a configured health check.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/smart_shield/healthchecks/{healthcheckId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SmartshieldSingleHcResponse)
  else:
    raise newException(CloudflareClientError, body)
