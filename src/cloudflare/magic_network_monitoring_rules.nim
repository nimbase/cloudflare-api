# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdMnmRules*(client: CloudflareClient,
                                   accountId: types.MagicVisibilityMnmAccountIdentifier): Future[types.MagicVisibilityMnmMnmRulesCollectionResponse] {.async.} =
  ## Lists network monitoring rules for account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/mnm/rules")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicVisibilityMnmMnmRulesCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMnmRules*(client: CloudflareClient,
                                    accountId: types.MagicVisibilityMnmAccountIdentifier,
                                    body: types.MagicVisibilityMnmMnmRuleCreate): Future[types.MagicVisibilityMnmMnmRulesSingleResponse] {.async.} =
  ## Create network monitoring rules for account. Currently only supports creating a
  ## single rule per API request.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/mnm/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicVisibilityMnmMnmRulesSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMnmRules*(client: CloudflareClient,
                                   accountId: types.MagicVisibilityMnmAccountIdentifier,
                                   body: types.MagicVisibilityMnmMnmRuleCreate): Future[types.MagicVisibilityMnmMnmRulesSingleResponse] {.async.} =
  ## Update network monitoring rules for account.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/mnm/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicVisibilityMnmMnmRulesSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMnmRulesBulk*(client: CloudflareClient,
                                        accountId: types.MagicVisibilityMnmAccountIdentifier): Future[types.MagicVisibilityMnmMnmRulesCollectionResponse] {.async.} =
  ## Create multiple network monitoring rules for account in a single request.
  ## Supports up to 100 rules per request. All rules in a single request must be of
  ## the same type.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/mnm/rules/bulk", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicVisibilityMnmMnmRulesCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMnmRulesBulk*(client: CloudflareClient,
                                       accountId: types.MagicVisibilityMnmAccountIdentifier): Future[types.MagicVisibilityMnmMnmRulesCollectionResponse] {.async.} =
  ## Update multiple network monitoring rules for account in a single request.
  ## Supports up to 100 rules per request. All rules in a single request must be of
  ## the same type.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/mnm/rules/bulk", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicVisibilityMnmMnmRulesCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMnmRulesRuleId*(client: CloudflareClient,
                                         ruleId: types.MagicVisibilityMnmRuleIdentifier,
                                         accountId: types.MagicVisibilityMnmAccountIdentifier): Future[types.MagicVisibilityMnmMnmRulesSingleResponse] {.async.} =
  ## List a single network monitoring rule for account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/mnm/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicVisibilityMnmMnmRulesSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMnmRulesRuleId*(client: CloudflareClient,
                                            ruleId: types.MagicVisibilityMnmRuleIdentifier,
                                            accountId: types.MagicVisibilityMnmAccountIdentifier): Future[types.MagicVisibilityMnmMnmRulesSingleResponse] {.async.} =
  ## Delete a network monitoring rule for account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/mnm/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicVisibilityMnmMnmRulesSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMnmRulesRuleId*(client: CloudflareClient,
                                           ruleId: types.MagicVisibilityMnmRuleIdentifier,
                                           accountId: types.MagicVisibilityMnmAccountIdentifier,
                                           body: types.MagicVisibilityMnmMnmRuleCreate): Future[types.MagicVisibilityMnmMnmRulesSingleResponse] {.async.} =
  ## Update a network monitoring rule for account.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/mnm/rules/{ruleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicVisibilityMnmMnmRulesSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMnmRulesRuleIdAdvertisement*(client: CloudflareClient,
                                                        ruleId: types.MagicVisibilityMnmRuleIdentifier,
                                                        accountId: types.MagicVisibilityMnmAccountIdentifier): Future[types.MagicVisibilityMnmMnmRuleAdvertisementSingleResponse] {.async.} =
  ## Update advertisement for rule.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/mnm/rules/{ruleId}/advertisement")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicVisibilityMnmMnmRuleAdvertisementSingleResponse)
  else:
    raise newException(CloudflareClientError, body)
