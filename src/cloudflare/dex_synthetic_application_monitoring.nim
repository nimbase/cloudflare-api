# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types

type
  DexSyntheticApplicationMonitoringSortByOption* = enum
    sortByFleetStatusUsage = "fleet-status-usage"
    sortByApplicationTestsUsage = "application-tests-usage"

  DexSyntheticApplicationMonitoringKindOption* = enum
    kindHttp = "http"
    kindTraceroute = "traceroute"

  DexSyntheticApplicationMonitoringIntervalOption* = enum
    intervalMinute = "minute"
    intervalHour = "hour"

  DexSyntheticApplicationMonitoringSortOrderOption* = enum
    sortOrderASC = "ASC"
    sortOrderDESC = "DESC"


proc getAccountsAccountIdDexColos*(client: CloudflareClient,
                                   accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                   `from`: string, to: string,
                                   sortBy: DexSyntheticApplicationMonitoringSortByOption): Future[JsonNode] {.async.} =
  ## List Cloudflare colos that account's devices were connected to during a time
  ## period, sorted by usage starting from the most used colo. Colos without traffic
  ## are also returned and sorted alphabetically.

  var q = initOrderedTable[string, string]()
  q["from"] = $`from`
  q["to"] = $to
  q["sortBy"] = $sortBy
  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/colos", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDexDevicesDexTests*(client: CloudflareClient,
                                             accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                             page: float64 = default(float64),
                                             perPage: float64 = default(float64),
                                             testName: string = default(string),
                                             kind: DexSyntheticApplicationMonitoringKindOption): Future[types.DigitalExperienceMonitoringDexResponseCollection] {.async.} =
  ## Fetch all DEX tests.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["testName"] = $testName
  q["kind"] = $kind
  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/devices/dex_tests", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DigitalExperienceMonitoringDexResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDexDevicesDexTests*(client: CloudflareClient,
                                              accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                              body: types.DigitalExperienceMonitoringDeviceDexTestSchemasHttp): Future[types.DigitalExperienceMonitoringDexSingleResponse] {.async.} =
  ## Create a DEX test.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dex/devices/dex_tests", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DigitalExperienceMonitoringDexSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDexDevicesDexTestsDexTestId*(client: CloudflareClient,
                                                      accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                                      dexTestId: types.DigitalExperienceMonitoringSchemasTestId): Future[types.DigitalExperienceMonitoringDexSingleResponse] {.async.} =
  ## Fetch a single DEX test.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/devices/dex_tests/{dexTestId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DigitalExperienceMonitoringDexSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDexDevicesDexTestsDexTestId*(client: CloudflareClient,
                                                      accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                                      dexTestId: types.DigitalExperienceMonitoringUuid,
                                                      body: types.DigitalExperienceMonitoringDeviceDexTestSchemasHttp): Future[types.DigitalExperienceMonitoringDexSingleResponse] {.async.} =
  ## Update a DEX test.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/dex/devices/dex_tests/{dexTestId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DigitalExperienceMonitoringDexSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDexDevicesDexTestsDexTestId*(client: CloudflareClient,
                                                         accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                                         dexTestId: types.DigitalExperienceMonitoringUuid): Future[types.DigitalExperienceMonitoringDexDeleteResponseCollection] {.async.} =
  ## Delete a Device DEX test. Returns the remaining device dex tests for the
  ## account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/dex/devices/dex_tests/{dexTestId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DigitalExperienceMonitoringDexDeleteResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDexDevicesDeviceIdFleetStatusLive*(client: CloudflareClient,
                                                            accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                                            deviceId: types.DigitalExperienceMonitoringDeviceId,
                                                            sinceMinutes: types.DigitalExperienceMonitoringSinceMinutes,
                                                            timeNow: types.DigitalExperienceMonitoringTimeNow = default(types.DigitalExperienceMonitoringTimeNow),
                                                            colo: types.DigitalExperienceMonitoringColo = default(types.DigitalExperienceMonitoringColo)): Future[types.DigitalExperienceMonitoringDevice] {.async.} =
  ## Get the latest status of a device given device_id from the device_state table.

  var q = initOrderedTable[string, string]()
  q["since_minutes"] = $sinceMinutes
  q["time_now"] = $timeNow
  q["colo"] = $colo
  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/devices/{deviceId}/fleet-status/live", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DigitalExperienceMonitoringDevice)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDexDevicesDeviceIdFleetStatusOverTime*(client: CloudflareClient,
                                                                accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                                                deviceId: types.DigitalExperienceMonitoringDeviceId,
                                                                `from`: types.DigitalExperienceMonitoringTimestamp,
                                                                to: types.DigitalExperienceMonitoringTimestamp,
                                                                interval: DexSyntheticApplicationMonitoringIntervalOption,
                                                                colo: types.DigitalExperienceMonitoringColo = default(types.DigitalExperienceMonitoringColo)): Future[JsonNode] {.async.} =
  ## Get time-bucketed status metrics for a specific device.

  var q = initOrderedTable[string, string]()
  q["from"] = $`from`
  q["to"] = $to
  q["interval"] = $interval
  q["colo"] = $colo
  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/devices/{deviceId}/fleet-status/over-time", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDexDevicesDeviceIdIsps*(client: CloudflareClient,
                                                 accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                                 deviceId: types.DigitalExperienceMonitoringUuid,
                                                 page: int64 = 1, perPage: int64,
                                                 cursor: string = default(string),
                                                 sortBy: DexSyntheticApplicationMonitoringSortByOption = sortByTimeStart,
                                                 sortOrder: DexSyntheticApplicationMonitoringSortOrderOption = sortOrderDESC,
                                                 `from`: string = default(string),
                                                 to: string = default(string)): Future[JsonNode] {.async.} =
  ## List ISP information observed for a specific device during traceroute tests.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["cursor"] = $cursor
  q["sort_by"] = $sortBy
  q["sort_order"] = $sortOrder
  q["from"] = $`from`
  q["to"] = $to
  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/devices/{deviceId}/isps", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDexFleetStatusDevices*(client: CloudflareClient,
                                                accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                                to: types.DigitalExperienceMonitoringTimestamp,
                                                `from`: types.DigitalExperienceMonitoringTimestamp,
                                                page: types.DigitalExperienceMonitoringPage,
                                                perPage: types.DigitalExperienceMonitoringPerPage,
                                                sortBy: types.DigitalExperienceMonitoringSortBy = default(types.DigitalExperienceMonitoringSortBy),
                                                colo: types.DigitalExperienceMonitoringColo = default(types.DigitalExperienceMonitoringColo),
                                                deviceId: types.DigitalExperienceMonitoringDeviceId = default(types.DigitalExperienceMonitoringDeviceId),
                                                mode: types.DigitalExperienceMonitoringMode = default(types.DigitalExperienceMonitoringMode),
                                                status: types.DigitalExperienceMonitoringStatus = default(types.DigitalExperienceMonitoringStatus),
                                                platform: types.DigitalExperienceMonitoringPlatform = default(types.DigitalExperienceMonitoringPlatform),
                                                version: types.DigitalExperienceMonitoringVersion = default(types.DigitalExperienceMonitoringVersion),
                                                source: types.DigitalExperienceMonitoringSource = default(types.DigitalExperienceMonitoringSource)): Future[types.DigitalExperienceMonitoringFleetStatusDevicesResponse] {.async.} =
  ## List details of devices using WARP.

  var q = initOrderedTable[string, string]()
  q["to"] = $to
  q["from"] = $`from`
  q["page"] = $page
  q["per_page"] = $perPage
  q["sort_by"] = $sortBy
  q["colo"] = $colo
  q["device_id"] = $deviceId
  q["mode"] = $mode
  q["status"] = $status
  q["platform"] = $platform
  q["version"] = $version
  q["source"] = $source
  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/fleet-status/devices", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DigitalExperienceMonitoringFleetStatusDevicesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDexFleetStatusLive*(client: CloudflareClient,
                                             accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                             sinceMinutes: types.DigitalExperienceMonitoringSinceMinutes): Future[types.DigitalExperienceMonitoringFleetStatusLiveResponse] {.async.} =
  ## Get details for live (up to 60 minutes) devices using WARP.

  var q = initOrderedTable[string, string]()
  q["since_minutes"] = $sinceMinutes
  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/fleet-status/live", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DigitalExperienceMonitoringFleetStatusLiveResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDexFleetStatusOverTime*(client: CloudflareClient,
                                                 accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                                 to: types.DigitalExperienceMonitoringTimestamp,
                                                 `from`: types.DigitalExperienceMonitoringTimestamp,
                                                 colo: types.DigitalExperienceMonitoringColo = default(types.DigitalExperienceMonitoringColo),
                                                 deviceId: types.DigitalExperienceMonitoringDeviceId = default(types.DigitalExperienceMonitoringDeviceId)): Future[types.DigitalExperienceMonitoringFleetStatusOverTimeResponse] {.async.} =
  ## Get aggregate details for devices using WARP, up to 7 days.

  var q = initOrderedTable[string, string]()
  q["to"] = $to
  q["from"] = $`from`
  q["colo"] = $colo
  q["device_id"] = $deviceId
  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/fleet-status/over-time", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DigitalExperienceMonitoringFleetStatusOverTimeResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDexHttpTestsTestId*(client: CloudflareClient,
                                             accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                             testId: types.DigitalExperienceMonitoringUuid,
                                             deviceId: seq[string] = @[],
                                             `from`: string, to: string,
                                             interval: DexSyntheticApplicationMonitoringIntervalOption,
                                             colo: string = default(string)): Future[JsonNode] {.async.} =
  ## Get test details and aggregate performance metrics for an http test for a given
  ## time period between 1 hour and 7 days.

  var q = initOrderedTable[string, string]()
  for v in deviceId: q["deviceId"] = $v
  q["from"] = $`from`
  q["to"] = $to
  q["interval"] = $interval
  q["colo"] = $colo
  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/http-tests/{testId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDexHttpTestsTestIdPercentiles*(client: CloudflareClient,
                                                        accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                                        testId: types.DigitalExperienceMonitoringUuid,
                                                        deviceId: seq[string] = @[],
                                                        `from`: string,
                                                        to: string,
                                                        colo: string = default(string)): Future[JsonNode] {.async.} =
  ## Get percentiles for an http test for a given time period between 1 hour and 7
  ## days.

  var q = initOrderedTable[string, string]()
  for v in deviceId: q["deviceId"] = $v
  q["from"] = $`from`
  q["to"] = $to
  q["colo"] = $colo
  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/http-tests/{testId}/percentiles", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDexTestsOverview*(client: CloudflareClient,
                                           accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                           colo: string = default(string),
                                           testName: string = default(string),
                                           deviceId: seq[string] = @[],
                                           registrationId: string = default(string),
                                           page: float64 = default(float64),
                                           perPage: float64 = default(float64),
                                           kind: DexSyntheticApplicationMonitoringKindOption): Future[JsonNode] {.async.} =
  ## List DEX tests with overview metrics.

  var q = initOrderedTable[string, string]()
  q["colo"] = $colo
  q["testName"] = $testName
  for v in deviceId: q["deviceId"] = $v
  q["registration_id"] = $registrationId
  q["page"] = $page
  q["per_page"] = $perPage
  q["kind"] = $kind
  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/tests/overview", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDexTestsUniqueDevices*(client: CloudflareClient,
                                                accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                                testName: string = default(string),
                                                deviceId: seq[string] = @[]): Future[JsonNode] {.async.} =
  ## Returns unique count of devices that have run synthetic application monitoring
  ## tests in the past 7 days.

  var q = initOrderedTable[string, string]()
  q["testName"] = $testName
  for v in deviceId: q["deviceId"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/tests/unique-devices", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDexTracerouteTestResultsTestResultIdNetworkPath*(client: CloudflareClient,
                                                                          accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                                                          testResultId: types.DigitalExperienceMonitoringUuid): Future[JsonNode] {.async.} =
  ## Get a breakdown of hops and performance metrics for a specific traceroute test
  ## run

  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/traceroute-test-results/{testResultId}/network-path")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDexTracerouteTestsTestId*(client: CloudflareClient,
                                                   accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                                   testId: types.DigitalExperienceMonitoringUuid,
                                                   deviceId: seq[string] = @[],
                                                   `from`: string, to: string,
                                                   interval: DexSyntheticApplicationMonitoringIntervalOption,
                                                   colo: string = default(string)): Future[JsonNode] {.async.} =
  ## Get test details and aggregate performance metrics for a traceroute test for a
  ## given time period between 1 hour and 7 days.

  var q = initOrderedTable[string, string]()
  for v in deviceId: q["deviceId"] = $v
  q["from"] = $`from`
  q["to"] = $to
  q["interval"] = $interval
  q["colo"] = $colo
  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/traceroute-tests/{testId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDexTracerouteTestsTestIdNetworkPath*(client: CloudflareClient,
                                                              accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                                              testId: types.DigitalExperienceMonitoringUuid,
                                                              deviceId: string,
                                                              `from`: string,
                                                              to: string,
                                                              interval: DexSyntheticApplicationMonitoringIntervalOption): Future[JsonNode] {.async.} =
  ## Get a breakdown of metrics by hop for individual traceroute test runs.

  var q = initOrderedTable[string, string]()
  q["deviceId"] = $deviceId
  q["from"] = $`from`
  q["to"] = $to
  q["interval"] = $interval
  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/traceroute-tests/{testId}/network-path", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDexTracerouteTestsTestIdPercentiles*(client: CloudflareClient,
                                                              accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                                              testId: types.DigitalExperienceMonitoringUuid,
                                                              deviceId: seq[string] = @[],
                                                              `from`: string,
                                                              to: string,
                                                              colo: string = default(string)): Future[JsonNode] {.async.} =
  ## Get percentiles for a traceroute test for a given time period between 1 hour and
  ## 7 days.

  var q = initOrderedTable[string, string]()
  for v in deviceId: q["deviceId"] = $v
  q["from"] = $`from`
  q["to"] = $to
  q["colo"] = $colo
  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/traceroute-tests/{testId}/percentiles", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
