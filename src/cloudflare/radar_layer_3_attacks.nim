# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetRadarAttacksLayer3SummaryBitrateResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer3SummaryDurationResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer3SummaryIndustryResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer3SummaryIpVersionResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer3SummaryProtocolResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer3SummaryVectorResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer3SummaryVerticalResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer3SummaryDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer3TimeseriesResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer3TimeseriesGroupsBitrateResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer3TimeseriesGroupsDurationResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer3TimeseriesGroupsIndustryResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer3TimeseriesGroupsIpVersionResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer3TimeseriesGroupsProtocolResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer3TimeseriesGroupsVectorResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer3TimeseriesGroupsVerticalResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer3TimeseriesGroupsDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer3TopAttacksResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer3TopIndustryResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer3TopLocationsOriginResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer3TopLocationsTargetResponse* = object
    result: JsonNode
    success: bool
  GetRadarAttacksLayer3TopVerticalResponse* = object
    result: JsonNode
    success: bool
  RadarLayer3AttackDirectionOption* = enum
    directionORIGIN = "ORIGIN"
    directionTARGET = "TARGET"

  RadarLayer3AttackFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"

  RadarLayer3AttackAggIntervalOption* = enum
    aggInterval15m = "15m"
    aggInterval1h = "1h"
    aggInterval1d = "1d"
    aggInterval1w = "1w"

  RadarLayer3AttackNormalizationOption* = enum
    normalizationPERCENTAGECHANGE = "PERCENTAGE_CHANGE"
    normalizationMIN0MAX = "MIN0_MAX"

  RadarLayer3AttackMetricOption* = enum
    metricBYTES = "BYTES"
    metricBYTESOLD = "BYTES_OLD"

  RadarLayer3AttackLimitDirectionOption* = enum
    limitDirectionORIGIN = "ORIGIN"
    limitDirectionTARGET = "TARGET"

  RadarLayer3AttackMagnitudeOption* = enum
    magnitudeMITIGATEDBYTES = "MITIGATED_BYTES"
    magnitudeMITIGATEDATTACKS = "MITIGATED_ATTACKS"


proc getRadarAttacksLayer3SummaryBitrate*(client: CloudflareClient,
                                          name: seq[string] = @[],
                                          dateRange: seq[string] = @[],
                                          dateStart: seq[string] = @[],
                                          dateEnd: seq[string] = @[],
                                          location: seq[string] = @[],
                                          continent: seq[string] = @[],
                                          ipVersion: seq[string] = default(seq[string]),
                                          protocol: seq[string] = default(seq[string]),
                                          direction: RadarLayer3AttackDirectionOption = directionORIGIN,
                                          format: RadarLayer3AttackFormatOption): Future[GetRadarAttacksLayer3SummaryBitrateResponse] {.async.} =
  ## Retrieves the distribution of layer 3 attacks by bitrate.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["protocol"] = $protocol
  q["direction"] = $direction
  q["format"] = $format
  let res = await client.httpGET("/radar/attacks/layer3/summary/bitrate", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer3SummaryBitrateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer3SummaryDuration*(client: CloudflareClient,
                                           name: seq[string] = @[],
                                           dateRange: seq[string] = @[],
                                           dateStart: seq[string] = @[],
                                           dateEnd: seq[string] = @[],
                                           location: seq[string] = @[],
                                           continent: seq[string] = @[],
                                           ipVersion: seq[string] = default(seq[string]),
                                           protocol: seq[string] = default(seq[string]),
                                           direction: RadarLayer3AttackDirectionOption = directionORIGIN,
                                           format: RadarLayer3AttackFormatOption): Future[GetRadarAttacksLayer3SummaryDurationResponse] {.async.} =
  ## Retrieves the distribution of layer 3 attacks by duration.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["protocol"] = $protocol
  q["direction"] = $direction
  q["format"] = $format
  let res = await client.httpGET("/radar/attacks/layer3/summary/duration", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer3SummaryDurationResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer3SummaryIndustry*(client: CloudflareClient,
                                           name: seq[string] = @[],
                                           dateRange: seq[string] = @[],
                                           dateStart: seq[string] = @[],
                                           dateEnd: seq[string] = @[],
                                           location: seq[string] = @[],
                                           continent: seq[string] = @[],
                                           ipVersion: seq[string] = default(seq[string]),
                                           protocol: seq[string] = default(seq[string]),
                                           direction: RadarLayer3AttackDirectionOption = directionORIGIN,
                                           limitPerGroup: int64 = default(int64),
                                           format: RadarLayer3AttackFormatOption): Future[GetRadarAttacksLayer3SummaryIndustryResponse] {.async.} =
  ## Retrieves the distribution of layer 3 attacks by targeted industry.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["protocol"] = $protocol
  q["direction"] = $direction
  q["limitPerGroup"] = $limitPerGroup
  q["format"] = $format
  let res = await client.httpGET("/radar/attacks/layer3/summary/industry", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer3SummaryIndustryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer3SummaryIpVersion*(client: CloudflareClient,
                                            name: seq[string] = @[],
                                            dateRange: seq[string] = @[],
                                            dateStart: seq[string] = @[],
                                            dateEnd: seq[string] = @[],
                                            location: seq[string] = @[],
                                            continent: seq[string] = @[],
                                            protocol: seq[string] = default(seq[string]),
                                            direction: RadarLayer3AttackDirectionOption = directionORIGIN,
                                            format: RadarLayer3AttackFormatOption): Future[GetRadarAttacksLayer3SummaryIpVersionResponse] {.async.} =
  ## Retrieves the distribution of layer 3 attacks by IP version.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["protocol"] = $protocol
  q["direction"] = $direction
  q["format"] = $format
  let res = await client.httpGET("/radar/attacks/layer3/summary/ip_version", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer3SummaryIpVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer3SummaryProtocol*(client: CloudflareClient,
                                           name: seq[string] = @[],
                                           dateRange: seq[string] = @[],
                                           dateStart: seq[string] = @[],
                                           dateEnd: seq[string] = @[],
                                           location: seq[string] = @[],
                                           continent: seq[string] = @[],
                                           ipVersion: seq[string] = default(seq[string]),
                                           direction: RadarLayer3AttackDirectionOption = directionORIGIN,
                                           format: RadarLayer3AttackFormatOption): Future[GetRadarAttacksLayer3SummaryProtocolResponse] {.async.} =
  ## Retrieves the distribution of layer 3 attacks by protocol.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["direction"] = $direction
  q["format"] = $format
  let res = await client.httpGET("/radar/attacks/layer3/summary/protocol", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer3SummaryProtocolResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer3SummaryVector*(client: CloudflareClient,
                                         name: seq[string] = @[],
                                         dateRange: seq[string] = @[],
                                         dateStart: seq[string] = @[],
                                         dateEnd: seq[string] = @[],
                                         location: seq[string] = @[],
                                         continent: seq[string] = @[],
                                         ipVersion: seq[string] = default(seq[string]),
                                         protocol: seq[string] = default(seq[string]),
                                         direction: RadarLayer3AttackDirectionOption = directionORIGIN,
                                         limitPerGroup: int64 = default(int64),
                                         format: RadarLayer3AttackFormatOption): Future[GetRadarAttacksLayer3SummaryVectorResponse] {.async.} =
  ## Retrieves the distribution of layer 3 attacks by vector.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["protocol"] = $protocol
  q["direction"] = $direction
  q["limitPerGroup"] = $limitPerGroup
  q["format"] = $format
  let res = await client.httpGET("/radar/attacks/layer3/summary/vector", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer3SummaryVectorResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer3SummaryVertical*(client: CloudflareClient,
                                           name: seq[string] = @[],
                                           dateRange: seq[string] = @[],
                                           dateStart: seq[string] = @[],
                                           dateEnd: seq[string] = @[],
                                           location: seq[string] = @[],
                                           continent: seq[string] = @[],
                                           ipVersion: seq[string] = default(seq[string]),
                                           protocol: seq[string] = default(seq[string]),
                                           direction: RadarLayer3AttackDirectionOption = directionORIGIN,
                                           limitPerGroup: int64 = default(int64),
                                           format: RadarLayer3AttackFormatOption): Future[GetRadarAttacksLayer3SummaryVerticalResponse] {.async.} =
  ## Retrieves the distribution of layer 3 attacks by targeted vertical.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["protocol"] = $protocol
  q["direction"] = $direction
  q["limitPerGroup"] = $limitPerGroup
  q["format"] = $format
  let res = await client.httpGET("/radar/attacks/layer3/summary/vertical", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer3SummaryVerticalResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer3SummaryDimension*(client: CloudflareClient,
                                            dimension: Dimension,
                                            name: seq[string] = @[],
                                            dateRange: seq[string] = @[],
                                            dateStart: seq[string] = @[],
                                            dateEnd: seq[string] = @[],
                                            location: seq[string] = @[],
                                            continent: seq[string] = @[],
                                            ipVersion: seq[string] = default(seq[string]),
                                            protocol: seq[string] = default(seq[string]),
                                            direction: RadarLayer3AttackDirectionOption = directionORIGIN,
                                            limitPerGroup: int64 = default(int64),
                                            format: RadarLayer3AttackFormatOption): Future[GetRadarAttacksLayer3SummaryDimensionResponse] {.async.} =
  ## Retrieves the distribution of layer 3 attacks by the specified dimension.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["protocol"] = $protocol
  q["direction"] = $direction
  q["limitPerGroup"] = $limitPerGroup
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/attacks/layer3/summary/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer3SummaryDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer3Timeseries*(client: CloudflareClient,
                                      aggInterval: RadarLayer3AttackAggIntervalOption,
                                      name: seq[string] = @[],
                                      dateRange: seq[string] = @[],
                                      dateStart: seq[string] = @[],
                                      dateEnd: seq[string] = @[],
                                      asn: seq[string] = @[],
                                      location: seq[string] = @[],
                                      continent: seq[string] = @[],
                                      ipVersion: seq[string] = default(seq[string]),
                                      protocol: seq[string] = default(seq[string]),
                                      normalization: RadarLayer3AttackNormalizationOption,
                                      metric: RadarLayer3AttackMetricOption = metricBytes,
                                      direction: RadarLayer3AttackDirectionOption = directionORIGIN,
                                      format: RadarLayer3AttackFormatOption): Future[GetRadarAttacksLayer3TimeseriesResponse] {.async.} =
  ## Retrieves layer 3 attacks over time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["protocol"] = $protocol
  q["normalization"] = $normalization
  q["metric"] = $metric
  q["direction"] = $direction
  q["format"] = $format
  let res = await client.httpGET("/radar/attacks/layer3/timeseries", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer3TimeseriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer3TimeseriesGroupsBitrate*(client: CloudflareClient,
                                                   aggInterval: RadarLayer3AttackAggIntervalOption,
                                                   name: seq[string] = @[],
                                                   dateRange: seq[string] = @[],
                                                   dateStart: seq[string] = @[],
                                                   dateEnd: seq[string] = @[],
                                                   location: seq[string] = @[],
                                                   continent: seq[string] = @[],
                                                   ipVersion: seq[string] = default(seq[string]),
                                                   protocol: seq[string] = default(seq[string]),
                                                   normalization: RadarLayer3AttackNormalizationOption = normalizationPERCENTAGE,
                                                   direction: RadarLayer3AttackDirectionOption = directionORIGIN,
                                                   format: RadarLayer3AttackFormatOption): Future[GetRadarAttacksLayer3TimeseriesGroupsBitrateResponse] {.async.} =
  ## Retrieves the distribution of layer 3 attacks by bitrate over time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["protocol"] = $protocol
  q["normalization"] = $normalization
  q["direction"] = $direction
  q["format"] = $format
  let res = await client.httpGET("/radar/attacks/layer3/timeseries_groups/bitrate", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer3TimeseriesGroupsBitrateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer3TimeseriesGroupsDuration*(client: CloudflareClient,
                                                    aggInterval: RadarLayer3AttackAggIntervalOption,
                                                    name: seq[string] = @[],
                                                    dateRange: seq[string] = @[],
                                                    dateStart: seq[string] = @[],
                                                    dateEnd: seq[string] = @[],
                                                    location: seq[string] = @[],
                                                    continent: seq[string] = @[],
                                                    ipVersion: seq[string] = default(seq[string]),
                                                    protocol: seq[string] = default(seq[string]),
                                                    normalization: RadarLayer3AttackNormalizationOption = normalizationPERCENTAGE,
                                                    direction: RadarLayer3AttackDirectionOption = directionORIGIN,
                                                    format: RadarLayer3AttackFormatOption): Future[GetRadarAttacksLayer3TimeseriesGroupsDurationResponse] {.async.} =
  ## Retrieves the distribution of layer 3 attacks by duration over time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["protocol"] = $protocol
  q["normalization"] = $normalization
  q["direction"] = $direction
  q["format"] = $format
  let res = await client.httpGET("/radar/attacks/layer3/timeseries_groups/duration", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer3TimeseriesGroupsDurationResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer3TimeseriesGroupsIndustry*(client: CloudflareClient,
                                                    aggInterval: RadarLayer3AttackAggIntervalOption,
                                                    name: seq[string] = @[],
                                                    dateRange: seq[string] = @[],
                                                    dateStart: seq[string] = @[],
                                                    dateEnd: seq[string] = @[],
                                                    location: seq[string] = @[],
                                                    continent: seq[string] = @[],
                                                    ipVersion: seq[string] = default(seq[string]),
                                                    protocol: seq[string] = default(seq[string]),
                                                    normalization: RadarLayer3AttackNormalizationOption = normalizationPERCENTAGE,
                                                    direction: RadarLayer3AttackDirectionOption = directionORIGIN,
                                                    limitPerGroup: int64 = default(int64),
                                                    format: RadarLayer3AttackFormatOption): Future[GetRadarAttacksLayer3TimeseriesGroupsIndustryResponse] {.async.} =
  ## Retrieves the distribution of layer 3 attacks by targeted industry over time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["protocol"] = $protocol
  q["normalization"] = $normalization
  q["direction"] = $direction
  q["limitPerGroup"] = $limitPerGroup
  q["format"] = $format
  let res = await client.httpGET("/radar/attacks/layer3/timeseries_groups/industry", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer3TimeseriesGroupsIndustryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer3TimeseriesGroupsIpVersion*(client: CloudflareClient,
                                                     aggInterval: RadarLayer3AttackAggIntervalOption,
                                                     name: seq[string] = @[],
                                                     dateRange: seq[string] = @[],
                                                     dateStart: seq[string] = @[],
                                                     dateEnd: seq[string] = @[],
                                                     location: seq[string] = @[],
                                                     continent: seq[string] = @[],
                                                     protocol: seq[string] = default(seq[string]),
                                                     normalization: RadarLayer3AttackNormalizationOption = normalizationPERCENTAGE,
                                                     direction: RadarLayer3AttackDirectionOption = directionORIGIN,
                                                     format: RadarLayer3AttackFormatOption): Future[GetRadarAttacksLayer3TimeseriesGroupsIpVersionResponse] {.async.} =
  ## Retrieves the distribution of layer 3 attacks by IP version over time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["protocol"] = $protocol
  q["normalization"] = $normalization
  q["direction"] = $direction
  q["format"] = $format
  let res = await client.httpGET("/radar/attacks/layer3/timeseries_groups/ip_version", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer3TimeseriesGroupsIpVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer3TimeseriesGroupsProtocol*(client: CloudflareClient,
                                                    aggInterval: RadarLayer3AttackAggIntervalOption,
                                                    name: seq[string] = @[],
                                                    dateRange: seq[string] = @[],
                                                    dateStart: seq[string] = @[],
                                                    dateEnd: seq[string] = @[],
                                                    location: seq[string] = @[],
                                                    continent: seq[string] = @[],
                                                    ipVersion: seq[string] = default(seq[string]),
                                                    normalization: RadarLayer3AttackNormalizationOption = normalizationPERCENTAGE,
                                                    direction: RadarLayer3AttackDirectionOption = directionORIGIN,
                                                    format: RadarLayer3AttackFormatOption): Future[GetRadarAttacksLayer3TimeseriesGroupsProtocolResponse] {.async.} =
  ## Retrieves the distribution of layer 3 attacks by protocol over time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["normalization"] = $normalization
  q["direction"] = $direction
  q["format"] = $format
  let res = await client.httpGET("/radar/attacks/layer3/timeseries_groups/protocol", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer3TimeseriesGroupsProtocolResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer3TimeseriesGroupsVector*(client: CloudflareClient,
                                                  aggInterval: RadarLayer3AttackAggIntervalOption,
                                                  name: seq[string] = @[],
                                                  dateRange: seq[string] = @[],
                                                  dateStart: seq[string] = @[],
                                                  dateEnd: seq[string] = @[],
                                                  location: seq[string] = @[],
                                                  continent: seq[string] = @[],
                                                  ipVersion: seq[string] = default(seq[string]),
                                                  protocol: seq[string] = default(seq[string]),
                                                  normalization: RadarLayer3AttackNormalizationOption = normalizationPERCENTAGE,
                                                  direction: RadarLayer3AttackDirectionOption = directionORIGIN,
                                                  limitPerGroup: int64 = default(int64),
                                                  format: RadarLayer3AttackFormatOption): Future[GetRadarAttacksLayer3TimeseriesGroupsVectorResponse] {.async.} =
  ## Retrieves the distribution of layer 3 attacks by vector over time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["protocol"] = $protocol
  q["normalization"] = $normalization
  q["direction"] = $direction
  q["limitPerGroup"] = $limitPerGroup
  q["format"] = $format
  let res = await client.httpGET("/radar/attacks/layer3/timeseries_groups/vector", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer3TimeseriesGroupsVectorResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer3TimeseriesGroupsVertical*(client: CloudflareClient,
                                                    aggInterval: RadarLayer3AttackAggIntervalOption,
                                                    name: seq[string] = @[],
                                                    dateRange: seq[string] = @[],
                                                    dateStart: seq[string] = @[],
                                                    dateEnd: seq[string] = @[],
                                                    location: seq[string] = @[],
                                                    continent: seq[string] = @[],
                                                    ipVersion: seq[string] = default(seq[string]),
                                                    protocol: seq[string] = default(seq[string]),
                                                    normalization: RadarLayer3AttackNormalizationOption = normalizationPERCENTAGE,
                                                    direction: RadarLayer3AttackDirectionOption = directionORIGIN,
                                                    limitPerGroup: int64 = default(int64),
                                                    format: RadarLayer3AttackFormatOption): Future[GetRadarAttacksLayer3TimeseriesGroupsVerticalResponse] {.async.} =
  ## Retrieves the distribution of layer 3 attacks by targeted vertical over time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["protocol"] = $protocol
  q["normalization"] = $normalization
  q["direction"] = $direction
  q["limitPerGroup"] = $limitPerGroup
  q["format"] = $format
  let res = await client.httpGET("/radar/attacks/layer3/timeseries_groups/vertical", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer3TimeseriesGroupsVerticalResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer3TimeseriesGroupsDimension*(client: CloudflareClient,
                                                     dimension: Dimension,
                                                     aggInterval: RadarLayer3AttackAggIntervalOption,
                                                     name: seq[string] = @[],
                                                     dateRange: seq[string] = @[],
                                                     dateStart: seq[string] = @[],
                                                     dateEnd: seq[string] = @[],
                                                     location: seq[string] = @[],
                                                     continent: seq[string] = @[],
                                                     ipVersion: seq[string] = default(seq[string]),
                                                     protocol: seq[string] = default(seq[string]),
                                                     normalization: RadarLayer3AttackNormalizationOption = normalizationPERCENTAGE,
                                                     direction: RadarLayer3AttackDirectionOption = directionORIGIN,
                                                     limitPerGroup: int64 = default(int64),
                                                     format: RadarLayer3AttackFormatOption): Future[GetRadarAttacksLayer3TimeseriesGroupsDimensionResponse] {.async.} =
  ## Retrieves the distribution of layer 3 attacks grouped by dimension over time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["protocol"] = $protocol
  q["normalization"] = $normalization
  q["direction"] = $direction
  q["limitPerGroup"] = $limitPerGroup
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/attacks/layer3/timeseries_groups/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer3TimeseriesGroupsDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer3TopAttacks*(client: CloudflareClient, limit: int64 = 5,
                                      name: seq[string] = @[],
                                      dateRange: seq[string] = @[],
                                      dateStart: seq[string] = @[],
                                      dateEnd: seq[string] = @[],
                                      location: seq[string] = @[],
                                      continent: seq[string] = @[],
                                      ipVersion: seq[string] = default(seq[string]),
                                      protocol: seq[string] = default(seq[string]),
                                      limitDirection: RadarLayer3AttackLimitDirectionOption = limitDirectionORIGIN,
                                      limitPerLocation: int64 = 10,
                                      magnitude: RadarLayer3AttackMagnitudeOption,
                                      normalization: RadarLayer3AttackNormalizationOption = normalizationPERCENTAGE,
                                      format: RadarLayer3AttackFormatOption): Future[GetRadarAttacksLayer3TopAttacksResponse] {.async.} =
  ## Retrieves the top layer 3 attacks from origin to target location. Values are a
  ## percentage out of the total layer 3 attacks (with billing country). You can
  ## optionally limit the number of attacks by origin/target location (useful if all
  ## the top attacks are from or to the same location).

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["protocol"] = $protocol
  q["limitDirection"] = $limitDirection
  q["limitPerLocation"] = $limitPerLocation
  q["magnitude"] = $magnitude
  q["normalization"] = $normalization
  q["format"] = $format
  let res = await client.httpGET("/radar/attacks/layer3/top/attacks", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer3TopAttacksResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer3TopIndustry*(client: CloudflareClient,
                                       limit: int64 = 5, name: seq[string] = @[],
                                       dateRange: seq[string] = @[],
                                       dateStart: seq[string] = @[],
                                       dateEnd: seq[string] = @[],
                                       location: seq[string] = @[],
                                       continent: seq[string] = @[],
                                       ipVersion: seq[string] = default(seq[string]),
                                       protocol: seq[string] = default(seq[string]),
                                       format: RadarLayer3AttackFormatOption): Future[GetRadarAttacksLayer3TopIndustryResponse] {.async.} =
  ## This endpoint is deprecated. To continue getting this data, switch to the
  ## summary by industry endpoint.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["protocol"] = $protocol
  q["format"] = $format
  let res = await client.httpGET("/radar/attacks/layer3/top/industry", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer3TopIndustryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer3TopLocationsOrigin*(client: CloudflareClient,
                                              limit: int64 = 5,
                                              name: seq[string] = @[],
                                              dateRange: seq[string] = @[],
                                              dateStart: seq[string] = @[],
                                              dateEnd: seq[string] = @[],
                                              location: seq[string] = @[],
                                              continent: seq[string] = @[],
                                              ipVersion: seq[string] = default(seq[string]),
                                              protocol: seq[string] = default(seq[string]),
                                              format: RadarLayer3AttackFormatOption): Future[GetRadarAttacksLayer3TopLocationsOriginResponse] {.async.} =
  ## Retrieves the origin locations of layer 3 attacks.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["protocol"] = $protocol
  q["format"] = $format
  let res = await client.httpGET("/radar/attacks/layer3/top/locations/origin", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer3TopLocationsOriginResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer3TopLocationsTarget*(client: CloudflareClient,
                                              limit: int64 = 5,
                                              name: seq[string] = @[],
                                              dateRange: seq[string] = @[],
                                              dateStart: seq[string] = @[],
                                              dateEnd: seq[string] = @[],
                                              location: seq[string] = @[],
                                              continent: seq[string] = @[],
                                              ipVersion: seq[string] = default(seq[string]),
                                              protocol: seq[string] = default(seq[string]),
                                              format: RadarLayer3AttackFormatOption): Future[GetRadarAttacksLayer3TopLocationsTargetResponse] {.async.} =
  ## Retrieves the target locations of layer 3 attacks.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["protocol"] = $protocol
  q["format"] = $format
  let res = await client.httpGET("/radar/attacks/layer3/top/locations/target", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer3TopLocationsTargetResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarAttacksLayer3TopVertical*(client: CloudflareClient,
                                       limit: int64 = 5, name: seq[string] = @[],
                                       dateRange: seq[string] = @[],
                                       dateStart: seq[string] = @[],
                                       dateEnd: seq[string] = @[],
                                       location: seq[string] = @[],
                                       continent: seq[string] = @[],
                                       ipVersion: seq[string] = default(seq[string]),
                                       protocol: seq[string] = default(seq[string]),
                                       format: RadarLayer3AttackFormatOption): Future[GetRadarAttacksLayer3TopVerticalResponse] {.async.} =
  ## This endpoint is deprecated. To continue getting this data, switch to the
  ## summary by vertical endpoint.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  q["ipVersion"] = $ipVersion
  q["protocol"] = $protocol
  q["format"] = $format
  let res = await client.httpGET("/radar/attacks/layer3/top/vertical", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarAttacksLayer3TopVerticalResponse)
  else:
    raise newException(CloudflareClientError, body)
