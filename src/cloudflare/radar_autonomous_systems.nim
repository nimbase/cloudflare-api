# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetRadarEntitiesAsnsResponse* = object
    result: JsonNode
    success: bool
  GetRadarEntitiesAsnsBotnetThreatFeedResponse* = object
    result: JsonNode
    success: bool
  GetRadarEntitiesAsnsIpResponse* = object
    result: JsonNode
    success: bool
  GetRadarEntitiesAsnsAsnResponse* = object
    result: JsonNode
    success: bool
  GetRadarEntitiesAsnsAsnAsSetResponse* = object
    result: JsonNode
    success: bool
  GetRadarEntitiesAsnsAsnRelResponse* = object
    result: JsonNode
    success: bool
  RadarAutonomousSystemOrderByOption* = enum
    orderByASN = "ASN"
    orderByPOPULATION = "POPULATION"

  RadarAutonomousSystemFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"

  RadarAutonomousSystemMetricOption* = enum
    metricOFFENSECOUNT = "OFFENSE_COUNT"
    metricNUMBEROFOFFENDINGIPS = "NUMBER_OF_OFFENDING_IPS"

  RadarAutonomousSystemSortOrderOption* = enum
    sortOrderASC = "ASC"
    sortOrderDESC = "DESC"


proc getRadarEntitiesAsns*(client: CloudflareClient, limit: int64 = 5,
                           offset: int64 = default(int64),
                           asn: string = default(string),
                           location: string = default(string),
                           orderBy: RadarAutonomousSystemOrderByOption = orderByASN,
                           format: RadarAutonomousSystemFormatOption): Future[GetRadarEntitiesAsnsResponse] {.async.} =
  ## Retrieves a list of autonomous systems.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["offset"] = $offset
  q["asn"] = $asn
  q["location"] = $location
  q["orderBy"] = $orderBy
  q["format"] = $format
  let res = await client.httpGET("/radar/entities/asns", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEntitiesAsnsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEntitiesAsnsBotnetThreatFeed*(client: CloudflareClient,
                                           limit: int64 = 5,
                                           offset: int64 = default(int64),
                                           metric: RadarAutonomousSystemMetricOption = metricNUMBEROFOFFENDINGIPS,
                                           date: string = default(string),
                                           compareDateRange: string = default(string),
                                           location: string = default(string),
                                           asn: seq[string] = @[],
                                           sortOrder: RadarAutonomousSystemSortOrderOption,
                                           format: RadarAutonomousSystemFormatOption): Future[GetRadarEntitiesAsnsBotnetThreatFeedResponse] {.async.} =
  ## Retrieves a ranked list of Autonomous Systems based on their presence in the
  ## Cloudflare Botnet Threat Feed. Rankings can be sorted by offense count or number
  ## of bad IPs. Optionally compare to a previous date to see rank changes.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["offset"] = $offset
  q["metric"] = $metric
  q["date"] = $date
  q["compareDateRange"] = $compareDateRange
  q["location"] = $location
  for v in asn: q["asn"] = $v
  q["sortOrder"] = $sortOrder
  q["format"] = $format
  let res = await client.httpGET("/radar/entities/asns/botnet_threat_feed", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEntitiesAsnsBotnetThreatFeedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEntitiesAsnsIp*(client: CloudflareClient, ip: string,
                             format: RadarAutonomousSystemFormatOption): Future[GetRadarEntitiesAsnsIpResponse] {.async.} =
  ## Retrieves the requested autonomous system information based on IP address.
  ## Population estimates come from APNIC (refer to https://labs.apnic.net/?p=526).

  var q = initOrderedTable[string, string]()
  q["ip"] = $ip
  q["format"] = $format
  let res = await client.httpGET("/radar/entities/asns/ip", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEntitiesAsnsIpResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEntitiesAsnsAsn*(client: CloudflareClient, asn: int64,
                              format: RadarAutonomousSystemFormatOption): Future[GetRadarEntitiesAsnsAsnResponse] {.async.} =
  ## Retrieves the requested autonomous system information. (A confidence level below
  ## `5` indicates a low level of confidence in the traffic data - normally this
  ## happens because Cloudflare has a small amount of traffic from/to this AS).
  ## Population estimates come from APNIC (refer to https://labs.apnic.net/?p=526).

  var q = initOrderedTable[string, string]()
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/entities/asns/{asn}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEntitiesAsnsAsnResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEntitiesAsnsAsnAsSet*(client: CloudflareClient, asn: int64,
                                   format: RadarAutonomousSystemFormatOption): Future[GetRadarEntitiesAsnsAsnAsSetResponse] {.async.} =
  ## Retrieves Internet Routing Registry AS-SETs that an AS is a member of.

  var q = initOrderedTable[string, string]()
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/entities/asns/{asn}/as_set", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEntitiesAsnsAsnAsSetResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEntitiesAsnsAsnRel*(client: CloudflareClient, asn: int64,
                                 asn2: int64 = default(int64),
                                 format: RadarAutonomousSystemFormatOption): Future[GetRadarEntitiesAsnsAsnRelResponse] {.async.} =
  ## Retrieves AS-level relationship for given networks.

  var q = initOrderedTable[string, string]()
  q["asn2"] = $asn2
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/entities/asns/{asn}/rel", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEntitiesAsnsAsnRelResponse)
  else:
    raise newException(CloudflareClientError, body)
