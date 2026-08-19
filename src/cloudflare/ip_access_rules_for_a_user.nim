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
  PostUserFirewallAccessRulesRulesRequest = object
    configuration: types.FirewallConfiguration
    mode: types.FirewallSchemasMode
    notes: Option[JsonNode]
  PatchUserFirewallAccessRulesRulesRuleIdRequest = object
    mode: Option[types.FirewallSchemasMode]
    notes: Option[types.FirewallNotes]
  IpAccessRulesForAUserConfigurationTargetOption* = enum
    configurationTargetIp = "ip"
    configurationTargetIpRange = "ip_range"
    configurationTargetAsn = "asn"
    configurationTargetCountry = "country"

  IpAccessRulesForAUserMatchOption* = enum
    matchAny = "any"
    matchAll = "all"

  IpAccessRulesForAUserOrderOption* = enum
    orderConfigurationTarget = "configuration.target"
    orderConfigurationValue = "configuration.value"
    orderMode = "mode"

  IpAccessRulesForAUserDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getUserFirewallAccessRulesRules*(client: CloudflareClient,
                                      mode: types.FirewallSchemasMode = default(types.FirewallSchemasMode),
                                      configurationTarget: set[IpAccessRulesForAUserConfigurationTargetOption] = {},
                                      configurationValue: string = default(string),
                                      notes: string = default(string),
                                      match: string = "all",
                                      page: float64 = default(float64),
                                      perPage: float64 = default(float64),
                                      order: set[IpAccessRulesForAUserOrderOption] = {},
                                      direction: set[IpAccessRulesForAUserDirectionOption] = {}): Future[types.FirewallRuleCollectionResponse] {.async.} =
  ## Fetches IP Access rules of the user. You can filter the results using several
  ## optional parameters.

  var q = initOrderedTable[string, string]()
  q["mode"] = $mode
  for v in configurationTarget: q["configuration.target"] = $v
  q["configuration.value"] = $configurationValue
  q["notes"] = $notes
  for v in match: q["match"] = $v
  q["page"] = $page
  q["per_page"] = $perPage
  for v in order: q["order"] = $v
  for v in direction: q["direction"] = $v
  let res = await client.httpGET("/user/firewall/access_rules/rules", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallRuleCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postUserFirewallAccessRulesRules*(client: CloudflareClient,
                                       body: PostUserFirewallAccessRulesRulesRequest): Future[types.FirewallRuleSingleResponse] {.async.} =
  ## Creates a new IP Access rule for all zones owned by the current user.
  ##
  ## Note: To create an IP Access rule that applies to a specific zone, refer to the
  ## [IP Access rules for a zone](#ip-access-rules-for-a-zone) endpoints.

  let res = await client.httpPOST("/user/firewall/access_rules/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallRuleSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getUserFirewallAccessRulesRulesRuleId*(client: CloudflareClient,
                                            ruleId: types.FirewallRuleIdentifier): Future[types.FirewallRuleSingleResponse] {.async.} =
  ## Fetches the details of an IP Access rule defined at the user level.

  let res = await client.httpGET(fmt"/user/firewall/access_rules/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallRuleSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteUserFirewallAccessRulesRulesRuleId*(client: CloudflareClient,
                                               ruleId: types.FirewallRuleIdentifier): Future[types.FirewallRuleSingleIdResponse] {.async.} =
  ## Deletes an IP Access rule at the user level.
  ##
  ## Note: Deleting a user-level rule will affect all zones owned by the user.

  let res = await client.httpDELETE(fmt"/user/firewall/access_rules/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallRuleSingleIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchUserFirewallAccessRulesRulesRuleId*(client: CloudflareClient,
                                              ruleId: types.FirewallRuleIdentifier,
                                              body: PatchUserFirewallAccessRulesRulesRuleIdRequest): Future[types.FirewallRuleSingleResponse] {.async.} =
  ## Updates an IP Access rule defined at the user level. You can only update the
  ## rule action (`mode` parameter) and notes.

  let res = await client.httpPATCH(fmt"/user/firewall/access_rules/rules/{ruleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallRuleSingleResponse)
  else:
    raise newException(CloudflareClientError, body)
