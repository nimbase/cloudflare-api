# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetRadarEmailRoutingSummaryArcResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailRoutingSummaryDkimResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailRoutingSummaryDmarcResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailRoutingSummaryEncryptedResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailRoutingSummaryIpVersionResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailRoutingSummarySpfResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailRoutingSummaryDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailRoutingTimeseriesGroupsArcResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailRoutingTimeseriesGroupsDkimResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailRoutingTimeseriesGroupsDmarcResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailRoutingTimeseriesGroupsEncryptedResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailRoutingTimeseriesGroupsIpVersionResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailRoutingTimeseriesGroupsSpfResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailRoutingTimeseriesGroupsDimensionResponse* = object
    result: JsonNode
    success: bool
  RadarEmailRoutingFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"

  RadarEmailRoutingAggIntervalOption* = enum
    aggInterval15m = "15m"
    aggInterval1h = "1h"
    aggInterval1d = "1d"
    aggInterval1w = "1w"


proc getRadarEmailRoutingSummaryArc*(client: CloudflareClient,
                                     name: seq[string] = @[],
                                     dateRange: seq[string] = @[],
                                     dateStart: seq[string] = @[],
                                     dateEnd: seq[string] = @[],
                                     dkim: seq[string] = default(seq[string]),
                                     dmarc: seq[string] = default(seq[string]),
                                     spf: seq[string] = default(seq[string]),
                                     ipVersion: seq[string] = default(seq[string]),
                                     encrypted: seq[string] = default(seq[string]),
                                     format: set[RadarEmailRoutingFormatOption] = {}): Future[GetRadarEmailRoutingSummaryArcResponse] {.async.} =
  ## Retrieves the distribution of emails by ARC (Authenticated Received Chain)
  ## validation.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["dkim"] = $dkim
  q["dmarc"] = $dmarc
  q["spf"] = $spf
  q["ipVersion"] = $ipVersion
  q["encrypted"] = $encrypted
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/routing/summary/arc", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailRoutingSummaryArcResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailRoutingSummaryDkim*(client: CloudflareClient,
                                      name: seq[string] = @[],
                                      dateRange: seq[string] = @[],
                                      dateStart: seq[string] = @[],
                                      dateEnd: seq[string] = @[],
                                      arc: seq[string] = default(seq[string]),
                                      dmarc: seq[string] = default(seq[string]),
                                      spf: seq[string] = default(seq[string]),
                                      ipVersion: seq[string] = default(seq[string]),
                                      encrypted: seq[string] = default(seq[string]),
                                      format: set[RadarEmailRoutingFormatOption] = {}): Future[GetRadarEmailRoutingSummaryDkimResponse] {.async.} =
  ## Retrieves the distribution of emails by DKIM (DomainKeys Identified Mail)
  ## validation.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["arc"] = $arc
  q["dmarc"] = $dmarc
  q["spf"] = $spf
  q["ipVersion"] = $ipVersion
  q["encrypted"] = $encrypted
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/routing/summary/dkim", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailRoutingSummaryDkimResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailRoutingSummaryDmarc*(client: CloudflareClient,
                                       name: seq[string] = @[],
                                       dateRange: seq[string] = @[],
                                       dateStart: seq[string] = @[],
                                       dateEnd: seq[string] = @[],
                                       arc: seq[string] = default(seq[string]),
                                       dkim: seq[string] = default(seq[string]),
                                       spf: seq[string] = default(seq[string]),
                                       ipVersion: seq[string] = default(seq[string]),
                                       encrypted: seq[string] = default(seq[string]),
                                       format: set[RadarEmailRoutingFormatOption] = {}): Future[GetRadarEmailRoutingSummaryDmarcResponse] {.async.} =
  ## Retrieves the distribution of emails by DMARC (Domain-based Message
  ## Authentication, Reporting and Conformance) validation.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["arc"] = $arc
  q["dkim"] = $dkim
  q["spf"] = $spf
  q["ipVersion"] = $ipVersion
  q["encrypted"] = $encrypted
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/routing/summary/dmarc", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailRoutingSummaryDmarcResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailRoutingSummaryEncrypted*(client: CloudflareClient,
                                           name: seq[string] = @[],
                                           dateRange: seq[string] = @[],
                                           dateStart: seq[string] = @[],
                                           dateEnd: seq[string] = @[],
                                           arc: seq[string] = default(seq[string]),
                                           dkim: seq[string] = default(seq[string]),
                                           dmarc: seq[string] = default(seq[string]),
                                           spf: seq[string] = default(seq[string]),
                                           ipVersion: seq[string] = default(seq[string]),
                                           format: set[RadarEmailRoutingFormatOption] = {}): Future[GetRadarEmailRoutingSummaryEncryptedResponse] {.async.} =
  ## Retrieves the distribution of emails by encryption status (encrypted vs.
  ## not-encrypted).

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["arc"] = $arc
  q["dkim"] = $dkim
  q["dmarc"] = $dmarc
  q["spf"] = $spf
  q["ipVersion"] = $ipVersion
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/routing/summary/encrypted", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailRoutingSummaryEncryptedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailRoutingSummaryIpVersion*(client: CloudflareClient,
                                           name: seq[string] = @[],
                                           dateRange: seq[string] = @[],
                                           dateStart: seq[string] = @[],
                                           dateEnd: seq[string] = @[],
                                           arc: seq[string] = default(seq[string]),
                                           dkim: seq[string] = default(seq[string]),
                                           dmarc: seq[string] = default(seq[string]),
                                           spf: seq[string] = default(seq[string]),
                                           encrypted: seq[string] = default(seq[string]),
                                           format: set[RadarEmailRoutingFormatOption] = {}): Future[GetRadarEmailRoutingSummaryIpVersionResponse] {.async.} =
  ## Retrieves the distribution of emails by IP version.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["arc"] = $arc
  q["dkim"] = $dkim
  q["dmarc"] = $dmarc
  q["spf"] = $spf
  q["encrypted"] = $encrypted
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/routing/summary/ip_version", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailRoutingSummaryIpVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailRoutingSummarySpf*(client: CloudflareClient,
                                     name: seq[string] = @[],
                                     dateRange: seq[string] = @[],
                                     dateStart: seq[string] = @[],
                                     dateEnd: seq[string] = @[],
                                     arc: seq[string] = default(seq[string]),
                                     dkim: seq[string] = default(seq[string]),
                                     dmarc: seq[string] = default(seq[string]),
                                     ipVersion: seq[string] = default(seq[string]),
                                     encrypted: seq[string] = default(seq[string]),
                                     format: set[RadarEmailRoutingFormatOption] = {}): Future[GetRadarEmailRoutingSummarySpfResponse] {.async.} =
  ## Retrieves the distribution of emails by SPF (Sender Policy Framework)
  ## validation.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["arc"] = $arc
  q["dkim"] = $dkim
  q["dmarc"] = $dmarc
  q["ipVersion"] = $ipVersion
  q["encrypted"] = $encrypted
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/routing/summary/spf", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailRoutingSummarySpfResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailRoutingSummaryDimension*(client: CloudflareClient,
                                           dimension: string,
                                           name: seq[string] = @[],
                                           dateRange: seq[string] = @[],
                                           dateStart: seq[string] = @[],
                                           dateEnd: seq[string] = @[],
                                           arc: seq[string] = default(seq[string]),
                                           dkim: seq[string] = default(seq[string]),
                                           dmarc: seq[string] = default(seq[string]),
                                           spf: seq[string] = default(seq[string]),
                                           ipVersion: seq[string] = default(seq[string]),
                                           encrypted: seq[string] = default(seq[string]),
                                           limitPerGroup: int64 = default(int64),
                                           format: set[RadarEmailRoutingFormatOption] = {}): Future[GetRadarEmailRoutingSummaryDimensionResponse] {.async.} =
  ## Retrieves the distribution of email routing metrics by the specified dimension.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["arc"] = $arc
  q["dkim"] = $dkim
  q["dmarc"] = $dmarc
  q["spf"] = $spf
  q["ipVersion"] = $ipVersion
  q["encrypted"] = $encrypted
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/email/routing/summary/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailRoutingSummaryDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailRoutingTimeseriesGroupsArc*(client: CloudflareClient,
                                              aggInterval: set[RadarEmailRoutingAggIntervalOption] = {},
                                              name: seq[string] = @[],
                                              dateRange: seq[string] = @[],
                                              dateStart: seq[string] = @[],
                                              dateEnd: seq[string] = @[],
                                              dkim: seq[string] = default(seq[string]),
                                              dmarc: seq[string] = default(seq[string]),
                                              spf: seq[string] = default(seq[string]),
                                              ipVersion: seq[string] = default(seq[string]),
                                              encrypted: seq[string] = default(seq[string]),
                                              format: set[RadarEmailRoutingFormatOption] = {}): Future[GetRadarEmailRoutingTimeseriesGroupsArcResponse] {.async.} =
  ## Retrieves the distribution of emails by ARC (Authenticated Received Chain)
  ## validation over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["dkim"] = $dkim
  q["dmarc"] = $dmarc
  q["spf"] = $spf
  q["ipVersion"] = $ipVersion
  q["encrypted"] = $encrypted
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/routing/timeseries_groups/arc", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailRoutingTimeseriesGroupsArcResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailRoutingTimeseriesGroupsDkim*(client: CloudflareClient,
                                               aggInterval: set[RadarEmailRoutingAggIntervalOption] = {},
                                               name: seq[string] = @[],
                                               dateRange: seq[string] = @[],
                                               dateStart: seq[string] = @[],
                                               dateEnd: seq[string] = @[],
                                               arc: seq[string] = default(seq[string]),
                                               dmarc: seq[string] = default(seq[string]),
                                               spf: seq[string] = default(seq[string]),
                                               ipVersion: seq[string] = default(seq[string]),
                                               encrypted: seq[string] = default(seq[string]),
                                               format: set[RadarEmailRoutingFormatOption] = {}): Future[GetRadarEmailRoutingTimeseriesGroupsDkimResponse] {.async.} =
  ## Retrieves the distribution of emails by DKIM (DomainKeys Identified Mail)
  ## validation over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["arc"] = $arc
  q["dmarc"] = $dmarc
  q["spf"] = $spf
  q["ipVersion"] = $ipVersion
  q["encrypted"] = $encrypted
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/routing/timeseries_groups/dkim", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailRoutingTimeseriesGroupsDkimResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailRoutingTimeseriesGroupsDmarc*(client: CloudflareClient,
                                                aggInterval: set[RadarEmailRoutingAggIntervalOption] = {},
                                                name: seq[string] = @[],
                                                dateRange: seq[string] = @[],
                                                dateStart: seq[string] = @[],
                                                dateEnd: seq[string] = @[],
                                                arc: seq[string] = default(seq[string]),
                                                dkim: seq[string] = default(seq[string]),
                                                spf: seq[string] = default(seq[string]),
                                                ipVersion: seq[string] = default(seq[string]),
                                                encrypted: seq[string] = default(seq[string]),
                                                format: set[RadarEmailRoutingFormatOption] = {}): Future[GetRadarEmailRoutingTimeseriesGroupsDmarcResponse] {.async.} =
  ## Retrieves the distribution of emails by DMARC (Domain-based Message
  ## Authentication, Reporting and Conformance) validation over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["arc"] = $arc
  q["dkim"] = $dkim
  q["spf"] = $spf
  q["ipVersion"] = $ipVersion
  q["encrypted"] = $encrypted
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/routing/timeseries_groups/dmarc", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailRoutingTimeseriesGroupsDmarcResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailRoutingTimeseriesGroupsEncrypted*(client: CloudflareClient,
                                                    aggInterval: set[RadarEmailRoutingAggIntervalOption] = {},
                                                    name: seq[string] = @[],
                                                    dateRange: seq[string] = @[],
                                                    dateStart: seq[string] = @[],
                                                    dateEnd: seq[string] = @[],
                                                    arc: seq[string] = default(seq[string]),
                                                    dkim: seq[string] = default(seq[string]),
                                                    dmarc: seq[string] = default(seq[string]),
                                                    spf: seq[string] = default(seq[string]),
                                                    ipVersion: seq[string] = default(seq[string]),
                                                    format: set[RadarEmailRoutingFormatOption] = {}): Future[GetRadarEmailRoutingTimeseriesGroupsEncryptedResponse] {.async.} =
  ## Retrieves the distribution of emails by encryption status (encrypted vs.
  ## not-encrypted) over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["arc"] = $arc
  q["dkim"] = $dkim
  q["dmarc"] = $dmarc
  q["spf"] = $spf
  q["ipVersion"] = $ipVersion
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/routing/timeseries_groups/encrypted", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailRoutingTimeseriesGroupsEncryptedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailRoutingTimeseriesGroupsIpVersion*(client: CloudflareClient,
                                                    aggInterval: set[RadarEmailRoutingAggIntervalOption] = {},
                                                    name: seq[string] = @[],
                                                    dateRange: seq[string] = @[],
                                                    dateStart: seq[string] = @[],
                                                    dateEnd: seq[string] = @[],
                                                    arc: seq[string] = default(seq[string]),
                                                    dkim: seq[string] = default(seq[string]),
                                                    dmarc: seq[string] = default(seq[string]),
                                                    spf: seq[string] = default(seq[string]),
                                                    encrypted: seq[string] = default(seq[string]),
                                                    format: set[RadarEmailRoutingFormatOption] = {}): Future[GetRadarEmailRoutingTimeseriesGroupsIpVersionResponse] {.async.} =
  ## Retrieves the distribution of emails by IP version over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["arc"] = $arc
  q["dkim"] = $dkim
  q["dmarc"] = $dmarc
  q["spf"] = $spf
  q["encrypted"] = $encrypted
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/routing/timeseries_groups/ip_version", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailRoutingTimeseriesGroupsIpVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailRoutingTimeseriesGroupsSpf*(client: CloudflareClient,
                                              aggInterval: set[RadarEmailRoutingAggIntervalOption] = {},
                                              name: seq[string] = @[],
                                              dateRange: seq[string] = @[],
                                              dateStart: seq[string] = @[],
                                              dateEnd: seq[string] = @[],
                                              arc: seq[string] = default(seq[string]),
                                              dkim: seq[string] = default(seq[string]),
                                              dmarc: seq[string] = default(seq[string]),
                                              ipVersion: seq[string] = default(seq[string]),
                                              encrypted: seq[string] = default(seq[string]),
                                              format: set[RadarEmailRoutingFormatOption] = {}): Future[GetRadarEmailRoutingTimeseriesGroupsSpfResponse] {.async.} =
  ## Retrieves the distribution of emails by SPF (Sender Policy Framework) validation
  ## over time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["arc"] = $arc
  q["dkim"] = $dkim
  q["dmarc"] = $dmarc
  q["ipVersion"] = $ipVersion
  q["encrypted"] = $encrypted
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/routing/timeseries_groups/spf", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailRoutingTimeseriesGroupsSpfResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailRoutingTimeseriesGroupsDimension*(client: CloudflareClient,
                                                    dimension: string,
                                                    aggInterval: set[RadarEmailRoutingAggIntervalOption] = {},
                                                    name: seq[string] = @[],
                                                    dateRange: seq[string] = @[],
                                                    dateStart: seq[string] = @[],
                                                    dateEnd: seq[string] = @[],
                                                    arc: seq[string] = default(seq[string]),
                                                    dkim: seq[string] = default(seq[string]),
                                                    dmarc: seq[string] = default(seq[string]),
                                                    spf: seq[string] = default(seq[string]),
                                                    ipVersion: seq[string] = default(seq[string]),
                                                    encrypted: seq[string] = default(seq[string]),
                                                    limitPerGroup: int64 = default(int64),
                                                    format: set[RadarEmailRoutingFormatOption] = {}): Future[GetRadarEmailRoutingTimeseriesGroupsDimensionResponse] {.async.} =
  ## Retrieves the distribution of email routing metrics grouped by dimension over
  ## time.

  var q = initOrderedTable[string, string]()
  for v in aggInterval: q["aggInterval"] = $v
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["arc"] = $arc
  q["dkim"] = $dkim
  q["dmarc"] = $dmarc
  q["spf"] = $spf
  q["ipVersion"] = $ipVersion
  q["encrypted"] = $encrypted
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/email/routing/timeseries_groups/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailRoutingTimeseriesGroupsDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)
