# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingRulesResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  PutAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingRulesRequest = object
    rules: seq[JsonNode]
  PutAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingRulesResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  GetAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingSettingsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  PatchAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingSettingsRequest = object
    destinations: Option[seq[string]]
    enabled: Option[bool]
    forward_context: Option[bool]
    persist: Option[bool]
    propagation_policy: Option[string]
    sampling_ratio: Option[float64]
  PatchAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingSettingsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool

proc getAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingRules*(client: CloudflareClient,
                                                                                   zoneId: string): Future[GetAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingRulesResponse] {.async.} =
  ## Retrieve the ordered sampling overrides for a zone's managed Cloudflare Traces
  ## ruleset.

  let res = await client.httpGET(fmt"/accounts/{account_id}/workers/observability/zones/{zoneId}/observability/tracing/rules")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingRulesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingRules*(client: CloudflareClient,
                                                                                   zoneId: string,
                                                                                   body: PutAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingRulesRequest): Future[PutAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingRulesResponse] {.async.} =
  ## Replace all sampling overrides in a zone's managed Cloudflare Traces ruleset.
  ## Rules are evaluated in the supplied order.

  let res = await client.httpPUT(fmt"/accounts/{account_id}/workers/observability/zones/{zoneId}/observability/tracing/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingRulesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingSettings*(client: CloudflareClient,
                                                                                      zoneId: string): Future[GetAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingSettingsResponse] {.async.} =
  ## Retrieve the zone-level Cloudflare Traces settings.

  let res = await client.httpGET(fmt"/accounts/{account_id}/workers/observability/zones/{zoneId}/observability/tracing/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingSettings*(client: CloudflareClient,
                                                                                        zoneId: string,
                                                                                        body: PatchAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingSettingsRequest): Future[PatchAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingSettingsResponse] {.async.} =
  ## Update the zone-level Cloudflare Traces settings.

  let res = await client.httpPATCH(fmt"/accounts/{account_id}/workers/observability/zones/{zoneId}/observability/tracing/settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)
