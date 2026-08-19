# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdRulesets*(client: CloudflareClient,
                                   accountId: types.RulesetsAccountId,
                                   cursor: types.RulesetsCursor = default(types.RulesetsCursor),
                                   perPage: types.RulesetsPerPage = default(types.RulesetsPerPage)): Future[JsonNode] {.async.} =
  ## Fetches all rulesets at the account level.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/rulesets", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdRulesets*(client: CloudflareClient,
                                    accountId: types.RulesetsAccountId,
                                    dryRun: bool = false): Future[JsonNode] {.async.} =
  ## Creates a ruleset at the account level.

  var q = initOrderedTable[string, string]()
  q["dry_run"] = $dryRun
  let res = await client.httpPOST(fmt"/accounts/{accountId}/rulesets", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRulesetsPhasesRulesetPhaseEntrypoint*(client: CloudflareClient,
                                                               rulesetPhase: types.RulesetsRulesetPhase,
                                                               accountId: types.RulesetsAccountId): Future[JsonNode] {.async.} =
  ## Fetches the latest version of the account entry point ruleset for a given phase.

  let res = await client.httpGET(fmt"/accounts/{accountId}/rulesets/phases/{rulesetPhase}/entrypoint")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdRulesetsPhasesRulesetPhaseEntrypoint*(client: CloudflareClient,
                                                               rulesetPhase: types.RulesetsRulesetPhase,
                                                               accountId: types.RulesetsAccountId,
                                                               dryRun: bool = false): Future[JsonNode] {.async.} =
  ## Updates an account entry point ruleset, creating a new version.

  var q = initOrderedTable[string, string]()
  q["dry_run"] = $dryRun
  let res = await client.httpPUT(fmt"/accounts/{accountId}/rulesets/phases/{rulesetPhase}/entrypoint", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRulesetsPhasesRulesetPhaseEntrypointVersions*(client: CloudflareClient,
                                                                       rulesetPhase: types.RulesetsRulesetPhase,
                                                                       accountId: types.RulesetsAccountId): Future[JsonNode] {.async.} =
  ## Fetches the versions of an account entry point ruleset.

  let res = await client.httpGET(fmt"/accounts/{accountId}/rulesets/phases/{rulesetPhase}/entrypoint/versions")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRulesetsPhasesRulesetPhaseEntrypointVersionsRulesetVersion*(client: CloudflareClient,
                                                                                     rulesetVersion: types.RulesetsRulesetVersion,
                                                                                     rulesetPhase: types.RulesetsRulesetPhase,
                                                                                     accountId: types.RulesetsAccountId): Future[JsonNode] {.async.} =
  ## Fetches a specific version of an account entry point ruleset.

  let res = await client.httpGET(fmt"/accounts/{accountId}/rulesets/phases/{rulesetPhase}/entrypoint/versions/{rulesetVersion}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRulesetsRulesetId*(client: CloudflareClient,
                                            rulesetId: types.RulesetsRulesetId,
                                            accountId: types.RulesetsAccountId): Future[JsonNode] {.async.} =
  ## Fetches the latest version of an account ruleset.

  let res = await client.httpGET(fmt"/accounts/{accountId}/rulesets/{rulesetId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdRulesetsRulesetId*(client: CloudflareClient,
                                            rulesetId: types.RulesetsRulesetId,
                                            accountId: types.RulesetsAccountId,
                                            dryRun: bool = false): Future[JsonNode] {.async.} =
  ## Updates an account ruleset, creating a new version.

  var q = initOrderedTable[string, string]()
  q["dry_run"] = $dryRun
  let res = await client.httpPUT(fmt"/accounts/{accountId}/rulesets/{rulesetId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdRulesetsRulesetId*(client: CloudflareClient,
                                               rulesetId: types.RulesetsRulesetId,
                                               accountId: types.RulesetsAccountId,
                                               dryRun: bool = false): Future[AsyncResponse] {.async.} =
  ## Deletes all versions of an existing account ruleset.

  var q = initOrderedTable[string, string]()
  q["dry_run"] = $dryRun
  let res = await client.httpDELETE(fmt"/accounts/{accountId}/rulesets/{rulesetId}", q)
  return res

proc postAccountsAccountIdRulesetsRulesetIdRules*(client: CloudflareClient,
                                                  rulesetId: types.RulesetsRulesetId,
                                                  accountId: types.RulesetsAccountId,
                                                  dryRun: bool = false): Future[JsonNode] {.async.} =
  ## Adds a new rule to an account ruleset. The rule will be added to the end of the
  ## existing list of rules in the ruleset by default.

  var q = initOrderedTable[string, string]()
  q["dry_run"] = $dryRun
  let res = await client.httpPOST(fmt"/accounts/{accountId}/rulesets/{rulesetId}/rules", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdRulesetsRulesetIdRulesRuleId*(client: CloudflareClient,
                                                          ruleId: types.RulesetsRuleId,
                                                          rulesetId: types.RulesetsRulesetId,
                                                          accountId: types.RulesetsAccountId,
                                                          dryRun: bool = false): Future[JsonNode] {.async.} =
  ## Deletes an existing rule from an account ruleset.

  var q = initOrderedTable[string, string]()
  q["dry_run"] = $dryRun
  let res = await client.httpDELETE(fmt"/accounts/{accountId}/rulesets/{rulesetId}/rules/{ruleId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdRulesetsRulesetIdRulesRuleId*(client: CloudflareClient,
                                                         ruleId: types.RulesetsRuleId,
                                                         rulesetId: types.RulesetsRulesetId,
                                                         accountId: types.RulesetsAccountId,
                                                         dryRun: bool = false): Future[JsonNode] {.async.} =
  ## Updates an existing rule in an account ruleset.

  var q = initOrderedTable[string, string]()
  q["dry_run"] = $dryRun
  let res = await client.httpPATCH(fmt"/accounts/{accountId}/rulesets/{rulesetId}/rules/{ruleId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRulesetsRulesetIdVersions*(client: CloudflareClient,
                                                    rulesetId: types.RulesetsRulesetId,
                                                    accountId: types.RulesetsAccountId): Future[JsonNode] {.async.} =
  ## Fetches the versions of an account ruleset.

  let res = await client.httpGET(fmt"/accounts/{accountId}/rulesets/{rulesetId}/versions")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRulesetsRulesetIdVersionsRulesetVersion*(client: CloudflareClient,
                                                                  rulesetVersion: types.RulesetsRulesetVersion,
                                                                  rulesetId: types.RulesetsRulesetId,
                                                                  accountId: types.RulesetsAccountId): Future[JsonNode] {.async.} =
  ## Fetches a specific version of an account ruleset.

  let res = await client.httpGET(fmt"/accounts/{accountId}/rulesets/{rulesetId}/versions/{rulesetVersion}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdRulesetsRulesetIdVersionsRulesetVersion*(client: CloudflareClient,
                                                                     rulesetVersion: types.RulesetsRulesetVersion,
                                                                     rulesetId: types.RulesetsRulesetId,
                                                                     accountId: types.RulesetsAccountId,
                                                                     dryRun: bool = false): Future[AsyncResponse] {.async.} =
  ## Deletes an existing version of an account ruleset.

  var q = initOrderedTable[string, string]()
  q["dry_run"] = $dryRun
  let res = await client.httpDELETE(fmt"/accounts/{accountId}/rulesets/{rulesetId}/versions/{rulesetVersion}", q)
  return res

proc getAccountsAccountIdRulesetsRulesetIdVersionsRulesetVersionByTagRuleTag*(client: CloudflareClient,
                                                                              ruleTag: types.RulesetsRuleCategory,
                                                                              rulesetVersion: types.RulesetsRulesetVersion,
                                                                              rulesetId: types.RulesetsRulesetId,
                                                                              accountId: types.RulesetsAccountId): Future[JsonNode] {.async.} =
  ## Fetches the rules of a managed account ruleset version for a given tag.

  let res = await client.httpGET(fmt"/accounts/{accountId}/rulesets/{rulesetId}/versions/{rulesetVersion}/by_tag/{ruleTag}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
