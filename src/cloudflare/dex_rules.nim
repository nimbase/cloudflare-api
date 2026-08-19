# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types

type
  DexRuleSortOrderOption* = enum
    sortOrderASC = "ASC"
    sortOrderDESC = "DESC"

  DexRuleSortByOption* = enum
    sortByName = "name"
    sortByCreatedAt = "created_at"
    sortByUpdatedAt = "updated_at"


proc getAccountsAccountIdDexRules*(client: CloudflareClient,
                                   accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                   page: float64, perPage: float64,
                                   sortOrder: string = "ASC",
                                   sortBy: string = "name",
                                   name: string = default(string)): Future[JsonNode] {.async.} =
  ## List DEX Rules.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  for v in sortOrder: q["sort_order"] = $v
  for v in sortBy: q["sort_by"] = $v
  q["name"] = $name
  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/rules", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDexRules*(client: CloudflareClient,
                                    accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                    body: types.DigitalExperienceMonitoringCreateRuleBody): Future[JsonNode] {.async.} =
  ## Create a DEX Rule.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dex/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDexRulesRuleId*(client: CloudflareClient,
                                         accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                         ruleId: types.DigitalExperienceMonitoringUuid): Future[JsonNode] {.async.} =
  ## Get details for a DEX Rule.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDexRulesRuleId*(client: CloudflareClient,
                                            accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                            ruleId: types.DigitalExperienceMonitoringUuid): Future[JsonNode] {.async.} =
  ## Delete a DEX Rule.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/dex/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdDexRulesRuleId*(client: CloudflareClient,
                                           accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                           ruleId: types.DigitalExperienceMonitoringUuid,
                                           body: types.DigitalExperienceMonitoringPatchRuleBody): Future[JsonNode] {.async.} =
  ## Update a DEX Rule.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/dex/rules/{ruleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
