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
  PatchZonesZoneIdFirewallWafPackagesPackageIdRulesRuleIdRequest = object
    mode: Option[string]
  WafRuleModeOption* = enum
    modeDIS = "DIS"
    modeCHL = "CHL"
    modeBLK = "BLK"
    modeSIM = "SIM"

  WafRuleOrderOption* = enum
    orderPriority = "priority"
    orderGroupId = "group_id"
    orderDescription = "description"

  WafRuleDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"

  WafRuleMatchOption* = enum
    matchAny = "any"
    matchAll = "all"


proc getZonesZoneIdFirewallWafPackagesPackageIdRules*(client: CloudflareClient,
                                                      packageId: types.WafManagedRulesIdentifier,
                                                      zoneId: types.WafManagedRulesSchemasIdentifier,
                                                      mode: set[WafRuleModeOption] = {},
                                                      groupId: JsonNode = default(JsonNode),
                                                      page: float64 = default(float64),
                                                      perPage: float64 = default(float64),
                                                      order: set[WafRuleOrderOption] = {},
                                                      direction: set[WafRuleDirectionOption] = {},
                                                      match: string = "all",
                                                      description: string = default(string),
                                                      priority: string = default(string)): Future[types.WafManagedRulesRuleResponseCollection] {.async.} =
  ## Fetches WAF rules in a WAF package.
  ##
  ## **Note:** Applies only to the [previous version of WAF managedrules](https://de
  ## velopers.cloudflare.com/support/firewall/managed-rules-web-application-firewall-
  ## waf/understanding-waf-managed-rules-web-application-firewall/).

  var q = initOrderedTable[string, string]()
  for v in mode: q["mode"] = $v
  q["group_id"] = $groupId
  q["page"] = $page
  q["per_page"] = $perPage
  for v in order: q["order"] = $v
  for v in direction: q["direction"] = $v
  for v in match: q["match"] = $v
  q["description"] = $description
  q["priority"] = $priority
  let res = await client.httpGET(fmt"/zones/{zoneId}/firewall/waf/packages/{packageId}/rules", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafManagedRulesRuleResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdFirewallWafPackagesPackageIdRulesRuleId*(client: CloudflareClient,
                                                            ruleId: types.WafManagedRulesIdentifier,
                                                            packageId: types.WafManagedRulesIdentifier,
                                                            zoneId: types.WafManagedRulesSchemasIdentifier): Future[types.WafManagedRulesRuleResponseSingle] {.async.} =
  ## Fetches the details of a WAF rule in a WAF package.
  ##
  ## **Note:** Applies only to the [previous version of WAF managedrules](https://de
  ## velopers.cloudflare.com/support/firewall/managed-rules-web-application-firewall-
  ## waf/understanding-waf-managed-rules-web-application-firewall/).

  let res = await client.httpGET(fmt"/zones/{zoneId}/firewall/waf/packages/{packageId}/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafManagedRulesRuleResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdFirewallWafPackagesPackageIdRulesRuleId*(client: CloudflareClient,
                                                              ruleId: types.WafManagedRulesIdentifier,
                                                              packageId: types.WafManagedRulesIdentifier,
                                                              zoneId: types.WafManagedRulesSchemasIdentifier,
                                                              body: PatchZonesZoneIdFirewallWafPackagesPackageIdRulesRuleIdRequest): Future[JsonNode] {.async.} =
  ## Updates a WAF rule. You can only update the mode/action of the rule.
  ##
  ## **Note:** Applies only to the [previous version of WAF managedrules](https://de
  ## velopers.cloudflare.com/support/firewall/managed-rules-web-application-firewall-
  ## waf/understanding-waf-managed-rules-web-application-firewall/).

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/firewall/waf/packages/{packageId}/rules/{ruleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
