# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetZonesZoneIdImagesV1FlowsResponse* = object
    result: JsonNode
    success: bool
  PutZonesZoneIdImagesV1FlowsRequest = object
    etag: Option[string]
    flows: seq[JsonNode]
    version: float64
  PutZonesZoneIdImagesV1FlowsResponse* = object
    result: JsonNode
    success: bool

proc getZonesZoneIdImagesV1Flows*(client: CloudflareClient, zoneId: string): Future[GetZonesZoneIdImagesV1FlowsResponse] {.async.} =
  ## Get the current transformation flows configuration for a zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/images/v1/flows")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetZonesZoneIdImagesV1FlowsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdImagesV1Flows*(client: CloudflareClient, zoneId: string,
                                  body: PutZonesZoneIdImagesV1FlowsRequest): Future[PutZonesZoneIdImagesV1FlowsResponse] {.async.} =
  ## Replace the entire transformation flows configuration for a zone.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/images/v1/flows", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutZonesZoneIdImagesV1FlowsResponse)
  else:
    raise newException(CloudflareClientError, body)
