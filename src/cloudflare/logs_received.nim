# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdLogsControlRetentionFlag*(client: CloudflareClient,
                                             zoneId: types.LogcontrolIdentifier): Future[types.LogcontrolRetentionFlagResponseSingle] {.async.} =
  ## Gets log retention flag for Logpull API.

  let res = await client.httpGET(fmt"/zones/{zoneId}/logs/control/retention/flag")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogcontrolRetentionFlagResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdLogsControlRetentionFlag*(client: CloudflareClient,
                                              zoneId: types.LogcontrolIdentifier,
                                              body: types.LogcontrolRetentionFlag): Future[types.LogcontrolRetentionFlagResponseSingle] {.async.} =
  ## Updates log retention flag for Logpull API.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/logs/control/retention/flag", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogcontrolRetentionFlagResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdLogsRayidsRayId*(client: CloudflareClient,
                                    zoneId: types.LogshareIdentifier,
                                    rayId: types.LogshareRayIdentifier,
                                    fields: types.LogshareFields = default(types.LogshareFields),
                                    timestamps: types.LogshareTimestamps = default(types.LogshareTimestamps)): Future[types.LogshareLogsResponseJsonLines] {.async.} =
  ## The `/rayids` api route allows lookups by specific rayid. The rayids route will
  ## return zero, one, or more records (ray ids are not unique).

  var q = initOrderedTable[string, string]()
  q["fields"] = $fields
  q["timestamps"] = $timestamps
  let res = await client.httpGET(fmt"/zones/{zoneId}/logs/rayids/{rayId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogshareLogsResponseJsonLines)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdLogsReceived*(client: CloudflareClient,
                                 zoneId: types.LogshareIdentifier,
                                 start: types.LogshareStart = default(types.LogshareStart),
                                 `end`: types.LogshareEnd,
                                 fields: types.LogshareFields = default(types.LogshareFields),
                                 sample: types.LogshareSample = default(types.LogshareSample),
                                 count: types.LogshareCount = default(types.LogshareCount),
                                 timestamps: types.LogshareTimestamps = default(types.LogshareTimestamps)): Future[types.LogshareLogsResponseJsonLines] {.async.} =
  ## The `/received` api route allows customers to retrieve their edge HTTP logs. The
  ## basic access pattern is "give me all the logs for zone Z for minute M", where
  ## the minute M refers to the time records were received at Cloudflare's central
  ## data center. `start` is inclusive, and `end` is exclusive. Because of that, to
  ## get all data, at minutely cadence, starting at 10AM, the proper values are:
  ## `start=2018-05-20T10:00:00Z&end=2018-05-20T10:01:00Z`, then
  ## `start=2018-05-20T10:01:00Z&end=2018-05-20T10:02:00Z` and so on; the overlap
  ## will be handled properly.

  var q = initOrderedTable[string, string]()
  q["start"] = $start
  q["end"] = $`end`
  q["fields"] = $fields
  q["sample"] = $sample
  q["count"] = $count
  q["timestamps"] = $timestamps
  let res = await client.httpGET(fmt"/zones/{zoneId}/logs/received", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogshareLogsResponseJsonLines)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdLogsReceivedFields*(client: CloudflareClient,
                                       zoneId: types.LogshareIdentifier): Future[types.LogshareFieldsResponse] {.async.} =
  ## Lists all fields available. The response is json object with key-value pairs,
  ## where keys are field names, and values are descriptions.

  let res = await client.httpGET(fmt"/zones/{zoneId}/logs/received/fields")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogshareFieldsResponse)
  else:
    raise newException(CloudflareClientError, body)
