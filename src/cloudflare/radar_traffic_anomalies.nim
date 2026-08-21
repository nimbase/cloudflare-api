# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient

type
  GetRadarTrafficAnomaliesResponse* = object
    result: JsonNode
    success: bool
  GetRadarTrafficAnomaliesLocationsResponse* = object
    result: JsonNode
    success: bool
  RadarTrafficAnomalieStatusOption* = enum
    statusVERIFIED = "VERIFIED"
    statusUNVERIFIED = "UNVERIFIED"

  RadarTrafficAnomalieFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"


proc getRadarTrafficAnomalies*(client: CloudflareClient, limit: int64 = 5,
                               offset: int64 = default(int64),
                               dateRange: string = default(string),
                               dateStart: string = default(string),
                               dateEnd: string = default(string),
                               status: RadarTrafficAnomalieStatusOption,
                               `type`: seq[string] = default(seq[string]),
                               asn: int64 = default(int64),
                               location: string = default(string),
                               origin: string = default(string),
                               format: RadarTrafficAnomalieFormatOption): Future[GetRadarTrafficAnomaliesResponse] {.async.} =
  ## Retrieves the latest Internet traffic anomalies, which are signals that might
  ## indicate an outage. These alerts are automatically detected by Radar and
  ## manually verified by our team.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["offset"] = $offset
  q["dateRange"] = $dateRange
  q["dateStart"] = $dateStart
  q["dateEnd"] = $dateEnd
  q["status"] = $status
  q["type"] = $`type`
  q["asn"] = $asn
  q["location"] = $location
  q["origin"] = $origin
  q["format"] = $format
  let res = await client.httpGET("/radar/traffic_anomalies", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarTrafficAnomaliesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarTrafficAnomaliesLocations*(client: CloudflareClient,
                                        limit: int64 = 5,
                                        dateRange: string = default(string),
                                        dateStart: string = default(string),
                                        dateEnd: string = default(string),
                                        status: RadarTrafficAnomalieStatusOption,
                                        format: RadarTrafficAnomalieFormatOption): Future[GetRadarTrafficAnomaliesLocationsResponse] {.async.} =
  ## Retrieves the sum of Internet traffic anomalies, grouped by location. These
  ## anomalies are signals that might indicate an outage, automatically detected by
  ## Radar and manually verified by our team.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["dateRange"] = $dateRange
  q["dateStart"] = $dateStart
  q["dateEnd"] = $dateEnd
  q["status"] = $status
  q["format"] = $format
  let res = await client.httpGET("/radar/traffic_anomalies/locations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarTrafficAnomaliesLocationsResponse)
  else:
    raise newException(CloudflareClientError, body)
