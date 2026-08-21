# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetRadarHttpSummaryBotClassResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpSummaryDeviceTypeResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpSummaryHttpProtocolResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpSummaryHttpVersionResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpSummaryIpVersionResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpSummaryOsResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpSummaryPostQuantumResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpSummaryTlsVersionResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpSummaryDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTimeseriesResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTimeseriesGroupsBotClassResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTimeseriesGroupsBrowserResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTimeseriesGroupsBrowserFamilyResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTimeseriesGroupsDeviceTypeResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTimeseriesGroupsHttpProtocolResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTimeseriesGroupsHttpVersionResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTimeseriesGroupsIpVersionResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTimeseriesGroupsOsResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTimeseriesGroupsPostQuantumResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTimeseriesGroupsTlsVersionResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTimeseriesGroupsDimensionResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTopAsesResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTopAsesBotClassBotClassResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTopAsesBrowserFamilyBrowserFamilyResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTopAsesDeviceTypeDeviceTypeResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTopAsesHttpProtocolHttpProtocolResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTopAsesHttpVersionHttpVersionResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTopAsesIpVersionIpVersionResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTopAsesOsOsResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTopAsesTlsVersionTlsVersionResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTopBrowserResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTopBrowserFamilyResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTopLocationsResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTopLocationsBotClassBotClassResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTopLocationsBrowserFamilyBrowserFamilyResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTopLocationsDeviceTypeDeviceTypeResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTopLocationsHttpProtocolHttpProtocolResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTopLocationsHttpVersionHttpVersionResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTopLocationsIpVersionIpVersionResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTopLocationsOsOsResponse* = object
    result: JsonNode
    success: bool
  GetRadarHttpTopLocationsTlsVersionTlsVersionResponse* = object
    result: JsonNode
    success: bool
  RadarHttpFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"

  RadarHttpAggIntervalOption* = enum
    aggInterval15m = "15m"
    aggInterval1h = "1h"
    aggInterval1d = "1d"
    aggInterval1w = "1w"

  RadarHttpNormalizationOption* = enum
    normalizationPERCENTAGECHANGE = "PERCENTAGE_CHANGE"
    normalizationMIN0MAX = "MIN0_MAX"


proc getRadarHttpSummaryBotClass*(client: CloudflareClient,
                                  name: seq[string] = @[],
                                  dateRange: seq[string] = @[],
                                  dateStart: seq[string] = @[],
                                  dateEnd: seq[string] = @[],
                                  asn: seq[string] = @[],
                                  location: seq[string] = @[],
                                  continent: seq[string] = @[],
                                  geoId: seq[string] = @[],
                                  deviceType: seq[string] = default(seq[string]),
                                  httpProtocol: seq[string] = default(seq[string]),
                                  httpVersion: seq[string] = default(seq[string]),
                                  ipVersion: seq[string] = default(seq[string]),
                                  os: seq[string] = default(seq[string]),
                                  tlsVersion: seq[string] = default(seq[string]),
                                  browserFamily: seq[string] = default(seq[string]),
                                  format: RadarHttpFormatOption): Future[GetRadarHttpSummaryBotClassResponse] {.async.} =
  ## Retrieves the distribution of bot-generated HTTP requests to genuine human
  ## traffic, as classified by Cloudflare. Visit
  ## https://developers.cloudflare.com/radar/concepts/bot-classes/ for more
  ## information.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET("/radar/http/summary/bot_class", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpSummaryBotClassResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpSummaryDeviceType*(client: CloudflareClient,
                                    name: seq[string] = @[],
                                    dateRange: seq[string] = @[],
                                    dateStart: seq[string] = @[],
                                    dateEnd: seq[string] = @[],
                                    asn: seq[string] = @[],
                                    location: seq[string] = @[],
                                    continent: seq[string] = @[],
                                    geoId: seq[string] = @[],
                                    botClass: seq[string] = default(seq[string]),
                                    httpProtocol: seq[string] = default(seq[string]),
                                    httpVersion: seq[string] = default(seq[string]),
                                    ipVersion: seq[string] = default(seq[string]),
                                    os: seq[string] = default(seq[string]),
                                    tlsVersion: seq[string] = default(seq[string]),
                                    browserFamily: seq[string] = default(seq[string]),
                                    format: RadarHttpFormatOption): Future[GetRadarHttpSummaryDeviceTypeResponse] {.async.} =
  ## Retrieves the distribution of HTTP requests generated by mobile, desktop, and
  ## other types of devices.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET("/radar/http/summary/device_type", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpSummaryDeviceTypeResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpSummaryHttpProtocol*(client: CloudflareClient,
                                      name: seq[string] = @[],
                                      dateRange: seq[string] = @[],
                                      dateStart: seq[string] = @[],
                                      dateEnd: seq[string] = @[],
                                      asn: seq[string] = @[],
                                      location: seq[string] = @[],
                                      continent: seq[string] = @[],
                                      geoId: seq[string] = @[],
                                      botClass: seq[string] = default(seq[string]),
                                      deviceType: seq[string] = default(seq[string]),
                                      httpVersion: seq[string] = default(seq[string]),
                                      ipVersion: seq[string] = default(seq[string]),
                                      os: seq[string] = default(seq[string]),
                                      tlsVersion: seq[string] = default(seq[string]),
                                      browserFamily: seq[string] = default(seq[string]),
                                      format: RadarHttpFormatOption): Future[GetRadarHttpSummaryHttpProtocolResponse] {.async.} =
  ## Retrieves the distribution of HTTP requests by HTTP protocol (HTTP vs. HTTPS).

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET("/radar/http/summary/http_protocol", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpSummaryHttpProtocolResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpSummaryHttpVersion*(client: CloudflareClient,
                                     name: seq[string] = @[],
                                     dateRange: seq[string] = @[],
                                     dateStart: seq[string] = @[],
                                     dateEnd: seq[string] = @[],
                                     asn: seq[string] = @[],
                                     location: seq[string] = @[],
                                     continent: seq[string] = @[],
                                     geoId: seq[string] = @[],
                                     botClass: seq[string] = default(seq[string]),
                                     deviceType: seq[string] = default(seq[string]),
                                     httpProtocol: seq[string] = default(seq[string]),
                                     ipVersion: seq[string] = default(seq[string]),
                                     os: seq[string] = default(seq[string]),
                                     tlsVersion: seq[string] = default(seq[string]),
                                     browserFamily: seq[string] = default(seq[string]),
                                     format: RadarHttpFormatOption): Future[GetRadarHttpSummaryHttpVersionResponse] {.async.} =
  ## Retrieves the distribution of HTTP requests by HTTP version.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET("/radar/http/summary/http_version", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpSummaryHttpVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpSummaryIpVersion*(client: CloudflareClient,
                                   name: seq[string] = @[],
                                   dateRange: seq[string] = @[],
                                   dateStart: seq[string] = @[],
                                   dateEnd: seq[string] = @[],
                                   asn: seq[string] = @[],
                                   location: seq[string] = @[],
                                   continent: seq[string] = @[],
                                   geoId: seq[string] = @[],
                                   botClass: seq[string] = default(seq[string]),
                                   deviceType: seq[string] = default(seq[string]),
                                   httpProtocol: seq[string] = default(seq[string]),
                                   httpVersion: seq[string] = default(seq[string]),
                                   os: seq[string] = default(seq[string]),
                                   tlsVersion: seq[string] = default(seq[string]),
                                   browserFamily: seq[string] = default(seq[string]),
                                   format: RadarHttpFormatOption): Future[GetRadarHttpSummaryIpVersionResponse] {.async.} =
  ## Retrieves the distribution of HTTP requests by IP version.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET("/radar/http/summary/ip_version", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpSummaryIpVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpSummaryOs*(client: CloudflareClient, name: seq[string] = @[],
                            dateRange: seq[string] = @[],
                            dateStart: seq[string] = @[],
                            dateEnd: seq[string] = @[], asn: seq[string] = @[],
                            location: seq[string] = @[],
                            continent: seq[string] = @[],
                            geoId: seq[string] = @[],
                            botClass: seq[string] = default(seq[string]),
                            deviceType: seq[string] = default(seq[string]),
                            httpProtocol: seq[string] = default(seq[string]),
                            httpVersion: seq[string] = default(seq[string]),
                            ipVersion: seq[string] = default(seq[string]),
                            tlsVersion: seq[string] = default(seq[string]),
                            browserFamily: seq[string] = default(seq[string]),
                            format: RadarHttpFormatOption): Future[GetRadarHttpSummaryOsResponse] {.async.} =
  ## Retrieves the distribution of HTTP requests by operating system (Windows, macOS,
  ## Android, iOS, and others).

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET("/radar/http/summary/os", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpSummaryOsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpSummaryPostQuantum*(client: CloudflareClient,
                                     name: seq[string] = @[],
                                     dateRange: seq[string] = @[],
                                     dateStart: seq[string] = @[],
                                     dateEnd: seq[string] = @[],
                                     asn: seq[string] = @[],
                                     location: seq[string] = @[],
                                     continent: seq[string] = @[],
                                     geoId: seq[string] = @[],
                                     botClass: seq[string] = default(seq[string]),
                                     deviceType: seq[string] = default(seq[string]),
                                     httpProtocol: seq[string] = default(seq[string]),
                                     httpVersion: seq[string] = default(seq[string]),
                                     ipVersion: seq[string] = default(seq[string]),
                                     os: seq[string] = default(seq[string]),
                                     tlsVersion: seq[string] = default(seq[string]),
                                     browserFamily: seq[string] = default(seq[string]),
                                     format: RadarHttpFormatOption): Future[GetRadarHttpSummaryPostQuantumResponse] {.async.} =
  ## Retrieves the distribution of HTTP requests by post-quantum support.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET("/radar/http/summary/post_quantum", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpSummaryPostQuantumResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpSummaryTlsVersion*(client: CloudflareClient,
                                    name: seq[string] = @[],
                                    dateRange: seq[string] = @[],
                                    dateStart: seq[string] = @[],
                                    dateEnd: seq[string] = @[],
                                    asn: seq[string] = @[],
                                    location: seq[string] = @[],
                                    continent: seq[string] = @[],
                                    geoId: seq[string] = @[],
                                    botClass: seq[string] = default(seq[string]),
                                    deviceType: seq[string] = default(seq[string]),
                                    httpProtocol: seq[string] = default(seq[string]),
                                    httpVersion: seq[string] = default(seq[string]),
                                    ipVersion: seq[string] = default(seq[string]),
                                    os: seq[string] = default(seq[string]),
                                    browserFamily: seq[string] = default(seq[string]),
                                    format: RadarHttpFormatOption): Future[GetRadarHttpSummaryTlsVersionResponse] {.async.} =
  ## Retrieves the distribution of HTTP requests by TLS version.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET("/radar/http/summary/tls_version", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpSummaryTlsVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpSummaryDimension*(client: CloudflareClient,
                                   dimension: Dimension, name: seq[string] = @[],
                                   dateRange: seq[string] = @[],
                                   dateStart: seq[string] = @[],
                                   dateEnd: seq[string] = @[],
                                   asn: seq[string] = @[],
                                   location: seq[string] = @[],
                                   continent: seq[string] = @[],
                                   geoId: seq[string] = @[],
                                   apiTraffic: seq[string] = default(seq[string]),
                                   botClass: seq[string] = default(seq[string]),
                                   contentType: seq[string] = default(seq[string]),
                                   deviceType: seq[string] = default(seq[string]),
                                   httpProtocol: seq[string] = default(seq[string]),
                                   httpVersion: seq[string] = default(seq[string]),
                                   ipVersion: seq[string] = default(seq[string]),
                                   os: seq[string] = default(seq[string]),
                                   tlsVersion: seq[string] = default(seq[string]),
                                   limitPerGroup: int64 = default(int64),
                                   format: RadarHttpFormatOption): Future[GetRadarHttpSummaryDimensionResponse] {.async.} =
  ## Retrieves the distribution of HTTP requests by the specified dimension.

  var q = initOrderedTable[string, string]()
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["apiTraffic"] = $apiTraffic
  q["botClass"] = $botClass
  q["contentType"] = $contentType
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["limitPerGroup"] = $limitPerGroup
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/http/summary/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpSummaryDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTimeseries*(client: CloudflareClient,
                             aggInterval: RadarHttpAggIntervalOption,
                             name: seq[string] = @[],
                             dateRange: seq[string] = @[],
                             dateStart: seq[string] = @[],
                             dateEnd: seq[string] = @[], asn: seq[string] = @[],
                             location: seq[string] = @[],
                             continent: seq[string] = @[],
                             geoId: seq[string] = @[],
                             normalization: RadarHttpNormalizationOption,
                             apiTraffic: seq[string] = default(seq[string]),
                             botClass: seq[string] = default(seq[string]),
                             contentType: seq[string] = default(seq[string]),
                             deviceType: seq[string] = default(seq[string]),
                             httpProtocol: seq[string] = default(seq[string]),
                             httpVersion: seq[string] = default(seq[string]),
                             ipVersion: seq[string] = default(seq[string]),
                             os: seq[string] = default(seq[string]),
                             tlsVersion: seq[string] = default(seq[string]),
                             browserFamily: seq[string] = default(seq[string]),
                             format: RadarHttpFormatOption): Future[GetRadarHttpTimeseriesResponse] {.async.} =
  ## Retrieves the HTTP requests over time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["normalization"] = $normalization
  q["apiTraffic"] = $apiTraffic
  q["botClass"] = $botClass
  q["contentType"] = $contentType
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET("/radar/http/timeseries", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTimeseriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTimeseriesGroupsBotClass*(client: CloudflareClient,
                                           aggInterval: RadarHttpAggIntervalOption,
                                           name: seq[string] = @[],
                                           dateRange: seq[string] = @[],
                                           dateStart: seq[string] = @[],
                                           dateEnd: seq[string] = @[],
                                           asn: seq[string] = @[],
                                           location: seq[string] = @[],
                                           continent: seq[string] = @[],
                                           geoId: seq[string] = @[],
                                           deviceType: seq[string] = default(seq[string]),
                                           httpProtocol: seq[string] = default(seq[string]),
                                           httpVersion: seq[string] = default(seq[string]),
                                           ipVersion: seq[string] = default(seq[string]),
                                           os: seq[string] = default(seq[string]),
                                           tlsVersion: seq[string] = default(seq[string]),
                                           browserFamily: seq[string] = default(seq[string]),
                                           format: RadarHttpFormatOption): Future[GetRadarHttpTimeseriesGroupsBotClassResponse] {.async.} =
  ## Retrieves the distribution of HTTP requests classified as automated or human
  ## over time. Visit https://developers.cloudflare.com/radar/concepts/bot-classes/
  ## for more information.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET("/radar/http/timeseries_groups/bot_class", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTimeseriesGroupsBotClassResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTimeseriesGroupsBrowser*(client: CloudflareClient,
                                          aggInterval: RadarHttpAggIntervalOption,
                                          name: seq[string] = @[],
                                          dateRange: seq[string] = @[],
                                          dateStart: seq[string] = @[],
                                          dateEnd: seq[string] = @[],
                                          asn: seq[string] = @[],
                                          location: seq[string] = @[],
                                          continent: seq[string] = @[],
                                          geoId: seq[string] = @[],
                                          botClass: seq[string] = default(seq[string]),
                                          deviceType: seq[string] = default(seq[string]),
                                          httpProtocol: seq[string] = default(seq[string]),
                                          httpVersion: seq[string] = default(seq[string]),
                                          ipVersion: seq[string] = default(seq[string]),
                                          os: seq[string] = default(seq[string]),
                                          tlsVersion: seq[string] = default(seq[string]),
                                          browserFamily: seq[string] = default(seq[string]),
                                          limitPerGroup: int64 = default(int64),
                                          format: RadarHttpFormatOption): Future[GetRadarHttpTimeseriesGroupsBrowserResponse] {.async.} =
  ## Retrieves the distribution of HTTP requests by user agent over time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["limitPerGroup"] = $limitPerGroup
  q["format"] = $format
  let res = await client.httpGET("/radar/http/timeseries_groups/browser", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTimeseriesGroupsBrowserResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTimeseriesGroupsBrowserFamily*(client: CloudflareClient,
                                                aggInterval: RadarHttpAggIntervalOption,
                                                name: seq[string] = @[],
                                                dateRange: seq[string] = @[],
                                                dateStart: seq[string] = @[],
                                                dateEnd: seq[string] = @[],
                                                asn: seq[string] = @[],
                                                location: seq[string] = @[],
                                                continent: seq[string] = @[],
                                                geoId: seq[string] = @[],
                                                botClass: seq[string] = default(seq[string]),
                                                deviceType: seq[string] = default(seq[string]),
                                                httpProtocol: seq[string] = default(seq[string]),
                                                httpVersion: seq[string] = default(seq[string]),
                                                ipVersion: seq[string] = default(seq[string]),
                                                os: seq[string] = default(seq[string]),
                                                tlsVersion: seq[string] = default(seq[string]),
                                                limitPerGroup: int64 = default(int64),
                                                format: RadarHttpFormatOption): Future[GetRadarHttpTimeseriesGroupsBrowserFamilyResponse] {.async.} =
  ## Retrieves the distribution of HTTP requests by user agent family over time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["limitPerGroup"] = $limitPerGroup
  q["format"] = $format
  let res = await client.httpGET("/radar/http/timeseries_groups/browser_family", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTimeseriesGroupsBrowserFamilyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTimeseriesGroupsDeviceType*(client: CloudflareClient,
                                             aggInterval: RadarHttpAggIntervalOption,
                                             name: seq[string] = @[],
                                             dateRange: seq[string] = @[],
                                             dateStart: seq[string] = @[],
                                             dateEnd: seq[string] = @[],
                                             asn: seq[string] = @[],
                                             location: seq[string] = @[],
                                             continent: seq[string] = @[],
                                             geoId: seq[string] = @[],
                                             botClass: seq[string] = default(seq[string]),
                                             httpProtocol: seq[string] = default(seq[string]),
                                             httpVersion: seq[string] = default(seq[string]),
                                             ipVersion: seq[string] = default(seq[string]),
                                             os: seq[string] = default(seq[string]),
                                             tlsVersion: seq[string] = default(seq[string]),
                                             browserFamily: seq[string] = default(seq[string]),
                                             format: RadarHttpFormatOption): Future[GetRadarHttpTimeseriesGroupsDeviceTypeResponse] {.async.} =
  ## Retrieves the distribution of HTTP requests by device type over time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET("/radar/http/timeseries_groups/device_type", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTimeseriesGroupsDeviceTypeResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTimeseriesGroupsHttpProtocol*(client: CloudflareClient,
                                               aggInterval: RadarHttpAggIntervalOption,
                                               name: seq[string] = @[],
                                               dateRange: seq[string] = @[],
                                               dateStart: seq[string] = @[],
                                               dateEnd: seq[string] = @[],
                                               asn: seq[string] = @[],
                                               location: seq[string] = @[],
                                               continent: seq[string] = @[],
                                               geoId: seq[string] = @[],
                                               botClass: seq[string] = default(seq[string]),
                                               deviceType: seq[string] = default(seq[string]),
                                               httpVersion: seq[string] = default(seq[string]),
                                               ipVersion: seq[string] = default(seq[string]),
                                               os: seq[string] = default(seq[string]),
                                               tlsVersion: seq[string] = default(seq[string]),
                                               browserFamily: seq[string] = default(seq[string]),
                                               format: RadarHttpFormatOption): Future[GetRadarHttpTimeseriesGroupsHttpProtocolResponse] {.async.} =
  ## Retrieves the distribution of HTTP requests by HTTP protocol (HTTP vs. HTTPS)
  ## over time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET("/radar/http/timeseries_groups/http_protocol", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTimeseriesGroupsHttpProtocolResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTimeseriesGroupsHttpVersion*(client: CloudflareClient,
                                              aggInterval: RadarHttpAggIntervalOption,
                                              name: seq[string] = @[],
                                              dateRange: seq[string] = @[],
                                              dateStart: seq[string] = @[],
                                              dateEnd: seq[string] = @[],
                                              asn: seq[string] = @[],
                                              location: seq[string] = @[],
                                              continent: seq[string] = @[],
                                              geoId: seq[string] = @[],
                                              botClass: seq[string] = default(seq[string]),
                                              deviceType: seq[string] = default(seq[string]),
                                              httpProtocol: seq[string] = default(seq[string]),
                                              ipVersion: seq[string] = default(seq[string]),
                                              os: seq[string] = default(seq[string]),
                                              tlsVersion: seq[string] = default(seq[string]),
                                              browserFamily: seq[string] = default(seq[string]),
                                              format: RadarHttpFormatOption): Future[GetRadarHttpTimeseriesGroupsHttpVersionResponse] {.async.} =
  ## Retrieves the distribution of HTTP requests by HTTP version over time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET("/radar/http/timeseries_groups/http_version", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTimeseriesGroupsHttpVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTimeseriesGroupsIpVersion*(client: CloudflareClient,
                                            aggInterval: RadarHttpAggIntervalOption,
                                            name: seq[string] = @[],
                                            dateRange: seq[string] = @[],
                                            dateStart: seq[string] = @[],
                                            dateEnd: seq[string] = @[],
                                            asn: seq[string] = @[],
                                            location: seq[string] = @[],
                                            continent: seq[string] = @[],
                                            geoId: seq[string] = @[],
                                            botClass: seq[string] = default(seq[string]),
                                            deviceType: seq[string] = default(seq[string]),
                                            httpProtocol: seq[string] = default(seq[string]),
                                            httpVersion: seq[string] = default(seq[string]),
                                            os: seq[string] = default(seq[string]),
                                            tlsVersion: seq[string] = default(seq[string]),
                                            browserFamily: seq[string] = default(seq[string]),
                                            format: RadarHttpFormatOption): Future[GetRadarHttpTimeseriesGroupsIpVersionResponse] {.async.} =
  ## Retrieves the distribution of HTTP requests by IP version over time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET("/radar/http/timeseries_groups/ip_version", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTimeseriesGroupsIpVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTimeseriesGroupsOs*(client: CloudflareClient,
                                     aggInterval: RadarHttpAggIntervalOption,
                                     name: seq[string] = @[],
                                     dateRange: seq[string] = @[],
                                     dateStart: seq[string] = @[],
                                     dateEnd: seq[string] = @[],
                                     asn: seq[string] = @[],
                                     location: seq[string] = @[],
                                     continent: seq[string] = @[],
                                     geoId: seq[string] = @[],
                                     botClass: seq[string] = default(seq[string]),
                                     deviceType: seq[string] = default(seq[string]),
                                     httpProtocol: seq[string] = default(seq[string]),
                                     httpVersion: seq[string] = default(seq[string]),
                                     ipVersion: seq[string] = default(seq[string]),
                                     tlsVersion: seq[string] = default(seq[string]),
                                     browserFamily: seq[string] = default(seq[string]),
                                     format: RadarHttpFormatOption): Future[GetRadarHttpTimeseriesGroupsOsResponse] {.async.} =
  ## Retrieves the distribution of HTTP requests by operating system over time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET("/radar/http/timeseries_groups/os", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTimeseriesGroupsOsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTimeseriesGroupsPostQuantum*(client: CloudflareClient,
                                              aggInterval: RadarHttpAggIntervalOption,
                                              name: seq[string] = @[],
                                              dateRange: seq[string] = @[],
                                              dateStart: seq[string] = @[],
                                              dateEnd: seq[string] = @[],
                                              asn: seq[string] = @[],
                                              location: seq[string] = @[],
                                              continent: seq[string] = @[],
                                              geoId: seq[string] = @[],
                                              botClass: seq[string] = default(seq[string]),
                                              deviceType: seq[string] = default(seq[string]),
                                              httpProtocol: seq[string] = default(seq[string]),
                                              httpVersion: seq[string] = default(seq[string]),
                                              ipVersion: seq[string] = default(seq[string]),
                                              os: seq[string] = default(seq[string]),
                                              tlsVersion: seq[string] = default(seq[string]),
                                              browserFamily: seq[string] = default(seq[string]),
                                              format: RadarHttpFormatOption): Future[GetRadarHttpTimeseriesGroupsPostQuantumResponse] {.async.} =
  ## Retrieves the distribution of HTTP requests by post-quantum support over time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET("/radar/http/timeseries_groups/post_quantum", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTimeseriesGroupsPostQuantumResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTimeseriesGroupsTlsVersion*(client: CloudflareClient,
                                             aggInterval: RadarHttpAggIntervalOption,
                                             name: seq[string] = @[],
                                             dateRange: seq[string] = @[],
                                             dateStart: seq[string] = @[],
                                             dateEnd: seq[string] = @[],
                                             asn: seq[string] = @[],
                                             location: seq[string] = @[],
                                             continent: seq[string] = @[],
                                             geoId: seq[string] = @[],
                                             botClass: seq[string] = default(seq[string]),
                                             deviceType: seq[string] = default(seq[string]),
                                             httpProtocol: seq[string] = default(seq[string]),
                                             httpVersion: seq[string] = default(seq[string]),
                                             ipVersion: seq[string] = default(seq[string]),
                                             os: seq[string] = default(seq[string]),
                                             browserFamily: seq[string] = default(seq[string]),
                                             format: RadarHttpFormatOption): Future[GetRadarHttpTimeseriesGroupsTlsVersionResponse] {.async.} =
  ## Retrieves the distribution of HTTP requests by TLS version over time.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET("/radar/http/timeseries_groups/tls_version", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTimeseriesGroupsTlsVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTimeseriesGroupsDimension*(client: CloudflareClient,
                                            dimension: Dimension,
                                            aggInterval: RadarHttpAggIntervalOption,
                                            name: seq[string] = @[],
                                            dateRange: seq[string] = @[],
                                            dateStart: seq[string] = @[],
                                            dateEnd: seq[string] = @[],
                                            asn: seq[string] = @[],
                                            location: seq[string] = @[],
                                            continent: seq[string] = @[],
                                            geoId: seq[string] = @[],
                                            apiTraffic: seq[string] = default(seq[string]),
                                            botClass: seq[string] = default(seq[string]),
                                            contentType: seq[string] = default(seq[string]),
                                            limitPerGroup: int64 = default(int64),
                                            deviceType: seq[string] = default(seq[string]),
                                            httpProtocol: seq[string] = default(seq[string]),
                                            httpVersion: seq[string] = default(seq[string]),
                                            normalization: RadarHttpNormalizationOption = normalizationPERCENTAGE,
                                            ipVersion: seq[string] = default(seq[string]),
                                            os: seq[string] = default(seq[string]),
                                            tlsVersion: seq[string] = default(seq[string]),
                                            format: RadarHttpFormatOption): Future[GetRadarHttpTimeseriesGroupsDimensionResponse] {.async.} =
  ## Retrieves the distribution of HTTP requests grouped by dimension.

  var q = initOrderedTable[string, string]()
  q["aggInterval"] = $aggInterval
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["apiTraffic"] = $apiTraffic
  q["botClass"] = $botClass
  q["contentType"] = $contentType
  q["limitPerGroup"] = $limitPerGroup
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["normalization"] = $normalization
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/http/timeseries_groups/{dimension}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTimeseriesGroupsDimensionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTopAses*(client: CloudflareClient, limit: int64 = 5,
                          name: seq[string] = @[], dateRange: seq[string] = @[],
                          dateStart: seq[string] = @[],
                          dateEnd: seq[string] = @[], asn: seq[string] = @[],
                          location: seq[string] = @[],
                          continent: seq[string] = @[], geoId: seq[string] = @[],
                          botClass: seq[string] = default(seq[string]),
                          deviceType: seq[string] = default(seq[string]),
                          httpProtocol: seq[string] = default(seq[string]),
                          httpVersion: seq[string] = default(seq[string]),
                          ipVersion: seq[string] = default(seq[string]),
                          os: seq[string] = default(seq[string]),
                          tlsVersion: seq[string] = default(seq[string]),
                          browserFamily: seq[string] = default(seq[string]),
                          format: RadarHttpFormatOption): Future[GetRadarHttpTopAsesResponse] {.async.} =
  ## Retrieves the top autonomous systems by HTTP requests.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET("/radar/http/top/ases", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTopAsesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTopAsesBotClassBotClass*(client: CloudflareClient,
                                          botClass: BotClass, limit: int64 = 5,
                                          name: seq[string] = @[],
                                          dateRange: seq[string] = @[],
                                          dateStart: seq[string] = @[],
                                          dateEnd: seq[string] = @[],
                                          asn: seq[string] = @[],
                                          location: seq[string] = @[],
                                          continent: seq[string] = @[],
                                          geoId: seq[string] = @[],
                                          deviceType: seq[string] = default(seq[string]),
                                          httpProtocol: seq[string] = default(seq[string]),
                                          httpVersion: seq[string] = default(seq[string]),
                                          ipVersion: seq[string] = default(seq[string]),
                                          os: seq[string] = default(seq[string]),
                                          tlsVersion: seq[string] = default(seq[string]),
                                          browserFamily: seq[string] = default(seq[string]),
                                          format: RadarHttpFormatOption): Future[GetRadarHttpTopAsesBotClassBotClassResponse] {.async.} =
  ## Retrieves the top autonomous systems, by HTTP requests, of the requested bot
  ## class.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/http/top/ases/bot_class/{botClass}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTopAsesBotClassBotClassResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTopAsesBrowserFamilyBrowserFamily*(client: CloudflareClient,
                                                    browserFamily: BrowserFamily,
                                                    limit: int64 = 5,
                                                    name: seq[string] = @[],
                                                    dateRange: seq[string] = @[],
                                                    dateStart: seq[string] = @[],
                                                    dateEnd: seq[string] = @[],
                                                    asn: seq[string] = @[],
                                                    location: seq[string] = @[],
                                                    continent: seq[string] = @[],
                                                    geoId: seq[string] = @[],
                                                    botClass: seq[string] = default(seq[string]),
                                                    deviceType: seq[string] = default(seq[string]),
                                                    httpProtocol: seq[string] = default(seq[string]),
                                                    httpVersion: seq[string] = default(seq[string]),
                                                    ipVersion: seq[string] = default(seq[string]),
                                                    os: seq[string] = default(seq[string]),
                                                    tlsVersion: seq[string] = default(seq[string]),
                                                    format: RadarHttpFormatOption): Future[GetRadarHttpTopAsesBrowserFamilyBrowserFamilyResponse] {.async.} =
  ## Retrieves the top autonomous systems, by HTTP requests, of the requested browser
  ## family.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/http/top/ases/browser_family/{browserFamily}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTopAsesBrowserFamilyBrowserFamilyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTopAsesDeviceTypeDeviceType*(client: CloudflareClient,
                                              deviceType: DeviceType,
                                              limit: int64 = 5,
                                              name: seq[string] = @[],
                                              dateRange: seq[string] = @[],
                                              dateStart: seq[string] = @[],
                                              dateEnd: seq[string] = @[],
                                              asn: seq[string] = @[],
                                              location: seq[string] = @[],
                                              continent: seq[string] = @[],
                                              geoId: seq[string] = @[],
                                              botClass: seq[string] = default(seq[string]),
                                              httpProtocol: seq[string] = default(seq[string]),
                                              httpVersion: seq[string] = default(seq[string]),
                                              ipVersion: seq[string] = default(seq[string]),
                                              os: seq[string] = default(seq[string]),
                                              tlsVersion: seq[string] = default(seq[string]),
                                              browserFamily: seq[string] = default(seq[string]),
                                              format: RadarHttpFormatOption): Future[GetRadarHttpTopAsesDeviceTypeDeviceTypeResponse] {.async.} =
  ## Retrieves the top autonomous systems, by HTTP requests, of the requested device
  ## type.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/http/top/ases/device_type/{deviceType}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTopAsesDeviceTypeDeviceTypeResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTopAsesHttpProtocolHttpProtocol*(client: CloudflareClient,
                                                  httpProtocol: HttpProtocol,
                                                  limit: int64 = 5,
                                                  name: seq[string] = @[],
                                                  dateRange: seq[string] = @[],
                                                  dateStart: seq[string] = @[],
                                                  dateEnd: seq[string] = @[],
                                                  asn: seq[string] = @[],
                                                  location: seq[string] = @[],
                                                  continent: seq[string] = @[],
                                                  geoId: seq[string] = @[],
                                                  botClass: seq[string] = default(seq[string]),
                                                  deviceType: seq[string] = default(seq[string]),
                                                  httpVersion: seq[string] = default(seq[string]),
                                                  ipVersion: seq[string] = default(seq[string]),
                                                  os: seq[string] = default(seq[string]),
                                                  tlsVersion: seq[string] = default(seq[string]),
                                                  browserFamily: seq[string] = default(seq[string]),
                                                  format: RadarHttpFormatOption): Future[GetRadarHttpTopAsesHttpProtocolHttpProtocolResponse] {.async.} =
  ## Retrieves the top autonomous systems, by HTTP requests, of the requested HTTP
  ## protocol.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/http/top/ases/http_protocol/{httpProtocol}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTopAsesHttpProtocolHttpProtocolResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTopAsesHttpVersionHttpVersion*(client: CloudflareClient,
                                                httpVersion: HttpVersion,
                                                limit: int64 = 5,
                                                name: seq[string] = @[],
                                                dateRange: seq[string] = @[],
                                                dateStart: seq[string] = @[],
                                                dateEnd: seq[string] = @[],
                                                asn: seq[string] = @[],
                                                location: seq[string] = @[],
                                                continent: seq[string] = @[],
                                                geoId: seq[string] = @[],
                                                botClass: seq[string] = default(seq[string]),
                                                deviceType: seq[string] = default(seq[string]),
                                                httpProtocol: seq[string] = default(seq[string]),
                                                ipVersion: seq[string] = default(seq[string]),
                                                os: seq[string] = default(seq[string]),
                                                tlsVersion: seq[string] = default(seq[string]),
                                                browserFamily: seq[string] = default(seq[string]),
                                                format: RadarHttpFormatOption): Future[GetRadarHttpTopAsesHttpVersionHttpVersionResponse] {.async.} =
  ## Retrieves the top autonomous systems, by HTTP requests, of the requested HTTP
  ## version.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/http/top/ases/http_version/{httpVersion}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTopAsesHttpVersionHttpVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTopAsesIpVersionIpVersion*(client: CloudflareClient,
                                            ipVersion: IpVersion,
                                            limit: int64 = 5,
                                            name: seq[string] = @[],
                                            dateRange: seq[string] = @[],
                                            dateStart: seq[string] = @[],
                                            dateEnd: seq[string] = @[],
                                            asn: seq[string] = @[],
                                            location: seq[string] = @[],
                                            continent: seq[string] = @[],
                                            geoId: seq[string] = @[],
                                            botClass: seq[string] = default(seq[string]),
                                            deviceType: seq[string] = default(seq[string]),
                                            httpProtocol: seq[string] = default(seq[string]),
                                            httpVersion: seq[string] = default(seq[string]),
                                            os: seq[string] = default(seq[string]),
                                            tlsVersion: seq[string] = default(seq[string]),
                                            browserFamily: seq[string] = default(seq[string]),
                                            format: RadarHttpFormatOption): Future[GetRadarHttpTopAsesIpVersionIpVersionResponse] {.async.} =
  ## Retrieves the top autonomous systems, by HTTP requests, of the requested IP
  ## version.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/http/top/ases/ip_version/{ipVersion}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTopAsesIpVersionIpVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTopAsesOsOs*(client: CloudflareClient, os: Os, limit: int64 = 5,
                              name: seq[string] = @[],
                              dateRange: seq[string] = @[],
                              dateStart: seq[string] = @[],
                              dateEnd: seq[string] = @[], asn: seq[string] = @[],
                              location: seq[string] = @[],
                              continent: seq[string] = @[],
                              geoId: seq[string] = @[],
                              botClass: seq[string] = default(seq[string]),
                              deviceType: seq[string] = default(seq[string]),
                              httpProtocol: seq[string] = default(seq[string]),
                              httpVersion: seq[string] = default(seq[string]),
                              ipVersion: seq[string] = default(seq[string]),
                              tlsVersion: seq[string] = default(seq[string]),
                              browserFamily: seq[string] = default(seq[string]),
                              format: RadarHttpFormatOption): Future[GetRadarHttpTopAsesOsOsResponse] {.async.} =
  ## Retrieves the top autonomous systems, by HTTP requests, of the requested
  ## operating system.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/http/top/ases/os/{os}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTopAsesOsOsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTopAsesTlsVersionTlsVersion*(client: CloudflareClient,
                                              tlsVersion: TlsVersion,
                                              limit: int64 = 5,
                                              name: seq[string] = @[],
                                              dateRange: seq[string] = @[],
                                              dateStart: seq[string] = @[],
                                              dateEnd: seq[string] = @[],
                                              asn: seq[string] = @[],
                                              location: seq[string] = @[],
                                              continent: seq[string] = @[],
                                              geoId: seq[string] = @[],
                                              botClass: seq[string] = default(seq[string]),
                                              deviceType: seq[string] = default(seq[string]),
                                              httpProtocol: seq[string] = default(seq[string]),
                                              httpVersion: seq[string] = default(seq[string]),
                                              ipVersion: seq[string] = default(seq[string]),
                                              os: seq[string] = default(seq[string]),
                                              browserFamily: seq[string] = default(seq[string]),
                                              format: RadarHttpFormatOption): Future[GetRadarHttpTopAsesTlsVersionTlsVersionResponse] {.async.} =
  ## Retrieves the top autonomous systems, by HTTP requests, of the requested TLS
  ## protocol version.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/http/top/ases/tls_version/{tlsVersion}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTopAsesTlsVersionTlsVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTopBrowser*(client: CloudflareClient, limit: int64 = 5,
                             name: seq[string] = @[],
                             dateRange: seq[string] = @[],
                             dateStart: seq[string] = @[],
                             dateEnd: seq[string] = @[], asn: seq[string] = @[],
                             location: seq[string] = @[],
                             continent: seq[string] = @[],
                             geoId: seq[string] = @[],
                             botClass: seq[string] = default(seq[string]),
                             deviceType: seq[string] = default(seq[string]),
                             httpProtocol: seq[string] = default(seq[string]),
                             httpVersion: seq[string] = default(seq[string]),
                             ipVersion: seq[string] = default(seq[string]),
                             os: seq[string] = default(seq[string]),
                             tlsVersion: seq[string] = default(seq[string]),
                             browserFamily: seq[string] = default(seq[string]),
                             format: RadarHttpFormatOption): Future[GetRadarHttpTopBrowserResponse] {.async.} =
  ## Retrieves the top user agents by HTTP requests.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET("/radar/http/top/browser", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTopBrowserResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTopBrowserFamily*(client: CloudflareClient, limit: int64 = 5,
                                   name: seq[string] = @[],
                                   dateRange: seq[string] = @[],
                                   dateStart: seq[string] = @[],
                                   dateEnd: seq[string] = @[],
                                   asn: seq[string] = @[],
                                   location: seq[string] = @[],
                                   continent: seq[string] = @[],
                                   geoId: seq[string] = @[],
                                   botClass: seq[string] = default(seq[string]),
                                   deviceType: seq[string] = default(seq[string]),
                                   httpProtocol: seq[string] = default(seq[string]),
                                   httpVersion: seq[string] = default(seq[string]),
                                   ipVersion: seq[string] = default(seq[string]),
                                   os: seq[string] = default(seq[string]),
                                   tlsVersion: seq[string] = default(seq[string]),
                                   format: RadarHttpFormatOption): Future[GetRadarHttpTopBrowserFamilyResponse] {.async.} =
  ## Retrieves the top user agents, aggregated in families, by HTTP requests.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["format"] = $format
  let res = await client.httpGET("/radar/http/top/browser_family", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTopBrowserFamilyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTopLocations*(client: CloudflareClient, limit: int64 = 5,
                               name: seq[string] = @[],
                               dateRange: seq[string] = @[],
                               dateStart: seq[string] = @[],
                               dateEnd: seq[string] = @[],
                               asn: seq[string] = @[],
                               location: seq[string] = @[],
                               continent: seq[string] = @[],
                               geoId: seq[string] = @[],
                               botClass: seq[string] = default(seq[string]),
                               deviceType: seq[string] = default(seq[string]),
                               httpProtocol: seq[string] = default(seq[string]),
                               httpVersion: seq[string] = default(seq[string]),
                               ipVersion: seq[string] = default(seq[string]),
                               os: seq[string] = default(seq[string]),
                               tlsVersion: seq[string] = default(seq[string]),
                               browserFamily: seq[string] = default(seq[string]),
                               format: RadarHttpFormatOption): Future[GetRadarHttpTopLocationsResponse] {.async.} =
  ## Retrieves the top locations by HTTP requests.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET("/radar/http/top/locations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTopLocationsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTopLocationsBotClassBotClass*(client: CloudflareClient,
                                               botClass: BotClass,
                                               limit: int64 = 5,
                                               name: seq[string] = @[],
                                               dateRange: seq[string] = @[],
                                               dateStart: seq[string] = @[],
                                               dateEnd: seq[string] = @[],
                                               asn: seq[string] = @[],
                                               location: seq[string] = @[],
                                               continent: seq[string] = @[],
                                               geoId: seq[string] = @[],
                                               deviceType: seq[string] = default(seq[string]),
                                               httpProtocol: seq[string] = default(seq[string]),
                                               httpVersion: seq[string] = default(seq[string]),
                                               ipVersion: seq[string] = default(seq[string]),
                                               os: seq[string] = default(seq[string]),
                                               tlsVersion: seq[string] = default(seq[string]),
                                               browserFamily: seq[string] = default(seq[string]),
                                               format: RadarHttpFormatOption): Future[GetRadarHttpTopLocationsBotClassBotClassResponse] {.async.} =
  ## Retrieves the top locations, by HTTP requests, of the requested bot class.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/http/top/locations/bot_class/{botClass}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTopLocationsBotClassBotClassResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTopLocationsBrowserFamilyBrowserFamily*(client: CloudflareClient,
                                                         browserFamily: BrowserFamily,
                                                         limit: int64 = 5,
                                                         name: seq[string] = @[],
                                                         dateRange: seq[string] = @[],
                                                         dateStart: seq[string] = @[],
                                                         dateEnd: seq[string] = @[],
                                                         asn: seq[string] = @[],
                                                         location: seq[string] = @[],
                                                         continent: seq[string] = @[],
                                                         geoId: seq[string] = @[],
                                                         botClass: seq[string] = default(seq[string]),
                                                         deviceType: seq[string] = default(seq[string]),
                                                         httpProtocol: seq[string] = default(seq[string]),
                                                         httpVersion: seq[string] = default(seq[string]),
                                                         ipVersion: seq[string] = default(seq[string]),
                                                         os: seq[string] = default(seq[string]),
                                                         tlsVersion: seq[string] = default(seq[string]),
                                                         format: RadarHttpFormatOption): Future[GetRadarHttpTopLocationsBrowserFamilyBrowserFamilyResponse] {.async.} =
  ## Retrieves the top locations, by HTTP requests, of the requested browser family.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/http/top/locations/browser_family/{browserFamily}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTopLocationsBrowserFamilyBrowserFamilyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTopLocationsDeviceTypeDeviceType*(client: CloudflareClient,
                                                   deviceType: DeviceType,
                                                   limit: int64 = 5,
                                                   name: seq[string] = @[],
                                                   dateRange: seq[string] = @[],
                                                   dateStart: seq[string] = @[],
                                                   dateEnd: seq[string] = @[],
                                                   asn: seq[string] = @[],
                                                   location: seq[string] = @[],
                                                   continent: seq[string] = @[],
                                                   geoId: seq[string] = @[],
                                                   botClass: seq[string] = default(seq[string]),
                                                   httpProtocol: seq[string] = default(seq[string]),
                                                   httpVersion: seq[string] = default(seq[string]),
                                                   ipVersion: seq[string] = default(seq[string]),
                                                   os: seq[string] = default(seq[string]),
                                                   tlsVersion: seq[string] = default(seq[string]),
                                                   browserFamily: seq[string] = default(seq[string]),
                                                   format: RadarHttpFormatOption): Future[GetRadarHttpTopLocationsDeviceTypeDeviceTypeResponse] {.async.} =
  ## Retrieves the top locations, by HTTP requests, of the requested device type.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/http/top/locations/device_type/{deviceType}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTopLocationsDeviceTypeDeviceTypeResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTopLocationsHttpProtocolHttpProtocol*(client: CloudflareClient,
                                                       httpProtocol: HttpProtocol,
                                                       limit: int64 = 5,
                                                       name: seq[string] = @[],
                                                       dateRange: seq[string] = @[],
                                                       dateStart: seq[string] = @[],
                                                       dateEnd: seq[string] = @[],
                                                       asn: seq[string] = @[],
                                                       location: seq[string] = @[],
                                                       continent: seq[string] = @[],
                                                       geoId: seq[string] = @[],
                                                       botClass: seq[string] = default(seq[string]),
                                                       deviceType: seq[string] = default(seq[string]),
                                                       httpVersion: seq[string] = default(seq[string]),
                                                       ipVersion: seq[string] = default(seq[string]),
                                                       os: seq[string] = default(seq[string]),
                                                       tlsVersion: seq[string] = default(seq[string]),
                                                       browserFamily: seq[string] = default(seq[string]),
                                                       format: RadarHttpFormatOption): Future[GetRadarHttpTopLocationsHttpProtocolHttpProtocolResponse] {.async.} =
  ## Retrieves the top locations, by HTTP requests, of the requested HTTP protocol.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/http/top/locations/http_protocol/{httpProtocol}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTopLocationsHttpProtocolHttpProtocolResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTopLocationsHttpVersionHttpVersion*(client: CloudflareClient,
                                                     httpVersion: HttpVersion,
                                                     limit: int64 = 5,
                                                     name: seq[string] = @[],
                                                     dateRange: seq[string] = @[],
                                                     dateStart: seq[string] = @[],
                                                     dateEnd: seq[string] = @[],
                                                     asn: seq[string] = @[],
                                                     location: seq[string] = @[],
                                                     continent: seq[string] = @[],
                                                     geoId: seq[string] = @[],
                                                     botClass: seq[string] = default(seq[string]),
                                                     deviceType: seq[string] = default(seq[string]),
                                                     httpProtocol: seq[string] = default(seq[string]),
                                                     ipVersion: seq[string] = default(seq[string]),
                                                     os: seq[string] = default(seq[string]),
                                                     tlsVersion: seq[string] = default(seq[string]),
                                                     browserFamily: seq[string] = default(seq[string]),
                                                     format: RadarHttpFormatOption): Future[GetRadarHttpTopLocationsHttpVersionHttpVersionResponse] {.async.} =
  ## Retrieves the top locations, by HTTP requests, of the requested HTTP version.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/http/top/locations/http_version/{httpVersion}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTopLocationsHttpVersionHttpVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTopLocationsIpVersionIpVersion*(client: CloudflareClient,
                                                 ipVersion: IpVersion,
                                                 limit: int64 = 5,
                                                 name: seq[string] = @[],
                                                 dateRange: seq[string] = @[],
                                                 dateStart: seq[string] = @[],
                                                 dateEnd: seq[string] = @[],
                                                 asn: seq[string] = @[],
                                                 location: seq[string] = @[],
                                                 continent: seq[string] = @[],
                                                 geoId: seq[string] = @[],
                                                 botClass: seq[string] = default(seq[string]),
                                                 deviceType: seq[string] = default(seq[string]),
                                                 httpProtocol: seq[string] = default(seq[string]),
                                                 httpVersion: seq[string] = default(seq[string]),
                                                 os: seq[string] = default(seq[string]),
                                                 tlsVersion: seq[string] = default(seq[string]),
                                                 browserFamily: seq[string] = default(seq[string]),
                                                 format: RadarHttpFormatOption): Future[GetRadarHttpTopLocationsIpVersionIpVersionResponse] {.async.} =
  ## Retrieves the top locations, by HTTP requests, of the requested IP version.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["os"] = $os
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/http/top/locations/ip_version/{ipVersion}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTopLocationsIpVersionIpVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTopLocationsOsOs*(client: CloudflareClient, os: Os,
                                   limit: int64 = 5, name: seq[string] = @[],
                                   dateRange: seq[string] = @[],
                                   dateStart: seq[string] = @[],
                                   dateEnd: seq[string] = @[],
                                   asn: seq[string] = @[],
                                   location: seq[string] = @[],
                                   continent: seq[string] = @[],
                                   geoId: seq[string] = @[],
                                   botClass: seq[string] = default(seq[string]),
                                   deviceType: seq[string] = default(seq[string]),
                                   httpProtocol: seq[string] = default(seq[string]),
                                   httpVersion: seq[string] = default(seq[string]),
                                   ipVersion: seq[string] = default(seq[string]),
                                   tlsVersion: seq[string] = default(seq[string]),
                                   browserFamily: seq[string] = default(seq[string]),
                                   format: RadarHttpFormatOption): Future[GetRadarHttpTopLocationsOsOsResponse] {.async.} =
  ## Retrieves the top locations, by HTTP requests, of the requested operating
  ## system.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["tlsVersion"] = $tlsVersion
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/http/top/locations/os/{os}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTopLocationsOsOsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarHttpTopLocationsTlsVersionTlsVersion*(client: CloudflareClient,
                                                   tlsVersion: TlsVersion,
                                                   limit: int64 = 5,
                                                   name: seq[string] = @[],
                                                   dateRange: seq[string] = @[],
                                                   dateStart: seq[string] = @[],
                                                   dateEnd: seq[string] = @[],
                                                   asn: seq[string] = @[],
                                                   location: seq[string] = @[],
                                                   continent: seq[string] = @[],
                                                   geoId: seq[string] = @[],
                                                   botClass: seq[string] = default(seq[string]),
                                                   deviceType: seq[string] = default(seq[string]),
                                                   httpProtocol: seq[string] = default(seq[string]),
                                                   httpVersion: seq[string] = default(seq[string]),
                                                   ipVersion: seq[string] = default(seq[string]),
                                                   os: seq[string] = default(seq[string]),
                                                   browserFamily: seq[string] = default(seq[string]),
                                                   format: RadarHttpFormatOption): Future[GetRadarHttpTopLocationsTlsVersionTlsVersionResponse] {.async.} =
  ## Retrieves the top locations, by HTTP requests, of the requested TLS protocol
  ## version.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in name: q["name"] = $v
  for v in dateRange: q["dateRange"] = $v
  for v in dateStart: q["dateStart"] = $v
  for v in dateEnd: q["dateEnd"] = $v
  for v in asn: q["asn"] = $v
  for v in location: q["location"] = $v
  for v in continent: q["continent"] = $v
  for v in geoId: q["geoId"] = $v
  q["botClass"] = $botClass
  q["deviceType"] = $deviceType
  q["httpProtocol"] = $httpProtocol
  q["httpVersion"] = $httpVersion
  q["ipVersion"] = $ipVersion
  q["os"] = $os
  q["browserFamily"] = $browserFamily
  q["format"] = $format
  let res = await client.httpGET(fmt"/radar/http/top/locations/tls_version/{tlsVersion}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarHttpTopLocationsTlsVersionTlsVersionResponse)
  else:
    raise newException(CloudflareClientError, body)
