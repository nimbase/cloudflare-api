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
  EmailRoutingRoutingRuleEnabledOption* = enum
    enabledTrue = "true"
    enabledFalse = "false"


proc getAccountsAccountIdEmailRoutingRules*(client: CloudflareClient,
                                            accountId: types.EmailIdentifier,
                                            page: float64 = default(float64),
                                            perPage: float64 = default(float64),
                                            enabled: EmailRoutingRoutingRuleEnabledOption): Future[types.EmailAccountRulesResponseCollection] {.async.} =
  ## Lists existing routing rules across all zones in the account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["enabled"] = $enabled
  let res = await client.httpGET(fmt"/accounts/{accountId}/email/routing/rules", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailAccountRulesResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailRoutingRulesPlan*(client: CloudflareClient,
                                                 accountId: types.EmailIdentifier,
                                                 body: types.EmailAccountRulesPlanRequest): Future[types.EmailAccountRulesPlanResponseSingle] {.async.} =
  ## Computes the Email Routing rule changes that would be needed to reconcile a
  ## Wrangler-managed desired ruleset. This endpoint is read-only and does not
  ## create, update, or delete rules.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/email/routing/rules/plan", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailAccountRulesPlanResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdEmailRoutingRules*(client: CloudflareClient,
                                      zoneId: types.EmailIdentifier,
                                      page: float64 = default(float64),
                                      perPage: float64 = default(float64),
                                      enabled: EmailRoutingRoutingRuleEnabledOption): Future[types.EmailRulesResponseCollection] {.async.} =
  ## Lists existing routing rules.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["enabled"] = $enabled
  let res = await client.httpGET(fmt"/zones/{zoneId}/email/routing/rules", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailRulesResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdEmailRoutingRules*(client: CloudflareClient,
                                       zoneId: types.EmailIdentifier,
                                       body: types.EmailCreateRuleProperties): Future[types.EmailRuleResponseSingle] {.async.} =
  ## Rules consist of a set of criteria for matching emails (such as an email being
  ## sent to a specific custom email address) plus a set of actions to take on the
  ## email (like forwarding it to a specific destination address). Forward actions
  ## require exactly one verified destination address.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/email/routing/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailRuleResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdEmailRoutingRulesCatchAll*(client: CloudflareClient,
                                              zoneId: types.EmailIdentifier): Future[types.EmailCatchAllRuleResponseSingle] {.async.} =
  ## Get information on the default catch-all routing rule.

  let res = await client.httpGET(fmt"/zones/{zoneId}/email/routing/rules/catch_all")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailCatchAllRuleResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdEmailRoutingRulesCatchAll*(client: CloudflareClient,
                                              zoneId: types.EmailIdentifier,
                                              body: types.EmailUpdateCatchAllRuleProperties): Future[types.EmailCatchAllRuleResponseSingle] {.async.} =
  ## Enable or disable catch-all routing rule, or change action to forward to a
  ## specific destination address. Forward actions require exactly one verified
  ## destination address.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/email/routing/rules/catch_all", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailCatchAllRuleResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdEmailRoutingRulesRuleIdentifier*(client: CloudflareClient,
                                                    ruleIdentifier: types.EmailRuleIdentifier,
                                                    zoneId: types.EmailIdentifier): Future[types.EmailRuleResponseSingle] {.async.} =
  ## Get information for a specific routing rule already created.

  let res = await client.httpGET(fmt"/zones/{zoneId}/email/routing/rules/{ruleIdentifier}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailRuleResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdEmailRoutingRulesRuleIdentifier*(client: CloudflareClient,
                                                    ruleIdentifier: types.EmailRuleIdentifier,
                                                    zoneId: types.EmailIdentifier,
                                                    body: types.EmailUpdateRuleProperties): Future[types.EmailRuleResponseSingle] {.async.} =
  ## Update actions and matches, or enable/disable specific routing rules. Forward
  ## actions require exactly one verified destination address.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/email/routing/rules/{ruleIdentifier}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailRuleResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdEmailRoutingRulesRuleIdentifier*(client: CloudflareClient,
                                                       ruleIdentifier: types.EmailRuleIdentifier,
                                                       zoneId: types.EmailIdentifier): Future[types.EmailRuleResponseSingle] {.async.} =
  ## Delete a specific routing rule.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/email/routing/rules/{ruleIdentifier}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailRuleResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
