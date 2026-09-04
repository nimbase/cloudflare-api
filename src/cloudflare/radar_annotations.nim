# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetRadarAnnotationsResponse* = object
    result: JsonNode
    success: bool
  GetRadarAnnotationsOutagesResponse* = object
    result: JsonNode
    success: bool
  GetRadarAnnotationsOutagesLocationsResponse* = object
    result: JsonNode
    success: bool
  GetRadarAnnotationsIdResponse* = object
    result: JsonNode
    success: bool
  RadarAnnotationDataSourceOption* = enum
    dataSourceALL = "ALL"
    dataSourceAIBOTS = "AI_BOTS"
    dataSourceAIGATEWAY = "AI_GATEWAY"
    dataSourceBGP = "BGP"
    dataSourceBOTS = "BOTS"
    dataSourceCONNECTIONANOMALY = "CONNECTION_ANOMALY"
    dataSourceCT = "CT"
    dataSourceDNS = "DNS"
    dataSourceDNSMAGNITUDE = "DNS_MAGNITUDE"
    dataSourceDNSAS112 = "DNS_AS112"
    dataSourceDOS = "DOS"
    dataSourceEMAILROUTING = "EMAIL_ROUTING"
    dataSourceEMAILSECURITY = "EMAIL_SECURITY"
    dataSourceFW = "FW"
    dataSourceFWPG = "FW_PG"
    dataSourceHTTP = "HTTP"
    dataSourceHTTPCONTROL = "HTTP_CONTROL"
    dataSourceHTTPCRAWLERREFERER = "HTTP_CRAWLER_REFERER"
    dataSourceHTTPORIGINS = "HTTP_ORIGINS"
    dataSourceIQI = "IQI"
    dataSourceLEAKEDCREDENTIALS = "LEAKED_CREDENTIALS"
    dataSourceNET = "NET"
    dataSourceROBOTSTXT = "ROBOTS_TXT"
    dataSourceSPEED = "SPEED"
    dataSourceWORKERSAI = "WORKERS_AI"

  RadarAnnotationEventTypeOption* = enum
    eventTypeEVENT = "EVENT"
    eventTypeGENERAL = "GENERAL"
    eventTypeOUTAGE = "OUTAGE"
    eventTypePARTIALPROJECTION = "PARTIAL_PROJECTION"
    eventTypePIPELINE = "PIPELINE"
    eventTypeTRAFFICANOMALY = "TRAFFIC_ANOMALY"

  RadarAnnotationOutageTypeOption* = enum
    outageTypeNATIONWIDE = "NATIONWIDE"
    outageTypeREGIONAL = "REGIONAL"
    outageTypeNETWORK = "NETWORK"
    outageTypePLATFORM = "PLATFORM"

  RadarAnnotationOutageCauseOption* = enum
    outageCauseBLOCKING = "BLOCKING"
    outageCauseCABLECUT = "CABLE_CUT"
    outageCauseCYBERATTACK = "CYBERATTACK"
    outageCauseDNS = "DNS"
    outageCauseFIRE = "FIRE"
    outageCauseGOVERNMENTDIRECTED = "GOVERNMENT_DIRECTED"
    outageCauseMAINTENANCE = "MAINTENANCE"
    outageCauseMECHANICAL = "MECHANICAL"
    outageCauseMILITARYACTION = "MILITARY_ACTION"
    outageCauseMISCONFIGURATION = "MISCONFIGURATION"
    outageCauseNATURALDISASTER = "NATURAL_DISASTER"
    outageCauseNETWORKPROBLEM = "NETWORK_PROBLEM"
    outageCausePOWEROUTAGE = "POWER_OUTAGE"
    outageCauseSOFTWARE = "SOFTWARE"
    outageCauseTECHNICALPROBLEM = "TECHNICAL_PROBLEM"
    outageCauseUNKNOWN = "UNKNOWN"
    outageCauseWEATHER = "WEATHER"

  RadarAnnotationFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"


proc getRadarAnnotations*(client: CloudflareClient, limit: int64 = 5,
                          offset: int64 = default(int64),
                          dateRange: string = default(string),
                          dateStart: string = default(string),
                          dateEnd: string = default(string),
                          dataSource: RadarAnnotationDataSourceOption,
                          eventType: RadarAnnotationEventTypeOption,
                          outageType: RadarAnnotationOutageTypeOption,
                          outageCause: RadarAnnotationOutageCauseOption,
                          tags: seq[string] = default(seq[string]),
                          query: string = default(string),
                          asn: int64 = default(int64),
                          location: string = default(string),
                          geoId: string = default(string),
                          origin: string = default(string),
                          tld: string = default(string),
                          ca: string = default(string),
                          log: string = default(string),
                          bot: string = default(string),
                          format: RadarAnnotationFormatOption): Future[GetRadarAnnotationsResponse] {.async.} =
  ## Retrieves the latest annotations.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["offset"] = $offset
  q["dateRange"] = $dateRange
  q["dateStart"] = $dateStart
  q["dateEnd"] = $dateEnd
  q["dataSource"] = $dataSource
  q["eventType"] = $eventType
  q["outageType"] = $outageType
  q["outageCause"] = $outageCause
  q["tags"] = $tags
  q["query"] = $query
  q["asn"] = $asn
  q["location"] = $location
  q["geoId"] = $geoId
  q["origin"] = $origin
  q["tld"] = $tld
  q["ca"] = $ca
  q["log"] = $log
  q["bot"] = $bot
  q["format"] = $format
  let res = await client.httpGET("/radar/annotations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAnnotationsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAnnotationsOutages*(client: CloudflareClient, limit: int64 = 5,
                                 offset: int64 = default(int64),
                                 dateRange: string = default(string),
                                 dateStart: string = default(string),
                                 dateEnd: string = default(string),
                                 dataSource: RadarAnnotationDataSourceOption,
                                 outageType: RadarAnnotationOutageTypeOption,
                                 outageCause: RadarAnnotationOutageCauseOption,
                                 tags: seq[string] = default(seq[string]),
                                 query: string = default(string),
                                 asn: int64 = default(int64),
                                 location: string = default(string),
                                 geoId: string = default(string),
                                 origin: string = default(string),
                                 tld: string = default(string),
                                 ca: string = default(string),
                                 log: string = default(string),
                                 bot: string = default(string),
                                 format: RadarAnnotationFormatOption): Future[GetRadarAnnotationsOutagesResponse] {.async.} =
  ## Retrieves the latest Internet outages and anomalies.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["offset"] = $offset
  q["dateRange"] = $dateRange
  q["dateStart"] = $dateStart
  q["dateEnd"] = $dateEnd
  q["dataSource"] = $dataSource
  q["outageType"] = $outageType
  q["outageCause"] = $outageCause
  q["tags"] = $tags
  q["query"] = $query
  q["asn"] = $asn
  q["location"] = $location
  q["geoId"] = $geoId
  q["origin"] = $origin
  q["tld"] = $tld
  q["ca"] = $ca
  q["log"] = $log
  q["bot"] = $bot
  q["format"] = $format
  let res = await client.httpGET("/radar/annotations/outages", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAnnotationsOutagesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAnnotationsOutagesLocations*(client: CloudflareClient,
                                          limit: int64 = 5,
                                          dateRange: string = default(string),
                                          dateStart: string = default(string),
                                          dateEnd: string = default(string),
                                          format: RadarAnnotationFormatOption): Future[GetRadarAnnotationsOutagesLocationsResponse] {.async.} =
  ## Retrieves the number of outages by location.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["dateRange"] = $dateRange
  q["dateStart"] = $dateStart
  q["dateEnd"] = $dateEnd
  q["format"] = $format
  let res = await client.httpGET("/radar/annotations/outages/locations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAnnotationsOutagesLocationsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAnnotationsId*(client: CloudflareClient, id: string,
                            format: RadarAnnotationFormatOption): Future[GetRadarAnnotationsIdResponse] {.async.} =
  ## Retrieves a single annotation by ID.

  var q = initOrderedTable[string, string]()
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/annotations/{id}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAnnotationsIdResponse)
  else:
    raise newException(CloudflareClientError, body)
