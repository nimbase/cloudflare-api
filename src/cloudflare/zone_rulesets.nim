# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdRulesets*(client: CloudflareClient,
                             zoneId: types.RulesetsZoneId,
                             cursor: types.RulesetsCursor = default(types.RulesetsCursor),
                             perPage: types.RulesetsPerPage = default(types.RulesetsPerPage)): Future[JsonNode] {.async.} =
  ## Fetches all rulesets at the zone level.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/zones/{zoneId}/rulesets", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdRulesets*(client: CloudflareClient,
                              zoneId: types.RulesetsZoneId, dryRun: bool = false): Future[JsonNode] {.async.} =
  ## Creates a ruleset at the zone level.

  var q = initOrderedTable[string, string]()
  q["dry_run"] = $dryRun
  let res = await client.httpPOST(fmt"/zones/{zoneId}/rulesets", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdRulesetsPhasesRulesetPhaseEntrypoint*(client: CloudflareClient,
                                                         rulesetPhase: types.RulesetsRulesetPhase,
                                                         zoneId: types.RulesetsZoneId): Future[JsonNode] {.async.} =
  ## Fetches the latest version of the zone entry point ruleset for a given phase.

  let res = await client.httpGET(fmt"/zones/{zoneId}/rulesets/phases/{rulesetPhase}/entrypoint")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdRulesetsPhasesRulesetPhaseEntrypoint*(client: CloudflareClient,
                                                         rulesetPhase: types.RulesetsRulesetPhase,
                                                         zoneId: types.RulesetsZoneId,
                                                         dryRun: bool = false): Future[JsonNode] {.async.} =
  ## Updates a zone entry point ruleset, creating a new version.

  var q = initOrderedTable[string, string]()
  q["dry_run"] = $dryRun
  let res = await client.httpPUT(fmt"/zones/{zoneId}/rulesets/phases/{rulesetPhase}/entrypoint", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdRulesetsPhasesRulesetPhaseEntrypointVersions*(client: CloudflareClient,
                                                                 rulesetPhase: types.RulesetsRulesetPhase,
                                                                 zoneId: types.RulesetsZoneId): Future[JsonNode] {.async.} =
  ## Fetches the versions of a zone entry point ruleset.

  let res = await client.httpGET(fmt"/zones/{zoneId}/rulesets/phases/{rulesetPhase}/entrypoint/versions")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdRulesetsPhasesRulesetPhaseEntrypointVersionsRulesetVersion*(client: CloudflareClient,
                                                                               rulesetVersion: types.RulesetsRulesetVersion,
                                                                               rulesetPhase: types.RulesetsRulesetPhase,
                                                                               zoneId: types.RulesetsZoneId): Future[JsonNode] {.async.} =
  ## Fetches a specific version of a zone entry point ruleset.

  let res = await client.httpGET(fmt"/zones/{zoneId}/rulesets/phases/{rulesetPhase}/entrypoint/versions/{rulesetVersion}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdRulesetsRulesetId*(client: CloudflareClient,
                                      rulesetId: types.RulesetsRulesetId,
                                      zoneId: types.RulesetsZoneId): Future[JsonNode] {.async.} =
  ## Fetches the latest version of a zone ruleset.

  let res = await client.httpGET(fmt"/zones/{zoneId}/rulesets/{rulesetId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdRulesetsRulesetId*(client: CloudflareClient,
                                      rulesetId: types.RulesetsRulesetId,
                                      zoneId: types.RulesetsZoneId,
                                      dryRun: bool = false): Future[JsonNode] {.async.} =
  ## Updates a zone ruleset, creating a new version.

  var q = initOrderedTable[string, string]()
  q["dry_run"] = $dryRun
  let res = await client.httpPUT(fmt"/zones/{zoneId}/rulesets/{rulesetId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdRulesetsRulesetId*(client: CloudflareClient,
                                         rulesetId: types.RulesetsRulesetId,
                                         zoneId: types.RulesetsZoneId,
                                         dryRun: bool = false): Future[AsyncResponse] {.async.} =
  ## Deletes all versions of an existing zone ruleset.

  var q = initOrderedTable[string, string]()
  q["dry_run"] = $dryRun
  let res = await client.httpDELETE(fmt"/zones/{zoneId}/rulesets/{rulesetId}", q)
  return res

proc postZonesZoneIdRulesetsRulesetIdRules*(client: CloudflareClient,
                                            rulesetId: types.RulesetsRulesetId,
                                            zoneId: types.RulesetsZoneId,
                                            dryRun: bool = false): Future[JsonNode] {.async.} =
  ## Adds a new rule to a zone ruleset. The rule will be added to the end of the
  ## existing list of rules in the ruleset by default.

  var q = initOrderedTable[string, string]()
  q["dry_run"] = $dryRun
  let res = await client.httpPOST(fmt"/zones/{zoneId}/rulesets/{rulesetId}/rules", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdRulesetsRulesetIdRulesRuleId*(client: CloudflareClient,
                                                    ruleId: types.RulesetsRuleId,
                                                    rulesetId: types.RulesetsRulesetId,
                                                    zoneId: types.RulesetsZoneId,
                                                    dryRun: bool = false): Future[JsonNode] {.async.} =
  ## Deletes an existing rule from a zone ruleset.

  var q = initOrderedTable[string, string]()
  q["dry_run"] = $dryRun
  let res = await client.httpDELETE(fmt"/zones/{zoneId}/rulesets/{rulesetId}/rules/{ruleId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdRulesetsRulesetIdRulesRuleId*(client: CloudflareClient,
                                                   ruleId: types.RulesetsRuleId,
                                                   rulesetId: types.RulesetsRulesetId,
                                                   zoneId: types.RulesetsZoneId,
                                                   dryRun: bool = false): Future[JsonNode] {.async.} =
  ## Updates an existing rule in a zone ruleset.

  var q = initOrderedTable[string, string]()
  q["dry_run"] = $dryRun
  let res = await client.httpPATCH(fmt"/zones/{zoneId}/rulesets/{rulesetId}/rules/{ruleId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdRulesetsRulesetIdVersions*(client: CloudflareClient,
                                              rulesetId: types.RulesetsRulesetId,
                                              zoneId: types.RulesetsZoneId): Future[JsonNode] {.async.} =
  ## Fetches the versions of a zone ruleset.

  let res = await client.httpGET(fmt"/zones/{zoneId}/rulesets/{rulesetId}/versions")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdRulesetsRulesetIdVersionsRulesetVersion*(client: CloudflareClient,
                                                            rulesetVersion: types.RulesetsRulesetVersion,
                                                            rulesetId: types.RulesetsRulesetId,
                                                            zoneId: types.RulesetsZoneId): Future[JsonNode] {.async.} =
  ## Fetches a specific version of a zone ruleset.

  let res = await client.httpGET(fmt"/zones/{zoneId}/rulesets/{rulesetId}/versions/{rulesetVersion}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdRulesetsRulesetIdVersionsRulesetVersion*(client: CloudflareClient,
                                                               rulesetVersion: types.RulesetsRulesetVersion,
                                                               rulesetId: types.RulesetsRulesetId,
                                                               zoneId: types.RulesetsZoneId,
                                                               dryRun: bool = false): Future[AsyncResponse] {.async.} =
  ## Deletes an existing version of a zone ruleset.

  var q = initOrderedTable[string, string]()
  q["dry_run"] = $dryRun
  let res = await client.httpDELETE(fmt"/zones/{zoneId}/rulesets/{rulesetId}/versions/{rulesetVersion}", q)
  return res

proc getZonesZoneIdRulesetsRulesetIdVersionsRulesetVersionByTagRuleTag*(client: CloudflareClient,
                                                                        ruleTag: types.RulesetsRuleCategory,
                                                                        rulesetVersion: types.RulesetsRulesetVersion,
                                                                        rulesetId: types.RulesetsRulesetId,
                                                                        zoneId: types.RulesetsZoneId): Future[JsonNode] {.async.} =
  ## Fetches the rules of a managed zone ruleset version for a given tag.

  let res = await client.httpGET(fmt"/zones/{zoneId}/rulesets/{rulesetId}/versions/{rulesetVersion}/by_tag/{ruleTag}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
