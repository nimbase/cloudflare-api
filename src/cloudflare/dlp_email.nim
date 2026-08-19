# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdDlpEmailAccountMapping*(client: CloudflareClient,
                                                 accountId: string): Future[JsonNode] {.async.} =
  ## Retrieves the email provider mapping configuration for DLP email scanning.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/email/account_mapping")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDlpEmailAccountMapping*(client: CloudflareClient,
                                                  accountId: string,
                                                  body: types.DlpUpdateAddinAccountMapping): Future[JsonNode] {.async.} =
  ## Creates a mapping between a Cloudflare account and an email provider for DLP
  ## email scanning integration.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dlp/email/account_mapping", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpEmailRules*(client: CloudflareClient,
                                        accountId: string): Future[JsonNode] {.async.} =
  ## Lists all email scanner rules for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/email/rules")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDlpEmailRules*(client: CloudflareClient,
                                         accountId: string,
                                         body: types.DlpCreateEmailRule): Future[JsonNode] {.async.} =
  ## Creates a new DLP email scanning rule that defines what content patterns to
  ## detect in email messages and what actions to take.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dlp/email/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdDlpEmailRules*(client: CloudflareClient,
                                          accountId: string,
                                          body: types.DlpUpdateEmailRulePriorities): Future[JsonNode] {.async.} =
  ## Reorders DLP email scanning rules by updating their priority values. Higher
  ## priority rules are evaluated first.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/dlp/email/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpEmailRulesRuleId*(client: CloudflareClient,
                                              accountId: string, ruleId: string): Future[JsonNode] {.async.} =
  ## Gets detailed configuration for a specific DLP email scanning rule, including
  ## detection patterns and actions.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/email/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDlpEmailRulesRuleId*(client: CloudflareClient,
                                              accountId: string, ruleId: string,
                                              body: types.DlpCreateEmailRule): Future[JsonNode] {.async.} =
  ## Updates a DLP email scanning rule.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/dlp/email/rules/{ruleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDlpEmailRulesRuleId*(client: CloudflareClient,
                                                 accountId: string,
                                                 ruleId: string): Future[JsonNode] {.async.} =
  ## Removes a DLP email scanning rule. The rule will no longer be applied to email
  ## messages.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/dlp/email/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
