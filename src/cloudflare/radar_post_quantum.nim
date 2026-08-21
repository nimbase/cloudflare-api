# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetRadarPostQuantumOriginSummaryDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarPostQuantumOriginTimeseriesGroupsDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarPostQuantumTlsSupportResponse* = object
    result: JsonNode
    success: bool
  RadarPostQuantumFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"


proc getRadarPostQuantumOriginSummaryDimension*(client: CloudflareClient,
                                                dimension: Dimension,
                                                name: seq[string] = @[],
                                                dateRange: seq[string] = @[],
                                                dateStart: seq[string] = @[],
                                                dateEnd: seq[string] = @[],
                                                format: RadarPostQuantumFormatOption): Future[GetRadarPostQuantumOriginSummaryDimensionResponse] {.async.} =
  ## Returns a summary of origin post-quantum data grouped by the specified
  ## dimension.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/post_quantum/origin/summary/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarPostQuantumOriginSummaryDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarPostQuantumOriginTimeseriesGroupsDimension*(client: CloudflareClient,
                                                         dimension: Dimension,
                                                         name: seq[string] = @[],
                                                         dateRange: seq[string] = @[],
                                                         dateStart: seq[string] = @[],
                                                         dateEnd: seq[string] = @[],
                                                         format: RadarPostQuantumFormatOption): Future[GetRadarPostQuantumOriginTimeseriesGroupsDimensionResponse] {.async.} =
  ## Returns a timeseries of origin post-quantum data grouped by the specified
  ## dimension.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/post_quantum/origin/timeseries_groups/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarPostQuantumOriginTimeseriesGroupsDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarPostQuantumTlsSupport*(client: CloudflareClient, host: string): Future[GetRadarPostQuantumTlsSupportResponse] {.async.} =
  ## Tests whether a hostname or IP address supports Post-Quantum (PQ) TLS key
  ## exchange. Returns information about the negotiated key exchange algorithm,
  ## whether it uses PQ cryptography, and any detected TLS implementation bugs (Split
  ## ClientHello, HRR failure, etc.).

  var q = initOrderedTable[string, string]()
  q["host"] = $host
  let res = await client.httpGET("/radar/post_quantum/tls/support", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarPostQuantumTlsSupportResponse)
  else:
    raise newException(CloudflareClientError, body)
