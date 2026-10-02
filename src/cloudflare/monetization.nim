# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdMonetization*(client: CloudflareClient,
                                       accountId: types.MonetizationAccountIdentifier): Future[types.MonetizationMonetizationEligibilityResponse] {.async.} =
  ## Returns the account's latest stored monetization eligibility result.

  let res = await client.httpGET(fmt"/accounts/{accountId}/monetization")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MonetizationMonetizationEligibilityResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMonetization*(client: CloudflareClient,
                                        accountId: types.MonetizationAccountIdentifier,
                                        body: types.MonetizationMonetizationAccountEligibilityCheckInput): Future[types.MonetizationMonetizationAccountEligibilityCheckResponse] {.async.} =
  ## Checks the account for Monetization Gateway eligibility and returns its pending,
  ## approved, or rejected decision.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/monetization", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MonetizationMonetizationAccountEligibilityCheckResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdMonetization*(client: CloudflareClient,
                                 zoneId: types.MonetizationZoneIdentifier): Future[types.MonetizationMonetizationEligibilityResponse] {.async.} =
  ## Returns the zone's latest stored monetization eligibility result.

  let res = await client.httpGET(fmt"/zones/{zoneId}/monetization")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MonetizationMonetizationEligibilityResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdMonetization*(client: CloudflareClient,
                                  zoneId: types.MonetizationZoneIdentifier): Future[types.MonetizationMonetizationZoneEligibilityCheckResponse] {.async.} =
  ## Checks the zone for Monetization Gateway eligibility and enables its entitlement
  ## when the decision is approved.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/monetization")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MonetizationMonetizationZoneEligibilityCheckResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdMonetizationRules*(client: CloudflareClient,
                                      zoneId: types.MonetizationZoneIdentifier): Future[types.MonetizationMonetizationRuleCollectionResponse] {.async.} =
  ## Returns the currently deployed Payment Required rules for a zone. A zone with no
  ## Payment Required ruleset returns 404.

  let res = await client.httpGET(fmt"/zones/{zoneId}/monetization/rules")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MonetizationMonetizationRuleCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdMonetizationRules*(client: CloudflareClient,
                                      zoneId: types.MonetizationZoneIdentifier,
                                      body: types.MonetizationMonetizationRulesetInput): Future[types.MonetizationMonetizationRuleCollectionResponse] {.async.} =
  ## Replaces the zone's Payment Required ruleset with the submitted desired state.
  ## Submit an empty rules array to clear all payment rules.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/monetization/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MonetizationMonetizationRuleCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdMonetizationRules*(client: CloudflareClient,
                                         zoneId: types.MonetizationZoneIdentifier): Future[types.MonetizationMonetizationRuleCollectionResponse] {.async.} =
  ## Removes every Payment Required rule from the zone. Any rules the service does
  ## not own are preserved. Deleting a zone with no payment rules is a no-op. Returns
  ## the resulting (empty) rule collection.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/monetization/rules")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MonetizationMonetizationRuleCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdMonetizationRulesRuleId*(client: CloudflareClient,
                                            zoneId: types.MonetizationZoneIdentifier,
                                            ruleId: types.MonetizationIdentifier): Future[types.MonetizationMonetizationRuleResponse] {.async.} =
  ## Returns a single Payment Required rule identified by its ID.

  let res = await client.httpGET(fmt"/zones/{zoneId}/monetization/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MonetizationMonetizationRuleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdMonetizationRulesRuleId*(client: CloudflareClient,
                                               zoneId: types.MonetizationZoneIdentifier,
                                               ruleId: types.MonetizationIdentifier): Future[types.MonetizationMonetizationRuleCollectionResponse] {.async.} =
  ## Removes a single Payment Required rule identified by its ID. Every other rule is
  ## preserved. Returns the resulting rule collection.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/monetization/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MonetizationMonetizationRuleCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdMonetizationRulesRuleId*(client: CloudflareClient,
                                              zoneId: types.MonetizationZoneIdentifier,
                                              ruleId: types.MonetizationIdentifier,
                                              body: types.MonetizationMonetizationRulePatch): Future[types.MonetizationMonetizationRuleCollectionResponse] {.async.} =
  ## Applies a partial update to a single Payment Required rule. Only the fields
  ## present in the request body are changed; omitted fields keep their current
  ## values. Returns the full resulting rule collection.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/monetization/rules/{ruleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MonetizationMonetizationRuleCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)
