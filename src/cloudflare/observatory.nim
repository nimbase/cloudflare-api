# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient
import ./private/types

type
  PostZonesZoneIdSpeedApiPagesUrlTestsRequest = object
    region: Option[JsonNode]

proc getZonesZoneIdSpeedApiAvailabilities*(client: CloudflareClient,
                                           zoneId: types.ObservatoryIdentifier): Future[types.ObservatoryAvailabilitiesResponse] {.async.} =
  ## Retrieves quota for all plans, as well as the current zone quota.

  let res = await client.httpGET(fmt"/zones/{zoneId}/speed_api/availabilities")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ObservatoryAvailabilitiesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSpeedApiPages*(client: CloudflareClient,
                                  zoneId: types.ObservatoryIdentifier): Future[types.ObservatoryPagesResponseCollection] {.async.} =
  ## Lists all webpages which have been tested.

  let res = await client.httpGET(fmt"/zones/{zoneId}/speed_api/pages")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ObservatoryPagesResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSpeedApiPagesUrlTests*(client: CloudflareClient,
                                          zoneId: types.ObservatoryIdentifier,
                                          url: types.ObservatoryUrl,
                                          page: int64 = 1, perPage: int64 = 20,
                                          region: JsonNode = default(JsonNode)): Future[types.ObservatoryPageTestResponseCollection] {.async.} =
  ## Test history (list of tests) for a specific webpage.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["region"] = $region
  let res = await client.httpGET(fmt"/zones/{zoneId}/speed_api/pages/{url}/tests", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ObservatoryPageTestResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdSpeedApiPagesUrlTests*(client: CloudflareClient,
                                           zoneId: types.ObservatoryIdentifier,
                                           url: types.ObservatoryUrl,
                                           body: PostZonesZoneIdSpeedApiPagesUrlTestsRequest): Future[types.ObservatoryPageTestResponseSingle] {.async.} =
  ## Starts a test for a specific webpage, in a specific region.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/speed_api/pages/{url}/tests", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ObservatoryPageTestResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdSpeedApiPagesUrlTests*(client: CloudflareClient,
                                             zoneId: types.ObservatoryIdentifier,
                                             url: types.ObservatoryUrl,
                                             region: JsonNode = default(JsonNode)): Future[types.ObservatoryCountResponse] {.async.} =
  ## Deletes all tests for a specific webpage from a specific region. Deleted tests
  ## are still counted as part of the quota.

  var q = initOrderedTable[string, string]()
  q["region"] = $region
  let res = await client.httpDELETE(fmt"/zones/{zoneId}/speed_api/pages/{url}/tests", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ObservatoryCountResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSpeedApiPagesUrlTestsTestId*(client: CloudflareClient,
                                                zoneId: types.ObservatoryIdentifier,
                                                url: types.ObservatoryUrl,
                                                testId: string): Future[types.ObservatoryPageTestResponseSingle] {.async.} =
  ## Retrieves the result of a specific test.

  let res = await client.httpGET(fmt"/zones/{zoneId}/speed_api/pages/{url}/tests/{testId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ObservatoryPageTestResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSpeedApiPagesUrlTrend*(client: CloudflareClient,
                                          zoneId: types.ObservatoryIdentifier,
                                          url: types.ObservatoryUrl,
                                          region: types.ObservatoryRegion,
                                          deviceType: types.ObservatoryDeviceType,
                                          start: types.ObservatoryTimestamp,
                                          `end`: types.ObservatoryTimestamp = default(types.ObservatoryTimestamp),
                                          tz: string, metrics: string): Future[types.ObservatoryTrendResponse] {.async.} =
  ## Lists the core web vital metrics trend over time for a specific page.

  var q = initOrderedTable[string, string]()
  q["region"] = $region
  q["deviceType"] = $deviceType
  q["start"] = $start
  q["end"] = $`end`
  q["tz"] = $tz
  q["metrics"] = $metrics
  let res = await client.httpGET(fmt"/zones/{zoneId}/speed_api/pages/{url}/trend", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ObservatoryTrendResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSpeedApiScheduleUrl*(client: CloudflareClient,
                                        zoneId: types.ObservatoryIdentifier,
                                        url: types.ObservatoryUrl,
                                        region: JsonNode = default(JsonNode)): Future[types.ObservatoryScheduleResponseSingle] {.async.} =
  ## Retrieves the test schedule for a page in a specific region.

  var q = initOrderedTable[string, string]()
  q["region"] = $region
  let res = await client.httpGET(fmt"/zones/{zoneId}/speed_api/schedule/{url}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ObservatoryScheduleResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdSpeedApiScheduleUrl*(client: CloudflareClient,
                                         zoneId: types.ObservatoryIdentifier,
                                         url: types.ObservatoryUrl,
                                         region: JsonNode = default(JsonNode),
                                         frequency: types.ObservatoryScheduleFrequency = default(types.ObservatoryScheduleFrequency)): Future[types.ObservatoryCreateScheduleResponse] {.async.} =
  ## Creates a scheduled test for a page.

  var q = initOrderedTable[string, string]()
  q["region"] = $region
  q["frequency"] = $frequency
  let res = await client.httpPOST(fmt"/zones/{zoneId}/speed_api/schedule/{url}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ObservatoryCreateScheduleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdSpeedApiScheduleUrl*(client: CloudflareClient,
                                           zoneId: types.ObservatoryIdentifier,
                                           url: types.ObservatoryUrl,
                                           region: JsonNode = default(JsonNode)): Future[types.ObservatoryCountResponse] {.async.} =
  ## Deletes a scheduled test for a page.

  var q = initOrderedTable[string, string]()
  q["region"] = $region
  let res = await client.httpDELETE(fmt"/zones/{zoneId}/speed_api/schedule/{url}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ObservatoryCountResponse)
  else:
    raise newException(CloudflareClientError, body)
