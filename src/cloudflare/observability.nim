# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetZonesZoneIdObservabilityTracingRulesResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  PutZonesZoneIdObservabilityTracingRulesRequest = object
    rules: seq[JsonNode]
  PutZonesZoneIdObservabilityTracingRulesResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  DeleteZonesZoneIdObservabilityTracingRulesResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  GetZonesZoneIdObservabilityTracingSettingsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  DeleteZonesZoneIdObservabilityTracingSettingsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  PatchZonesZoneIdObservabilityTracingSettingsRequest = object
    destinations: Option[seq[string]]
    enabled: Option[bool]
    forward_context: Option[bool]
    persist: Option[bool]
    propagation_policy: Option[string]
    sampling_ratio: Option[float64]
  PatchZonesZoneIdObservabilityTracingSettingsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool

proc getZonesZoneIdObservabilityTracingRules*(client: CloudflareClient,
                                              zoneId: string): Future[GetZonesZoneIdObservabilityTracingRulesResponse] {.async.} =
  ## Retrieve the ordered sampling overrides for a zone's managed Cloudflare Traces
  ## ruleset.

  let res = await client.httpGET(fmt"/zones/{zoneId}/observability/tracing/rules")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetZonesZoneIdObservabilityTracingRulesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdObservabilityTracingRules*(client: CloudflareClient,
                                              zoneId: string,
                                              body: PutZonesZoneIdObservabilityTracingRulesRequest): Future[PutZonesZoneIdObservabilityTracingRulesResponse] {.async.} =
  ## Replace all sampling overrides in a zone's managed Cloudflare Traces ruleset.
  ## Rules are evaluated in the supplied order.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/observability/tracing/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutZonesZoneIdObservabilityTracingRulesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdObservabilityTracingRules*(client: CloudflareClient,
                                                 zoneId: string): Future[DeleteZonesZoneIdObservabilityTracingRulesResponse] {.async.} =
  ## Delete every sampling override from a zone's managed Cloudflare Traces ruleset.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/observability/tracing/rules")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteZonesZoneIdObservabilityTracingRulesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdObservabilityTracingSettings*(client: CloudflareClient,
                                                 zoneId: string): Future[GetZonesZoneIdObservabilityTracingSettingsResponse] {.async.} =
  ## Retrieve the zone-level Cloudflare Traces settings.

  let res = await client.httpGET(fmt"/zones/{zoneId}/observability/tracing/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetZonesZoneIdObservabilityTracingSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdObservabilityTracingSettings*(client: CloudflareClient,
                                                    zoneId: string): Future[DeleteZonesZoneIdObservabilityTracingSettingsResponse] {.async.} =
  ## Reset the zone-level Cloudflare Traces settings to their defaults while
  ## preserving the sampling rules.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/observability/tracing/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteZonesZoneIdObservabilityTracingSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdObservabilityTracingSettings*(client: CloudflareClient,
                                                   zoneId: string,
                                                   body: PatchZonesZoneIdObservabilityTracingSettingsRequest): Future[PatchZonesZoneIdObservabilityTracingSettingsResponse] {.async.} =
  ## Update the zone-level Cloudflare Traces settings.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/observability/tracing/settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchZonesZoneIdObservabilityTracingSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)
