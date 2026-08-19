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
  PostZonesZoneIdFirewallWafOverridesRequest = object
    urls: types.FirewallUrls
  PutZonesZoneIdFirewallWafOverridesOverridesIdRequest = object
    id: types.FirewallIdentifier
    rewrite_action: types.FirewallRewriteAction
    rules: types.FirewallRules
    urls: types.FirewallUrls
  DeleteZonesZoneIdFirewallWafOverridesOverridesIdResponse* = object
    result: JsonNode

proc getZonesZoneIdFirewallWafOverrides*(client: CloudflareClient,
                                         zoneId: types.FirewallIdentifier,
                                         page: float64 = default(float64),
                                         perPage: float64 = default(float64)): Future[types.FirewallOverrideResponseCollection] {.async.} =
  ## **This endpoint has been deprecated and returns 410 Gone. Please use the
  ## [Rulesets API](https://developers.cloudflare.com/ruleset-engine/) instead.**
  ##
  ## Previously fetched the URI-based WAF overrides in a zone.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/zones/{zoneId}/firewall/waf/overrides", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallOverrideResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdFirewallWafOverrides*(client: CloudflareClient,
                                          zoneId: types.FirewallIdentifier,
                                          body: PostZonesZoneIdFirewallWafOverridesRequest): Future[types.FirewallOverrideResponseSingle] {.async.} =
  ## **This endpoint has been deprecated and returns 410 Gone. Please use the
  ## [Rulesets API](https://developers.cloudflare.com/ruleset-engine/) instead.**
  ##
  ## Previously created a URI-based WAF override for a zone.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/firewall/waf/overrides", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallOverrideResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdFirewallWafOverridesOverridesId*(client: CloudflareClient,
                                                    overridesId: types.FirewallOverridesId,
                                                    zoneId: types.FirewallIdentifier): Future[types.FirewallOverrideResponseSingle] {.async.} =
  ## **This endpoint has been deprecated and returns 410 Gone. Please use the
  ## [Rulesets API](https://developers.cloudflare.com/ruleset-engine/) instead.**
  ##
  ## Previously fetched the details of a URI-based WAF override.

  let res = await client.httpGET(fmt"/zones/{zoneId}/firewall/waf/overrides/{overridesId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallOverrideResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdFirewallWafOverridesOverridesId*(client: CloudflareClient,
                                                    overridesId: types.FirewallOverridesId,
                                                    zoneId: types.FirewallIdentifier,
                                                    body: PutZonesZoneIdFirewallWafOverridesOverridesIdRequest): Future[types.FirewallOverrideResponseSingle] {.async.} =
  ## **This endpoint has been deprecated and returns 410 Gone. Please use the
  ## [Rulesets API](https://developers.cloudflare.com/ruleset-engine/) instead.**
  ##
  ## Previously updated an existing URI-based WAF override.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/firewall/waf/overrides/{overridesId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallOverrideResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdFirewallWafOverridesOverridesId*(client: CloudflareClient,
                                                       overridesId: types.FirewallOverridesId,
                                                       zoneId: types.FirewallIdentifier): Future[DeleteZonesZoneIdFirewallWafOverridesOverridesIdResponse] {.async.} =
  ## **This endpoint has been deprecated and returns 410 Gone. Please use the
  ## [Rulesets API](https://developers.cloudflare.com/ruleset-engine/) instead.**
  ##
  ## Previously deleted an existing URI-based WAF override.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/firewall/waf/overrides/{overridesId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteZonesZoneIdFirewallWafOverridesOverridesIdResponse)
  else:
    raise newException(CloudflareClientError, body)
