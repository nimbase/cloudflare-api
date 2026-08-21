# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetRadarCtAuthoritiesResponse* = object
    result: JsonNode
    success: bool
  GetRadarCtAuthoritiesCaSlugResponse* = object
    result: JsonNode
    success: bool
  GetRadarCtLogsResponse* = object
    result: JsonNode
    success: bool
  GetRadarCtLogsLogSlugResponse* = object
    result: JsonNode
    success: bool
  GetRadarCtSummaryDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarCtTimeseriesResponse* = object
    result: JsonNode
    success: bool
  GetRadarCtTimeseriesGroupsDimensionResponse* = object
    result: JsonNode
    success: bool
  RadarCertificateTransparencyFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"

  RadarCertificateTransparencyNormalizationOption* = enum
    normalizationRAWVALUES = "RAW_VALUES"
    normalizationPERCENTAGE = "PERCENTAGE"

  RadarCertificateTransparencyAggIntervalOption* = enum
    aggInterval15m = "15m"
    aggInterval1h = "1h"
    aggInterval1d = "1d"
    aggInterval1w = "1w"


proc getRadarCtAuthorities*(client: CloudflareClient, limit: int64 = 5,
                            offset: int64 = default(int64),
                            format: RadarCertificateTransparencyFormatOption): Future[GetRadarCtAuthoritiesResponse] {.async.} =
  ## Retrieves a list of certificate authorities.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["offset"] = $offset
  q["format"] = $format
  let res = await client.httpGET("/radar/ct/authorities", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarCtAuthoritiesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarCtAuthoritiesCaSlug*(client: CloudflareClient, caSlug: string,
                                  format: RadarCertificateTransparencyFormatOption): Future[GetRadarCtAuthoritiesCaSlugResponse] {.async.} =
  ## Retrieves the requested CA information.

  var q = initOrderedTable[string, string]()
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/ct/authorities/{caSlug}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarCtAuthoritiesCaSlugResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarCtLogs*(client: CloudflareClient, limit: int64 = 5,
                     offset: int64 = default(int64),
                     format: RadarCertificateTransparencyFormatOption): Future[GetRadarCtLogsResponse] {.async.} =
  ## Retrieves a list of certificate logs.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["offset"] = $offset
  q["format"] = $format
  let res = await client.httpGET("/radar/ct/logs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarCtLogsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarCtLogsLogSlug*(client: CloudflareClient, logSlug: string,
                            format: RadarCertificateTransparencyFormatOption): Future[GetRadarCtLogsLogSlugResponse] {.async.} =
  ## Retrieves the requested certificate log information.

  var q = initOrderedTable[string, string]()
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/ct/logs/{logSlug}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarCtLogsLogSlugResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarCtSummaryDimension*(client: CloudflareClient, dimension: Dimension,
                                 name: seq[string] = @[],
                                 dateRange: seq[string] = @[],
                                 dateStart: seq[string] = @[],
                                 dateEnd: seq[string] = @[],
                                 limitPerGroup: int64 = default(int64),
                                 ca: seq[string] = @[],
                                 caOwner: seq[string] = @[],
                                 duration: seq[string] = default(seq[string]),
                                 entryType: seq[string] = default(seq[string]),
                                 expirationStatus: seq[string] = default(seq[string]),
                                 hasIps: seq[string] = @[],
                                 hasWildcards: seq[string] = @[],
                                 log: seq[string] = @[],
                                 logApi: seq[string] = default(seq[string]),
                                 logOperator: seq[string] = @[],
                                 publicKeyAlgorithm: seq[string] = default(seq[string]),
                                 signatureAlgorithm: seq[string] = default(seq[string]),
                                 tld: seq[string] = @[],
                                 validationLevel: seq[string] = default(seq[string]),
                                 uniqueEntries: seq[string] = default(seq[string]),
                                 normalization: RadarCertificateTransparencyNormalizationOption = normalizationRAWVALUES,
                                 format: RadarCertificateTransparencyFormatOption): Future[GetRadarCtSummaryDimensionResponse] {.async.} =
  ## Retrieves an aggregated summary of certificates grouped by the specified
  ## dimension.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["limitPerGroup"] = $limitPerGroup
  for v in ca: q["ca"] = $v
  for v in caOwner: q["caOwner"] = $v
  q["duration"] = $duration
  q["entryType"] = $entryType
  q["expirationStatus"] = $expirationStatus
  for v in hasIps: q["hasIps"] = $v
  for v in hasWildcards: q["hasWildcards"] = $v
  for v in log: q["log"] = $v
  q["logApi"] = $logApi
  for v in logOperator: q["logOperator"] = $v
  q["publicKeyAlgorithm"] = $publicKeyAlgorithm
  q["signatureAlgorithm"] = $signatureAlgorithm
  for v in tld: q["tld"] = $v
  q["validationLevel"] = $validationLevel
  q["uniqueEntries"] = $uniqueEntries
  q["normalization"] = $normalization
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/ct/summary/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarCtSummaryDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarCtTimeseries*(client: CloudflareClient,
                           aggInterval: RadarCertificateTransparencyAggIntervalOption,
                           name: seq[string] = @[], dateRange: seq[string] = @[],
                           dateStart: seq[string] = @[],
                           dateEnd: seq[string] = @[], ca: seq[string] = @[],
                           caOwner: seq[string] = @[],
                           duration: seq[string] = default(seq[string]),
                           entryType: seq[string] = default(seq[string]),
                           expirationStatus: seq[string] = default(seq[string]),
                           hasIps: seq[string] = @[],
                           hasWildcards: seq[string] = @[],
                           log: seq[string] = @[],
                           logApi: seq[string] = default(seq[string]),
                           logOperator: seq[string] = @[],
                           publicKeyAlgorithm: seq[string] = default(seq[string]),
                           signatureAlgorithm: seq[string] = default(seq[string]),
                           tld: seq[string] = @[],
                           validationLevel: seq[string] = default(seq[string]),
                           uniqueEntries: seq[string] = default(seq[string]),
                           format: RadarCertificateTransparencyFormatOption): Future[GetRadarCtTimeseriesResponse] {.async.} =
  ## Retrieves certificate volume over time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in ca: q["ca"] = $v
  for v in caOwner: q["caOwner"] = $v
  q["duration"] = $duration
  q["entryType"] = $entryType
  q["expirationStatus"] = $expirationStatus
  for v in hasIps: q["hasIps"] = $v
  for v in hasWildcards: q["hasWildcards"] = $v
  for v in log: q["log"] = $v
  q["logApi"] = $logApi
  for v in logOperator: q["logOperator"] = $v
  q["publicKeyAlgorithm"] = $publicKeyAlgorithm
  q["signatureAlgorithm"] = $signatureAlgorithm
  for v in tld: q["tld"] = $v
  q["validationLevel"] = $validationLevel
  q["uniqueEntries"] = $uniqueEntries
  q["format"] = $format
  let res = await client.httpGET("/radar/ct/timeseries", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarCtTimeseriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarCtTimeseriesGroupsDimension*(client: CloudflareClient,
                                          dimension: Dimension,
                                          aggInterval: RadarCertificateTransparencyAggIntervalOption,
                                          name: seq[string] = @[],
                                          dateRange: seq[string] = @[],
                                          dateStart: seq[string] = @[],
                                          dateEnd: seq[string] = @[],
                                          limitPerGroup: int64 = default(int64),
                                          ca: seq[string] = @[],
                                          caOwner: seq[string] = @[],
                                          duration: seq[string] = default(seq[string]),
                                          entryType: seq[string] = default(seq[string]),
                                          expirationStatus: seq[string] = default(seq[string]),
                                          hasIps: seq[string] = @[],
                                          hasWildcards: seq[string] = @[],
                                          log: seq[string] = @[],
                                          logApi: seq[string] = default(seq[string]),
                                          logOperator: seq[string] = @[],
                                          publicKeyAlgorithm: seq[string] = default(seq[string]),
                                          signatureAlgorithm: seq[string] = default(seq[string]),
                                          validationLevel: seq[string] = default(seq[string]),
                                          tld: seq[string] = @[],
                                          normalization: RadarCertificateTransparencyNormalizationOption = normalizationRAWVALUES,
                                          uniqueEntries: seq[string] = default(seq[string]),
                                          format: RadarCertificateTransparencyFormatOption): Future[GetRadarCtTimeseriesGroupsDimensionResponse] {.async.} =
  ## Retrieves the distribution of certificates grouped by the specified dimension
  ## over time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["limitPerGroup"] = $limitPerGroup
  for v in ca: q["ca"] = $v
  for v in caOwner: q["caOwner"] = $v
  q["duration"] = $duration
  q["entryType"] = $entryType
  q["expirationStatus"] = $expirationStatus
  for v in hasIps: q["hasIps"] = $v
  for v in hasWildcards: q["hasWildcards"] = $v
  for v in log: q["log"] = $v
  q["logApi"] = $logApi
  for v in logOperator: q["logOperator"] = $v
  q["publicKeyAlgorithm"] = $publicKeyAlgorithm
  q["signatureAlgorithm"] = $signatureAlgorithm
  q["validationLevel"] = $validationLevel
  for v in tld: q["tld"] = $v
  q["normalization"] = $normalization
  q["uniqueEntries"] = $uniqueEntries
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/ct/timeseries_groups/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarCtTimeseriesGroupsDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)
