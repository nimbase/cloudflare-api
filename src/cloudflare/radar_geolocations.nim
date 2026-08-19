# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetRadarGeolocationsResponse* = object
    result: JsonNode
    success: bool
  GetRadarGeolocationsGeoIdResponse* = object
    result: JsonNode
    success: bool
  RadarGeolocationFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"


proc getRadarGeolocations*(client: CloudflareClient, limit: int64 = 5,
                           offset: int64 = default(int64),
                           geoId: string = default(string),
                           location: string = default(string),
                           format: set[RadarGeolocationFormatOption] = {}): Future[GetRadarGeolocationsResponse] {.async.} =
  ## Retrieves a list of geolocations. Geolocation names can be localized by sending
  ## an `Accept-Language` HTTP header with a BCP 47 language tag (e.g.,
  ## `Accept-Language: pt-PT`). The full quality-value chain is supported (e.g.,
  ## `pt-PT,pt;q=0.9,en;q=0.8`).

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["offset"] = $offset
  q["geoId"] = $geoId
  q["location"] = $location
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/geolocations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarGeolocationsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarGeolocationsGeoId*(client: CloudflareClient, geoId: string,
                                format: set[RadarGeolocationFormatOption] = {}): Future[GetRadarGeolocationsGeoIdResponse] {.async.} =
  ## Retrieves the requested Geolocation information. Geolocation names can be
  ## localized by sending an `Accept-Language` HTTP header with a BCP 47 language tag
  ## (e.g., `Accept-Language: pt-PT`). The full quality-value chain is supported
  ## (e.g., `pt-PT,pt;q=0.9,en;q=0.8`).

  var q = initOrderedTable[string, string]()
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/geolocations/{geoId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarGeolocationsGeoIdResponse)
  else:
    raise newException(CloudflareClientError, body)
