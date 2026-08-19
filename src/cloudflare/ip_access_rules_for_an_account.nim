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
  PostAccountsAccountIdFirewallAccessRulesRulesRequest = object
    configuration: types.FirewallConfiguration
    mode: types.FirewallSchemasMode
    notes: Option[JsonNode]
  IpAccessRulesForAnAccountConfigurationTargetOption* = enum
    configurationTargetIp = "ip"
    configurationTargetIpRange = "ip_range"
    configurationTargetAsn = "asn"
    configurationTargetCountry = "country"

  IpAccessRulesForAnAccountMatchOption* = enum
    matchAny = "any"
    matchAll = "all"

  IpAccessRulesForAnAccountOrderOption* = enum
    orderConfigurationTarget = "configuration.target"
    orderConfigurationValue = "configuration.value"
    orderMode = "mode"

  IpAccessRulesForAnAccountDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdFirewallAccessRulesRules*(client: CloudflareClient,
                                                   accountId: types.FirewallAccountIdentifier,
                                                   mode: types.FirewallSchemasMode = default(types.FirewallSchemasMode),
                                                   configurationTarget: set[IpAccessRulesForAnAccountConfigurationTargetOption] = {},
                                                   configurationValue: string = default(string),
                                                   notes: string = default(string),
                                                   match: string = "all",
                                                   page: float64 = default(float64),
                                                   perPage: float64 = default(float64),
                                                   order: set[IpAccessRulesForAnAccountOrderOption] = {},
                                                   direction: set[IpAccessRulesForAnAccountDirectionOption] = {}): Future[types.FirewallResponseCollection] {.async.} =
  ## Fetches IP Access rules of an account. These rules apply to all the zones in the
  ## account. You can filter the results using several optional parameters.

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
  let res = await client.httpGET(fmt"/accounts/{accountId}/firewall/access_rules/rules", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdFirewallAccessRulesRules*(client: CloudflareClient,
                                                    accountId: types.FirewallAccountIdentifier,
                                                    body: PostAccountsAccountIdFirewallAccessRulesRulesRequest): Future[types.FirewallResponseSingle] {.async.} =
  ## Creates a new IP Access rule for an account. The rule will apply to all zones in
  ## the account.
  ##
  ## Note: To create an IP Access rule that applies to a single zone, refer to the
  ## [IP Access rules for a zone](#ip-access-rules-for-a-zone) endpoints.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/firewall/access_rules/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdFirewallAccessRulesRulesRuleId*(client: CloudflareClient,
                                                         ruleId: types.FirewallRuleIdentifier,
                                                         accountId: types.FirewallAccountIdentifier): Future[types.FirewallResponseSingle] {.async.} =
  ## Fetches the details of an IP Access rule defined at the account level.

  let res = await client.httpGET(fmt"/accounts/{accountId}/firewall/access_rules/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdFirewallAccessRulesRulesRuleId*(client: CloudflareClient,
                                                            ruleId: types.FirewallRuleIdentifier,
                                                            accountId: types.FirewallAccountIdentifier): Future[types.FirewallApiResponseSingleId] {.async.} =
  ## Deletes an existing IP Access rule defined at the account level.
  ##
  ## Note: This operation will affect all zones in the account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/firewall/access_rules/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallApiResponseSingleId)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdFirewallAccessRulesRulesRuleId*(client: CloudflareClient,
                                                           ruleId: types.FirewallRuleIdentifier,
                                                           accountId: types.FirewallAccountIdentifier,
                                                           body: types.FirewallSchemasRule): Future[types.FirewallResponseSingle] {.async.} =
  ## Updates an IP Access rule defined at the account level.
  ##
  ## Note: This operation will affect all zones in the account.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/firewall/access_rules/rules/{ruleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
