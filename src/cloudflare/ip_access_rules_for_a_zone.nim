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
  PostZonesZoneIdFirewallAccessRulesRulesRequest = object
    configuration: types.FirewallConfiguration
    mode: types.FirewallSchemasMode
    notes: Option[JsonNode]
  DeleteZonesZoneIdFirewallAccessRulesRulesRuleIdRequest = object
    cascade: Option[string]
  PatchZonesZoneIdFirewallAccessRulesRulesRuleIdRequest = object
    mode: Option[types.FirewallSchemasMode]
    notes: Option[types.FirewallNotes]
  IpAccessRulesForAZoneConfigurationTargetOption* = enum
    configurationTargetIp = "ip"
    configurationTargetIpRange = "ip_range"
    configurationTargetAsn = "asn"
    configurationTargetCountry = "country"

  IpAccessRulesForAZoneMatchOption* = enum
    matchAny = "any"
    matchAll = "all"

  IpAccessRulesForAZoneOrderOption* = enum
    orderConfigurationTarget = "configuration.target"
    orderConfigurationValue = "configuration.value"
    orderMode = "mode"

  IpAccessRulesForAZoneDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getZonesZoneIdFirewallAccessRulesRules*(client: CloudflareClient,
                                             zoneId: types.FirewallIdentifier,
                                             mode: types.FirewallSchemasMode = default(types.FirewallSchemasMode),
                                             configurationTarget: IpAccessRulesForAZoneConfigurationTargetOption,
                                             configurationValue: string = default(string),
                                             notes: string = default(string),
                                             match: IpAccessRulesForAZoneMatchOption = matchAll,
                                             page: float64 = default(float64),
                                             perPage: float64 = default(float64),
                                             order: IpAccessRulesForAZoneOrderOption,
                                             direction: IpAccessRulesForAZoneDirectionOption): Future[types.FirewallRuleCollectionResponse] {.async.} =
  ## Fetches IP Access rules of a zone. You can filter the results using several
  ## optional parameters.

  var q = initOrderedTable[string, string]()
  q["mode"] = $mode
  q["configuration.target"] = $configurationTarget
  q["configuration.value"] = $configurationValue
  q["notes"] = $notes
  q["match"] = $match
  q["page"] = $page
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  let res = await client.httpGET(fmt"/zones/{zoneId}/firewall/access_rules/rules", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallRuleCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdFirewallAccessRulesRules*(client: CloudflareClient,
                                              zoneId: types.FirewallIdentifier,
                                              body: PostZonesZoneIdFirewallAccessRulesRulesRequest): Future[types.FirewallRuleSingleResponse] {.async.} =
  ## Creates a new IP Access rule for a zone.
  ##
  ## Note: To create an IP Access rule that applies to multiple zones, refer to [IP
  ## Access rules for a user](#ip-access-rules-for-a-user) or [IP Access rules for an
  ## account](#ip-access-rules-for-an-account) as appropriate.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/firewall/access_rules/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallRuleSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdFirewallAccessRulesRulesRuleId*(client: CloudflareClient,
                                                      zoneId: types.FirewallIdentifier,
                                                      ruleId: types.FirewallRuleIdentifier,
                                                      body: DeleteZonesZoneIdFirewallAccessRulesRulesRuleIdRequest): Future[types.FirewallRuleSingleIdResponse] {.async.} =
  ## Deletes an IP Access rule defined at the zone level.
  ##
  ## Optionally, you can use the `cascade` property to specify that you wish to
  ## delete similar rules in other zones managed by the same zone owner.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/firewall/access_rules/rules/{ruleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallRuleSingleIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdFirewallAccessRulesRulesRuleId*(client: CloudflareClient,
                                                     zoneId: types.FirewallIdentifier,
                                                     ruleId: types.FirewallRuleIdentifier,
                                                     body: PatchZonesZoneIdFirewallAccessRulesRulesRuleIdRequest): Future[types.FirewallRuleSingleResponse] {.async.} =
  ## Updates an IP Access rule defined at the zone level. You can only update the
  ## rule action (`mode` parameter) and notes.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/firewall/access_rules/rules/{ruleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallRuleSingleResponse)
  else:
    raise newException(CloudflareClientError, body)
