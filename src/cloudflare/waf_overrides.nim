# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
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

proc getZonesZoneIdFirewallWafOverrides*(client: CloudflareClient,
                                         zoneId: types.FirewallIdentifier,
                                         page: float64 = default(float64),
                                         perPage: float64 = default(float64)): Future[AsyncResponse] {.async.} =
  ## **This endpoint has been deprecated and returns 410 Gone. Please use the
  ## [Rulesets API](https://developers.cloudflare.com/ruleset-engine/) instead.**
  ##
  ## Previously fetched the URI-based WAF overrides in a zone.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/zones/{zoneId}/firewall/waf/overrides", q)
  return res

proc postZonesZoneIdFirewallWafOverrides*(client: CloudflareClient,
                                          zoneId: types.FirewallIdentifier,
                                          body: PostZonesZoneIdFirewallWafOverridesRequest): Future[AsyncResponse] {.async.} =
  ## **This endpoint has been deprecated and returns 410 Gone. Please use the
  ## [Rulesets API](https://developers.cloudflare.com/ruleset-engine/) instead.**
  ##
  ## Previously created a URI-based WAF override for a zone.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/firewall/waf/overrides", body)
  return res

proc getZonesZoneIdFirewallWafOverridesOverridesId*(client: CloudflareClient,
                                                    overridesId: types.FirewallOverridesId,
                                                    zoneId: types.FirewallIdentifier): Future[AsyncResponse] {.async.} =
  ## **This endpoint has been deprecated and returns 410 Gone. Please use the
  ## [Rulesets API](https://developers.cloudflare.com/ruleset-engine/) instead.**
  ##
  ## Previously fetched the details of a URI-based WAF override.

  let res = await client.httpGET(fmt"/zones/{zoneId}/firewall/waf/overrides/{overridesId}")
  return res

proc putZonesZoneIdFirewallWafOverridesOverridesId*(client: CloudflareClient,
                                                    overridesId: types.FirewallOverridesId,
                                                    zoneId: types.FirewallIdentifier,
                                                    body: PutZonesZoneIdFirewallWafOverridesOverridesIdRequest): Future[AsyncResponse] {.async.} =
  ## **This endpoint has been deprecated and returns 410 Gone. Please use the
  ## [Rulesets API](https://developers.cloudflare.com/ruleset-engine/) instead.**
  ##
  ## Previously updated an existing URI-based WAF override.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/firewall/waf/overrides/{overridesId}", body)
  return res

proc deleteZonesZoneIdFirewallWafOverridesOverridesId*(client: CloudflareClient,
                                                       overridesId: types.FirewallOverridesId,
                                                       zoneId: types.FirewallIdentifier): Future[AsyncResponse] {.async.} =
  ## **This endpoint has been deprecated and returns 410 Gone. Please use the
  ## [Rulesets API](https://developers.cloudflare.com/ruleset-engine/) instead.**
  ##
  ## Previously deleted an existing URI-based WAF override.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/firewall/waf/overrides/{overridesId}")
  return res
