# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient
import ./private/types

type
  PatchZonesZoneIdFirewallWafPackagesPackageIdRequest = object
    action_mode: Option[types.FirewallActionMode]
    sensitivity: Option[types.FirewallSensitivity]
  WafPackageOrderOption* = enum
    orderName = "name"

  WafPackageDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"

  WafPackageMatchOption* = enum
    matchAny = "any"
    matchAll = "all"


proc getZonesZoneIdFirewallWafPackages*(client: CloudflareClient,
                                        zoneId: types.FirewallIdentifier,
                                        page: float64 = default(float64),
                                        perPage: float64 = default(float64),
                                        order: set[WafPackageOrderOption] = {},
                                        direction: set[WafPackageDirectionOption] = {},
                                        match: string = "all",
                                        name: string = default(string)): Future[types.FirewallPackageResponseCollection] {.async.} =
  ## Fetches WAF packages for a zone.
  ##
  ## **Note:** Applies only to the [previous version of WAF managedrules](https://de
  ## velopers.cloudflare.com/support/firewall/managed-rules-web-application-firewall-
  ## waf/understanding-waf-managed-rules-web-application-firewall/).

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  for v in order: q["order"] = $v
  for v in direction: q["direction"] = $v
  for v in match: q["match"] = $v
  q["name"] = $name
  let res = await client.httpGET(fmt"/zones/{zoneId}/firewall/waf/packages", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallPackageResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdFirewallWafPackagesPackageId*(client: CloudflareClient,
                                                 packageId: types.FirewallPackageId,
                                                 zoneId: types.FirewallIdentifier): Future[types.FirewallPackageResponseSingle] {.async.} =
  ## Fetches the details of a WAF package.
  ##
  ## **Note:** Applies only to the [previous version of WAF managedrules](https://de
  ## velopers.cloudflare.com/support/firewall/managed-rules-web-application-firewall-
  ## waf/understanding-waf-managed-rules-web-application-firewall/).

  let res = await client.httpGET(fmt"/zones/{zoneId}/firewall/waf/packages/{packageId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallPackageResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdFirewallWafPackagesPackageId*(client: CloudflareClient,
                                                   packageId: types.FirewallPackageId,
                                                   zoneId: types.FirewallIdentifier,
                                                   body: PatchZonesZoneIdFirewallWafPackagesPackageIdRequest): Future[JsonNode] {.async.} =
  ## Updates a WAF package. You can update the sensitivity and the action of an
  ## anomaly detection WAF package.
  ##
  ## **Note:** Applies only to the [previous version of WAF managedrules](https://de
  ## velopers.cloudflare.com/support/firewall/managed-rules-web-application-firewall-
  ## waf/understanding-waf-managed-rules-web-application-firewall/).

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/firewall/waf/packages/{packageId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
