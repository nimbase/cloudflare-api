# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetRadarEntitiesLocationsResponse* = object
    result: JsonNode
    success: bool
  GetRadarEntitiesLocationsLocationResponse* = object
    result: JsonNode
    success: bool
  RadarLocationContinentOption* = enum
    continentAF = "AF"
    continentAS = "AS"
    continentEU = "EU"
    continentNA = "NA"
    continentOC = "OC"
    continentSA = "SA"

  RadarLocationFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"


proc getRadarEntitiesLocations*(client: CloudflareClient, limit: int64 = 5,
                                offset: int64 = default(int64),
                                location: string = default(string),
                                region: string = default(string),
                                subregion: string = default(string),
                                continent: set[RadarLocationContinentOption] = {},
                                format: set[RadarLocationFormatOption] = {}): Future[GetRadarEntitiesLocationsResponse] {.async.} =
  ## Retrieves a list of locations.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["offset"] = $offset
  q["location"] = $location
  q["region"] = $region
  q["subregion"] = $subregion
  for v in continent: q["continent"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/entities/locations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEntitiesLocationsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEntitiesLocationsLocation*(client: CloudflareClient,
                                        location: string,
                                        format: set[RadarLocationFormatOption] = {}): Future[GetRadarEntitiesLocationsLocationResponse] {.async.} =
  ## Retrieves the requested location information. (A confidence level below `5`
  ## indicates a low level of confidence in the traffic data - normally this happens
  ## because Cloudflare has a small amount of traffic from/to this location).

  var q = initOrderedTable[string, string]()
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/entities/locations/{location}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEntitiesLocationsLocationResponse)
  else:
    raise newException(CloudflareClientError, body)
