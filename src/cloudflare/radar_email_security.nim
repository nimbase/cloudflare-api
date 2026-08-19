# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetRadarEmailSecuritySummaryArcResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailSecuritySummaryDkimResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailSecuritySummaryDmarcResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailSecuritySummaryMaliciousResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailSecuritySummarySpamResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailSecuritySummarySpfResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailSecuritySummarySpoofResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailSecuritySummaryThreatCategoryResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailSecuritySummaryTlsVersionResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailSecuritySummaryDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailSecurityTimeseriesGroupsArcResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailSecurityTimeseriesGroupsDkimResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailSecurityTimeseriesGroupsDmarcResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailSecurityTimeseriesGroupsMaliciousResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailSecurityTimeseriesGroupsSpamResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailSecurityTimeseriesGroupsSpfResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailSecurityTimeseriesGroupsSpoofResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailSecurityTimeseriesGroupsThreatCategoryResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailSecurityTimeseriesGroupsTlsVersionResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailSecurityTimeseriesGroupsDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailSecurityTopTldsResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailSecurityTopTldsMaliciousMaliciousResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailSecurityTopTldsSpamSpamResponse* = object
    result: JsonNode
    success: bool
  GetRadarEmailSecurityTopTldsSpoofSpoofResponse* = object
    result: JsonNode
    success: bool
  RadarEmailSecurityFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"

  RadarEmailSecurityAggIntervalOption* = enum
    aggInterval15m = "15m"
    aggInterval1h = "1h"
    aggInterval1d = "1d"
    aggInterval1w = "1w"

  RadarEmailSecurityTldCategoryOption* = enum
    tldCategoryCLASSIC = "CLASSIC"
    tldCategoryCOUNTRY = "COUNTRY"


proc getRadarEmailSecuritySummaryArc*(client: CloudflareClient,
                                      name: seq[string] = @[],
                                      dateRange: seq[string] = @[],
                                      dateStart: seq[string] = @[],
                                      dateEnd: seq[string] = @[],
                                      dkim: seq[string] = default(seq[string]),
                                      dmarc: seq[string] = default(seq[string]),
                                      spf: seq[string] = default(seq[string]),
                                      tlsVersion: seq[string] = default(seq[string]),
                                      format: set[RadarEmailSecurityFormatOption] = {}): Future[GetRadarEmailSecuritySummaryArcResponse] {.async.} =
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
  q["tlsVersion"] = $tlsVersion
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/security/summary/arc", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailSecuritySummaryArcResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailSecuritySummaryDkim*(client: CloudflareClient,
                                       name: seq[string] = @[],
                                       dateRange: seq[string] = @[],
                                       dateStart: seq[string] = @[],
                                       dateEnd: seq[string] = @[],
                                       arc: seq[string] = default(seq[string]),
                                       dmarc: seq[string] = default(seq[string]),
                                       spf: seq[string] = default(seq[string]),
                                       tlsVersion: seq[string] = default(seq[string]),
                                       format: set[RadarEmailSecurityFormatOption] = {}): Future[GetRadarEmailSecuritySummaryDkimResponse] {.async.} =
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
  q["tlsVersion"] = $tlsVersion
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/security/summary/dkim", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailSecuritySummaryDkimResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailSecuritySummaryDmarc*(client: CloudflareClient,
                                        name: seq[string] = @[],
                                        dateRange: seq[string] = @[],
                                        dateStart: seq[string] = @[],
                                        dateEnd: seq[string] = @[],
                                        arc: seq[string] = default(seq[string]),
                                        dkim: seq[string] = default(seq[string]),
                                        spf: seq[string] = default(seq[string]),
                                        tlsVersion: seq[string] = default(seq[string]),
                                        format: set[RadarEmailSecurityFormatOption] = {}): Future[GetRadarEmailSecuritySummaryDmarcResponse] {.async.} =
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
  q["tlsVersion"] = $tlsVersion
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/security/summary/dmarc", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailSecuritySummaryDmarcResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailSecuritySummaryMalicious*(client: CloudflareClient,
                                            name: seq[string] = @[],
                                            dateRange: seq[string] = @[],
                                            dateStart: seq[string] = @[],
                                            dateEnd: seq[string] = @[],
                                            arc: seq[string] = default(seq[string]),
                                            dkim: seq[string] = default(seq[string]),
                                            dmarc: seq[string] = default(seq[string]),
                                            spf: seq[string] = default(seq[string]),
                                            tlsVersion: seq[string] = default(seq[string]),
                                            format: set[RadarEmailSecurityFormatOption] = {}): Future[GetRadarEmailSecuritySummaryMaliciousResponse] {.async.} =
  ## Retrieves the distribution of emails by malicious classification.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["arc"] = $arc
  q["dkim"] = $dkim
  q["dmarc"] = $dmarc
  q["spf"] = $spf
  q["tlsVersion"] = $tlsVersion
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/security/summary/malicious", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailSecuritySummaryMaliciousResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailSecuritySummarySpam*(client: CloudflareClient,
                                       name: seq[string] = @[],
                                       dateRange: seq[string] = @[],
                                       dateStart: seq[string] = @[],
                                       dateEnd: seq[string] = @[],
                                       arc: seq[string] = default(seq[string]),
                                       dkim: seq[string] = default(seq[string]),
                                       dmarc: seq[string] = default(seq[string]),
                                       spf: seq[string] = default(seq[string]),
                                       tlsVersion: seq[string] = default(seq[string]),
                                       format: set[RadarEmailSecurityFormatOption] = {}): Future[GetRadarEmailSecuritySummarySpamResponse] {.async.} =
  ## Retrieves the proportion of emails by spam classification (spam vs. non-spam).

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["arc"] = $arc
  q["dkim"] = $dkim
  q["dmarc"] = $dmarc
  q["spf"] = $spf
  q["tlsVersion"] = $tlsVersion
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/security/summary/spam", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailSecuritySummarySpamResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailSecuritySummarySpf*(client: CloudflareClient,
                                      name: seq[string] = @[],
                                      dateRange: seq[string] = @[],
                                      dateStart: seq[string] = @[],
                                      dateEnd: seq[string] = @[],
                                      arc: seq[string] = default(seq[string]),
                                      dkim: seq[string] = default(seq[string]),
                                      dmarc: seq[string] = default(seq[string]),
                                      tlsVersion: seq[string] = default(seq[string]),
                                      format: set[RadarEmailSecurityFormatOption] = {}): Future[GetRadarEmailSecuritySummarySpfResponse] {.async.} =
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
  q["tlsVersion"] = $tlsVersion
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/security/summary/spf", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailSecuritySummarySpfResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailSecuritySummarySpoof*(client: CloudflareClient,
                                        name: seq[string] = @[],
                                        dateRange: seq[string] = @[],
                                        dateStart: seq[string] = @[],
                                        dateEnd: seq[string] = @[],
                                        arc: seq[string] = default(seq[string]),
                                        dkim: seq[string] = default(seq[string]),
                                        dmarc: seq[string] = default(seq[string]),
                                        spf: seq[string] = default(seq[string]),
                                        tlsVersion: seq[string] = default(seq[string]),
                                        format: set[RadarEmailSecurityFormatOption] = {}): Future[GetRadarEmailSecuritySummarySpoofResponse] {.async.} =
  ## Retrieves the proportion of emails by spoof classification (spoof vs.
  ## non-spoof).

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["arc"] = $arc
  q["dkim"] = $dkim
  q["dmarc"] = $dmarc
  q["spf"] = $spf
  q["tlsVersion"] = $tlsVersion
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/security/summary/spoof", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailSecuritySummarySpoofResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailSecuritySummaryThreatCategory*(client: CloudflareClient,
                                                 name: seq[string] = @[],
                                                 dateRange: seq[string] = @[],
                                                 dateStart: seq[string] = @[],
                                                 dateEnd: seq[string] = @[],
                                                 arc: seq[string] = default(seq[string]),
                                                 dkim: seq[string] = default(seq[string]),
                                                 dmarc: seq[string] = default(seq[string]),
                                                 spf: seq[string] = default(seq[string]),
                                                 tlsVersion: seq[string] = default(seq[string]),
                                                 format: set[RadarEmailSecurityFormatOption] = {}): Future[GetRadarEmailSecuritySummaryThreatCategoryResponse] {.async.} =
  ## Retrieves the distribution of emails by threat categories.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["arc"] = $arc
  q["dkim"] = $dkim
  q["dmarc"] = $dmarc
  q["spf"] = $spf
  q["tlsVersion"] = $tlsVersion
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/security/summary/threat_category", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailSecuritySummaryThreatCategoryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailSecuritySummaryTlsVersion*(client: CloudflareClient,
                                             name: seq[string] = @[],
                                             dateRange: seq[string] = @[],
                                             dateStart: seq[string] = @[],
                                             dateEnd: seq[string] = @[],
                                             arc: seq[string] = default(seq[string]),
                                             dkim: seq[string] = default(seq[string]),
                                             dmarc: seq[string] = default(seq[string]),
                                             spf: seq[string] = default(seq[string]),
                                             format: set[RadarEmailSecurityFormatOption] = {}): Future[GetRadarEmailSecuritySummaryTlsVersionResponse] {.async.} =
  ## Retrieves the distribution of emails by TLS version.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["arc"] = $arc
  q["dkim"] = $dkim
  q["dmarc"] = $dmarc
  q["spf"] = $spf
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/security/summary/tls_version", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailSecuritySummaryTlsVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailSecuritySummaryDimension*(client: CloudflareClient,
                                            dimension: string,
                                            name: seq[string] = @[],
                                            dateRange: seq[string] = @[],
                                            dateStart: seq[string] = @[],
                                            dateEnd: seq[string] = @[],
                                            arc: seq[string] = default(seq[string]),
                                            dkim: seq[string] = default(seq[string]),
                                            dmarc: seq[string] = default(seq[string]),
                                            spf: seq[string] = default(seq[string]),
                                            tlsVersion: seq[string] = default(seq[string]),
                                            limitPerGroup: int64 = default(int64),
                                            format: set[RadarEmailSecurityFormatOption] = {}): Future[GetRadarEmailSecuritySummaryDimensionResponse] {.async.} =
  ## Retrieves the distribution of email security metrics by the specified dimension.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["arc"] = $arc
  q["dkim"] = $dkim
  q["dmarc"] = $dmarc
  q["spf"] = $spf
  q["tlsVersion"] = $tlsVersion
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/email/security/summary/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailSecuritySummaryDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailSecurityTimeseriesGroupsArc*(client: CloudflareClient,
                                               aggInterval: set[RadarEmailSecurityAggIntervalOption] = {},
                                               name: seq[string] = @[],
                                               dateRange: seq[string] = @[],
                                               dateStart: seq[string] = @[],
                                               dateEnd: seq[string] = @[],
                                               dkim: seq[string] = default(seq[string]),
                                               dmarc: seq[string] = default(seq[string]),
                                               spf: seq[string] = default(seq[string]),
                                               tlsVersion: seq[string] = default(seq[string]),
                                               format: set[RadarEmailSecurityFormatOption] = {}): Future[GetRadarEmailSecurityTimeseriesGroupsArcResponse] {.async.} =
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
  q["tlsVersion"] = $tlsVersion
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/security/timeseries_groups/arc", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailSecurityTimeseriesGroupsArcResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailSecurityTimeseriesGroupsDkim*(client: CloudflareClient,
                                                aggInterval: set[RadarEmailSecurityAggIntervalOption] = {},
                                                name: seq[string] = @[],
                                                dateRange: seq[string] = @[],
                                                dateStart: seq[string] = @[],
                                                dateEnd: seq[string] = @[],
                                                arc: seq[string] = default(seq[string]),
                                                dmarc: seq[string] = default(seq[string]),
                                                spf: seq[string] = default(seq[string]),
                                                tlsVersion: seq[string] = default(seq[string]),
                                                format: set[RadarEmailSecurityFormatOption] = {}): Future[GetRadarEmailSecurityTimeseriesGroupsDkimResponse] {.async.} =
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
  q["tlsVersion"] = $tlsVersion
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/security/timeseries_groups/dkim", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailSecurityTimeseriesGroupsDkimResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailSecurityTimeseriesGroupsDmarc*(client: CloudflareClient,
                                                 aggInterval: set[RadarEmailSecurityAggIntervalOption] = {},
                                                 name: seq[string] = @[],
                                                 dateRange: seq[string] = @[],
                                                 dateStart: seq[string] = @[],
                                                 dateEnd: seq[string] = @[],
                                                 arc: seq[string] = default(seq[string]),
                                                 dkim: seq[string] = default(seq[string]),
                                                 spf: seq[string] = default(seq[string]),
                                                 tlsVersion: seq[string] = default(seq[string]),
                                                 format: set[RadarEmailSecurityFormatOption] = {}): Future[GetRadarEmailSecurityTimeseriesGroupsDmarcResponse] {.async.} =
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
  q["tlsVersion"] = $tlsVersion
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/security/timeseries_groups/dmarc", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailSecurityTimeseriesGroupsDmarcResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailSecurityTimeseriesGroupsMalicious*(client: CloudflareClient,
                                                     aggInterval: set[RadarEmailSecurityAggIntervalOption] = {},
                                                     name: seq[string] = @[],
                                                     dateRange: seq[string] = @[],
                                                     dateStart: seq[string] = @[],
                                                     dateEnd: seq[string] = @[],
                                                     arc: seq[string] = default(seq[string]),
                                                     dkim: seq[string] = default(seq[string]),
                                                     dmarc: seq[string] = default(seq[string]),
                                                     spf: seq[string] = default(seq[string]),
                                                     tlsVersion: seq[string] = default(seq[string]),
                                                     format: set[RadarEmailSecurityFormatOption] = {}): Future[GetRadarEmailSecurityTimeseriesGroupsMaliciousResponse] {.async.} =
  ## Retrieves the distribution of emails by malicious classification over time.

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
  q["tlsVersion"] = $tlsVersion
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/security/timeseries_groups/malicious", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailSecurityTimeseriesGroupsMaliciousResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailSecurityTimeseriesGroupsSpam*(client: CloudflareClient,
                                                aggInterval: set[RadarEmailSecurityAggIntervalOption] = {},
                                                name: seq[string] = @[],
                                                dateRange: seq[string] = @[],
                                                dateStart: seq[string] = @[],
                                                dateEnd: seq[string] = @[],
                                                arc: seq[string] = default(seq[string]),
                                                dkim: seq[string] = default(seq[string]),
                                                dmarc: seq[string] = default(seq[string]),
                                                spf: seq[string] = default(seq[string]),
                                                tlsVersion: seq[string] = default(seq[string]),
                                                format: set[RadarEmailSecurityFormatOption] = {}): Future[GetRadarEmailSecurityTimeseriesGroupsSpamResponse] {.async.} =
  ## Retrieves the distribution of emails by spam classification (spam vs. non-spam)
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
  q["spf"] = $spf
  q["tlsVersion"] = $tlsVersion
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/security/timeseries_groups/spam", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailSecurityTimeseriesGroupsSpamResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailSecurityTimeseriesGroupsSpf*(client: CloudflareClient,
                                               aggInterval: set[RadarEmailSecurityAggIntervalOption] = {},
                                               name: seq[string] = @[],
                                               dateRange: seq[string] = @[],
                                               dateStart: seq[string] = @[],
                                               dateEnd: seq[string] = @[],
                                               arc: seq[string] = default(seq[string]),
                                               dkim: seq[string] = default(seq[string]),
                                               dmarc: seq[string] = default(seq[string]),
                                               tlsVersion: seq[string] = default(seq[string]),
                                               format: set[RadarEmailSecurityFormatOption] = {}): Future[GetRadarEmailSecurityTimeseriesGroupsSpfResponse] {.async.} =
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
  q["tlsVersion"] = $tlsVersion
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/security/timeseries_groups/spf", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailSecurityTimeseriesGroupsSpfResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailSecurityTimeseriesGroupsSpoof*(client: CloudflareClient,
                                                 aggInterval: set[RadarEmailSecurityAggIntervalOption] = {},
                                                 name: seq[string] = @[],
                                                 dateRange: seq[string] = @[],
                                                 dateStart: seq[string] = @[],
                                                 dateEnd: seq[string] = @[],
                                                 arc: seq[string] = default(seq[string]),
                                                 dkim: seq[string] = default(seq[string]),
                                                 dmarc: seq[string] = default(seq[string]),
                                                 spf: seq[string] = default(seq[string]),
                                                 tlsVersion: seq[string] = default(seq[string]),
                                                 format: set[RadarEmailSecurityFormatOption] = {}): Future[GetRadarEmailSecurityTimeseriesGroupsSpoofResponse] {.async.} =
  ## Retrieves the distribution of emails by spoof classification (spoof vs.
  ## non-spoof) over time.

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
  q["tlsVersion"] = $tlsVersion
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/security/timeseries_groups/spoof", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailSecurityTimeseriesGroupsSpoofResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailSecurityTimeseriesGroupsThreatCategory*(client: CloudflareClient,
                                                          aggInterval: set[RadarEmailSecurityAggIntervalOption] = {},
                                                          name: seq[string] = @[],
                                                          dateRange: seq[string] = @[],
                                                          dateStart: seq[string] = @[],
                                                          dateEnd: seq[string] = @[],
                                                          arc: seq[string] = default(seq[string]),
                                                          dkim: seq[string] = default(seq[string]),
                                                          dmarc: seq[string] = default(seq[string]),
                                                          spf: seq[string] = default(seq[string]),
                                                          tlsVersion: seq[string] = default(seq[string]),
                                                          format: set[RadarEmailSecurityFormatOption] = {}): Future[GetRadarEmailSecurityTimeseriesGroupsThreatCategoryResponse] {.async.} =
  ## Retrieves the distribution of emails by threat category over time.

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
  q["tlsVersion"] = $tlsVersion
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/security/timeseries_groups/threat_category", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailSecurityTimeseriesGroupsThreatCategoryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailSecurityTimeseriesGroupsTlsVersion*(client: CloudflareClient,
                                                      aggInterval: set[RadarEmailSecurityAggIntervalOption] = {},
                                                      name: seq[string] = @[],
                                                      dateRange: seq[string] = @[],
                                                      dateStart: seq[string] = @[],
                                                      dateEnd: seq[string] = @[],
                                                      arc: seq[string] = default(seq[string]),
                                                      dkim: seq[string] = default(seq[string]),
                                                      dmarc: seq[string] = default(seq[string]),
                                                      spf: seq[string] = default(seq[string]),
                                                      format: set[RadarEmailSecurityFormatOption] = {}): Future[GetRadarEmailSecurityTimeseriesGroupsTlsVersionResponse] {.async.} =
  ## Retrieves the distribution of emails by TLS version over time.

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
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/security/timeseries_groups/tls_version", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailSecurityTimeseriesGroupsTlsVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailSecurityTimeseriesGroupsDimension*(client: CloudflareClient,
                                                     dimension: string,
                                                     aggInterval: set[RadarEmailSecurityAggIntervalOption] = {},
                                                     name: seq[string] = @[],
                                                     dateRange: seq[string] = @[],
                                                     dateStart: seq[string] = @[],
                                                     dateEnd: seq[string] = @[],
                                                     arc: seq[string] = default(seq[string]),
                                                     dkim: seq[string] = default(seq[string]),
                                                     dmarc: seq[string] = default(seq[string]),
                                                     spf: seq[string] = default(seq[string]),
                                                     tlsVersion: seq[string] = default(seq[string]),
                                                     limitPerGroup: int64 = default(int64),
                                                     format: set[RadarEmailSecurityFormatOption] = {}): Future[GetRadarEmailSecurityTimeseriesGroupsDimensionResponse] {.async.} =
  ## Retrieves the distribution of email security metrics grouped by dimension over
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
  q["tlsVersion"] = $tlsVersion
  q["limitPerGroup"] = $limitPerGroup
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/email/security/timeseries_groups/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailSecurityTimeseriesGroupsDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailSecurityTopTlds*(client: CloudflareClient, limit: int64 = 5,
                                   name: seq[string] = @[],
                                   dateRange: seq[string] = @[],
                                   dateStart: seq[string] = @[],
                                   dateEnd: seq[string] = @[],
                                   arc: seq[string] = default(seq[string]),
                                   dkim: seq[string] = default(seq[string]),
                                   dmarc: seq[string] = default(seq[string]),
                                   spf: seq[string] = default(seq[string]),
                                   tlsVersion: seq[string] = default(seq[string]),
                                   tldCategory: set[RadarEmailSecurityTldCategoryOption] = {},
                                   format: set[RadarEmailSecurityFormatOption] = {}): Future[GetRadarEmailSecurityTopTldsResponse] {.async.} =
  ## Retrieves the top TLDs by number of email messages.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["arc"] = $arc
  q["dkim"] = $dkim
  q["dmarc"] = $dmarc
  q["spf"] = $spf
  q["tlsVersion"] = $tlsVersion
  for v in tldCategory: q["tldCategory"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/email/security/top/tlds", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailSecurityTopTldsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailSecurityTopTldsMaliciousMalicious*(client: CloudflareClient,
                                                     malicious: string,
                                                     limit: int64 = 5,
                                                     name: seq[string] = @[],
                                                     dateRange: seq[string] = @[],
                                                     dateStart: seq[string] = @[],
                                                     dateEnd: seq[string] = @[],
                                                     arc: seq[string] = default(seq[string]),
                                                     dkim: seq[string] = default(seq[string]),
                                                     dmarc: seq[string] = default(seq[string]),
                                                     spf: seq[string] = default(seq[string]),
                                                     tlsVersion: seq[string] = default(seq[string]),
                                                     tldCategory: set[RadarEmailSecurityTldCategoryOption] = {},
                                                     format: set[RadarEmailSecurityFormatOption] = {}): Future[GetRadarEmailSecurityTopTldsMaliciousMaliciousResponse] {.async.} =
  ## Retrieves the top TLDs by emails classified as malicious or not.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["arc"] = $arc
  q["dkim"] = $dkim
  q["dmarc"] = $dmarc
  q["spf"] = $spf
  q["tlsVersion"] = $tlsVersion
  for v in tldCategory: q["tldCategory"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/email/security/top/tlds/malicious/{malicious}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailSecurityTopTldsMaliciousMaliciousResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailSecurityTopTldsSpamSpam*(client: CloudflareClient,
                                           spam: string, limit: int64 = 5,
                                           name: seq[string] = @[],
                                           dateRange: seq[string] = @[],
                                           dateStart: seq[string] = @[],
                                           dateEnd: seq[string] = @[],
                                           arc: seq[string] = default(seq[string]),
                                           dkim: seq[string] = default(seq[string]),
                                           dmarc: seq[string] = default(seq[string]),
                                           spf: seq[string] = default(seq[string]),
                                           tlsVersion: seq[string] = default(seq[string]),
                                           tldCategory: set[RadarEmailSecurityTldCategoryOption] = {},
                                           format: set[RadarEmailSecurityFormatOption] = {}): Future[GetRadarEmailSecurityTopTldsSpamSpamResponse] {.async.} =
  ## Retrieves the top TLDs by emails classified as spam or not.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["arc"] = $arc
  q["dkim"] = $dkim
  q["dmarc"] = $dmarc
  q["spf"] = $spf
  q["tlsVersion"] = $tlsVersion
  for v in tldCategory: q["tldCategory"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/email/security/top/tlds/spam/{spam}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailSecurityTopTldsSpamSpamResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarEmailSecurityTopTldsSpoofSpoof*(client: CloudflareClient,
                                             spoof: string, limit: int64 = 5,
                                             name: seq[string] = @[],
                                             dateRange: seq[string] = @[],
                                             dateStart: seq[string] = @[],
                                             dateEnd: seq[string] = @[],
                                             arc: seq[string] = default(seq[string]),
                                             dkim: seq[string] = default(seq[string]),
                                             dmarc: seq[string] = default(seq[string]),
                                             spf: seq[string] = default(seq[string]),
                                             tlsVersion: seq[string] = default(seq[string]),
                                             tldCategory: set[RadarEmailSecurityTldCategoryOption] = {},
                                             format: set[RadarEmailSecurityFormatOption] = {}): Future[GetRadarEmailSecurityTopTldsSpoofSpoofResponse] {.async.} =
  ## Retrieves the top TLDs by emails classified as spoof or not.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["arc"] = $arc
  q["dkim"] = $dkim
  q["dmarc"] = $dmarc
  q["spf"] = $spf
  q["tlsVersion"] = $tlsVersion
  for v in tldCategory: q["tldCategory"] = $v
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/radar/email/security/top/tlds/spoof/{spoof}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarEmailSecurityTopTldsSpoofSpoofResponse)
  else:
    raise newException(CloudflareClientError, body)
