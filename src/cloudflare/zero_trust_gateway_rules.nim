# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdGatewayRulesRequest = object
    action: types.ZeroTrustGatewayAction
    description: Option[types.ZeroTrustGatewayDescription2]
    device_posture: Option[types.ZeroTrustGatewayDevicePosture]
    enabled: Option[types.ZeroTrustGatewayEnabled]
    expiration: Option[types.ZeroTrustGatewayExpiration]
    filters: Option[types.ZeroTrustGatewayFilters]
    identity: Option[types.ZeroTrustGatewayIdentity]
    name: types.ZeroTrustGatewayName3
    precedence: Option[types.ZeroTrustGatewayPrecedence]
    rule_settings: Option[types.ZeroTrustGatewayRuleSettings]
    schedule: Option[types.ZeroTrustGatewaySchedule]
    traffic: Option[types.ZeroTrustGatewayTraffic]
  PutAccountsAccountIdGatewayRulesRuleIdRequest = object
    action: types.ZeroTrustGatewayAction
    description: Option[types.ZeroTrustGatewayDescription2]
    device_posture: Option[types.ZeroTrustGatewayDevicePosture]
    enabled: Option[types.ZeroTrustGatewayEnabled]
    expiration: Option[types.ZeroTrustGatewayExpiration]
    filters: Option[types.ZeroTrustGatewayFilters]
    identity: Option[types.ZeroTrustGatewayIdentity]
    name: types.ZeroTrustGatewayName3
    precedence: Option[types.ZeroTrustGatewayPrecedence]
    rule_settings: Option[types.ZeroTrustGatewayRuleSettings]
    schedule: Option[types.ZeroTrustGatewaySchedule]
    traffic: Option[types.ZeroTrustGatewayTraffic]
  PatchAccountsAccountIdGatewayRulesRuleIdRequest = object
    description: Option[types.ZeroTrustGatewayDescription2]
    enabled: Option[types.ZeroTrustGatewayEnabled]
    name: Option[types.ZeroTrustGatewayName3]
    precedence: Option[types.ZeroTrustGatewayPrecedence]

proc getAccountsAccountIdGatewayRules*(client: CloudflareClient,
                                       accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewayResponseCollection6] {.async.} =
  ## List Zero Trust Gateway rules for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway/rules")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayResponseCollection6)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdGatewayRules*(client: CloudflareClient,
                                        accountId: types.ZeroTrustGatewayIdentifier2,
                                        body: PostAccountsAccountIdGatewayRulesRequest): Future[types.ZeroTrustGatewaySingleResponse4] {.async.} =
  ## Create a new Zero Trust Gateway rule.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/gateway/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewaySingleResponse4)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdGatewayRules*(client: CloudflareClient,
                                         accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewayResponseCollection6] {.async.} =
  ## Update select fields of multiple Zero Trust Gateway rules in a single request.
  ## This is commonly used to reorder rules by updating their precedence values. Only
  ## the fields provided for each rule are updated.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/gateway/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayResponseCollection6)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdGatewayRulesTenant*(client: CloudflareClient,
                                             accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewayResponseCollection6] {.async.} =
  ## List Zero Trust Gateway rules for the parent account of an account in the MSP
  ## configuration.

  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway/rules/tenant")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayResponseCollection6)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdGatewayRulesRuleId*(client: CloudflareClient,
                                             ruleId: types.ZeroTrustGatewayUuid2,
                                             accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewaySingleResponse4] {.async.} =
  ## Get a single Zero Trust Gateway rule.

  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewaySingleResponse4)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdGatewayRulesRuleId*(client: CloudflareClient,
                                             ruleId: types.ZeroTrustGatewayUuid2,
                                             accountId: types.ZeroTrustGatewayIdentifier2,
                                             body: PutAccountsAccountIdGatewayRulesRuleIdRequest): Future[types.ZeroTrustGatewaySingleResponse4] {.async.} =
  ## Update a configured Zero Trust Gateway rule.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/gateway/rules/{ruleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewaySingleResponse4)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdGatewayRulesRuleId*(client: CloudflareClient,
                                                ruleId: types.ZeroTrustGatewayUuid2,
                                                accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewayEmptyResponse] {.async.} =
  ## Delete a Zero Trust Gateway rule.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/gateway/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayEmptyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdGatewayRulesRuleId*(client: CloudflareClient,
                                               ruleId: types.ZeroTrustGatewayUuid2,
                                               accountId: types.ZeroTrustGatewayIdentifier2,
                                               body: PatchAccountsAccountIdGatewayRulesRuleIdRequest): Future[types.ZeroTrustGatewaySingleResponse4] {.async.} =
  ## Update select fields of an existing Zero Trust Gateway rule. Only the fields
  ## provided in the request body are updated. This endpoint supports a limited
  ## subset of fields (`name`, `description`, `precedence`, `enabled`). To update
  ## other fields such as `action`, `traffic`, `identity`, `device_posture`,
  ## `rule_settings`, `schedule`, or `expiration`, use the PUT endpoint for a full
  ## rule replacement.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/gateway/rules/{ruleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewaySingleResponse4)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdGatewayRulesRuleIdResetExpiration*(client: CloudflareClient,
                                                             ruleId: types.ZeroTrustGatewayUuid2,
                                                             accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewaySingleResponse4] {.async.} =
  ## Resets the expiration of a Zero Trust Gateway Rule if its duration elapsed and
  ## it has a default duration. The Zero Trust Gateway Rule must have values  for
  ## both `expiration.expires_at` and `expiration.duration`.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/gateway/rules/{ruleId}/reset_expiration")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewaySingleResponse4)
  else:
    raise newException(CloudflareClientError, body)
