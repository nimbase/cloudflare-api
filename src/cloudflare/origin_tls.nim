# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types

type
  PutZonesZoneIdSettingsOriginTlsComplianceModesRequest = object
    value: types.CacheRulesOriginTlsComplianceModesValue
  PatchZonesZoneIdSettingsOriginTlsComplianceModesRequest = object
    value: types.CacheRulesOriginTlsComplianceModesValue

proc getZonesZoneIdSettingsAutoOriginTlsKex*(client: CloudflareClient,
                                             zoneId: types.CacheIdentifier): Future[types.CacheAutoOriginTlsKexResponse] {.async.} =
  ## When enabled, Cloudflare automatically selects the preferred TLS key-exchange
  ## algorithm to use when establishing the TLS connection to the zone's origin,
  ## picking from the algorithms permitted by the zone's
  ## `origin_tls_compliance_modes` setting. When disabled, the default key-exchange
  ## ordering is used.

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/auto_origin_tls_kex")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CacheAutoOriginTlsKexResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSettingsAutoOriginTlsKex*(client: CloudflareClient,
                                               zoneId: types.CacheIdentifier,
                                               body: types.CacheAutoOriginTlsKexPatch): Future[types.CacheAutoOriginTlsKexResponse] {.async.} =
  ## Enable or disable Auto-Origin TLS KEX selection for the zone by sending
  ## `{"enabled": true}` or `{"enabled": false}`. When enabled, Cloudflare runs a
  ## periodic scan of the zone's origins to determine the preferred key-exchange
  ## algorithm and writes that preference to the edge so it is sent first in the TLS
  ## ClientHello to the origin.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/settings/auto_origin_tls_kex", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CacheAutoOriginTlsKexResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSettingsOriginTlsComplianceModes*(client: CloudflareClient,
                                                     zoneId: types.CacheRulesIdentifier): Future[JsonNode] {.async.} =
  ## Origin TLS Compliance Modes constrains the set of TLS key-exchange algorithms
  ## Cloudflare may use when establishing the TLS connection to the zone's origin.
  ## The value is a list of named compliance modes (currently `fips` and `pqh`).
  ## Multiple modes are combined as the intersection of their permitted algorithm
  ## lists. An empty list (or no rule configured) means no compliance constraint is
  ## applied.

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/origin_tls_compliance_modes")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdSettingsOriginTlsComplianceModes*(client: CloudflareClient,
                                                     zoneId: types.CacheRulesIdentifier,
                                                     body: PutZonesZoneIdSettingsOriginTlsComplianceModesRequest): Future[JsonNode] {.async.} =
  ## Replace the entire set of TLS compliance modes for the zone with the list
  ## provided in the request body. PUT performs a full replace, not a merge — any
  ## modes not present in the request body are removed. The request body must be of
  ## the form `{"value": ["fips", "pqh"]}`. Currently supported modes are `fips` and
  ## `pqh`; an empty list clears the constraint. Future modes (e.g. `cnsa2`) may be
  ## added; clients should treat unknown values as opaque strings. Invalid mode
  ## values are rejected with a 4xx response.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/settings/origin_tls_compliance_modes", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdSettingsOriginTlsComplianceModes*(client: CloudflareClient,
                                                        zoneId: types.CacheRulesIdentifier): Future[JsonNode] {.async.} =
  ## Delete the Origin TLS Compliance Modes setting for the zone, removing any
  ## configured compliance constraint. After deletion, Cloudflare's default behavior
  ## applies (no compliance filtering of the key-exchange algorithm list sent to the
  ## origin).

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/settings/origin_tls_compliance_modes")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSettingsOriginTlsComplianceModes*(client: CloudflareClient,
                                                       zoneId: types.CacheRulesIdentifier,
                                                       body: PatchZonesZoneIdSettingsOriginTlsComplianceModesRequest): Future[JsonNode] {.async.} =
  ## Update the set of TLS compliance modes for the zone. PATCH performs a full
  ## replace of the modes list, not a merge — the request body is treated as the
  ## complete new list, and any modes not present in it are removed. (To remove a
  ## single mode from an existing configuration, send the updated list without it.)
  ## The request body must be of the form `{"value": ["fips", "pqh"]}`. Currently
  ## supported modes are `fips` and `pqh`; an empty list clears the constraint.
  ## Future modes (e.g. `cnsa2`) may be added; clients should treat unknown values as
  ## opaque strings. Invalid mode values are rejected with a 4xx response.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/settings/origin_tls_compliance_modes", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
