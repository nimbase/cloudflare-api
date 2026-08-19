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
  PatchZonesZoneIdFirewallWafPackagesPackageIdGroupsGroupIdRequest = object
    mode: Option[types.WafManagedRulesMode]
  WafRuleGroupOrderOption* = enum
    orderMode = "mode"
    orderRulesCount = "rules_count"

  WafRuleGroupDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"

  WafRuleGroupMatchOption* = enum
    matchAny = "any"
    matchAll = "all"


proc getZonesZoneIdFirewallWafPackagesPackageIdGroups*(client: CloudflareClient,
                                                       packageId: types.WafManagedRulesIdentifier,
                                                       zoneId: types.WafManagedRulesSchemasIdentifier,
                                                       mode: JsonNode = default(JsonNode),
                                                       page: float64 = default(float64),
                                                       perPage: float64 = default(float64),
                                                       order: set[WafRuleGroupOrderOption] = {},
                                                       direction: set[WafRuleGroupDirectionOption] = {},
                                                       match: string = "all",
                                                       name: string = default(string),
                                                       rulesCount: float64 = default(float64)): Future[types.WafManagedRulesRuleGroupResponseCollection] {.async.} =
  ## Fetches the WAF rule groups in a WAF package.
  ##
  ## **Note:** Applies only to the [previous version of WAF managedrules](https://de
  ## velopers.cloudflare.com/support/firewall/managed-rules-web-application-firewall-
  ## waf/understanding-waf-managed-rules-web-application-firewall/).

  var q = initOrderedTable[string, string]()
  q["mode"] = $mode
  q["page"] = $page
  q["per_page"] = $perPage
  for v in order: q["order"] = $v
  for v in direction: q["direction"] = $v
  for v in match: q["match"] = $v
  q["name"] = $name
  q["rules_count"] = $rulesCount
  let res = await client.httpGET(fmt"/zones/{zoneId}/firewall/waf/packages/{packageId}/groups", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafManagedRulesRuleGroupResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdFirewallWafPackagesPackageIdGroupsGroupId*(client: CloudflareClient,
                                                              groupId: types.WafManagedRulesIdentifier,
                                                              packageId: types.WafManagedRulesIdentifier,
                                                              zoneId: types.WafManagedRulesSchemasIdentifier): Future[types.WafManagedRulesRuleGroupResponseSingle] {.async.} =
  ## Fetches the details of a WAF rule group.
  ##
  ## **Note:** Applies only to the [previous version of WAF managedrules](https://de
  ## velopers.cloudflare.com/support/firewall/managed-rules-web-application-firewall-
  ## waf/understanding-waf-managed-rules-web-application-firewall/).

  let res = await client.httpGET(fmt"/zones/{zoneId}/firewall/waf/packages/{packageId}/groups/{groupId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafManagedRulesRuleGroupResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdFirewallWafPackagesPackageIdGroupsGroupId*(client: CloudflareClient,
                                                                groupId: types.WafManagedRulesIdentifier,
                                                                packageId: types.WafManagedRulesIdentifier,
                                                                zoneId: types.WafManagedRulesSchemasIdentifier,
                                                                body: PatchZonesZoneIdFirewallWafPackagesPackageIdGroupsGroupIdRequest): Future[types.WafManagedRulesRuleGroupResponseSingle] {.async.} =
  ## Updates a WAF rule group. You can update the state (`mode` parameter) of a rule
  ## group.
  ##
  ## **Note:** Applies only to the [previous version of WAF managedrules](https://de
  ## velopers.cloudflare.com/support/firewall/managed-rules-web-application-firewall-
  ## waf/understanding-waf-managed-rules-web-application-firewall/).

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/firewall/waf/packages/{packageId}/groups/{groupId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafManagedRulesRuleGroupResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
