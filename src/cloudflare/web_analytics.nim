# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc postAccountsAccountIdRumSiteInfo*(client: CloudflareClient,
                                       accountId: types.RumIdentifier,
                                       body: types.RumCreateSiteRequest): Future[types.RumSiteResponseSingle] {.async.} =
  ## Creates a new Web Analytics site.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/rum/site_info", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RumSiteResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRumSiteInfoList*(client: CloudflareClient,
                                          accountId: types.RumIdentifier,
                                          perPage: types.RumPerPage = default(types.RumPerPage),
                                          page: types.RumPage = default(types.RumPage),
                                          orderBy: types.RumOrderBy = default(types.RumOrderBy)): Future[types.RumSitesResponseCollection] {.async.} =
  ## Lists all Web Analytics sites of an account.

  var q = initOrderedTable[string, string]()
  q["per_page"] = $perPage
  q["page"] = $page
  q["order_by"] = $orderBy
  let res = await client.httpGET(fmt"/accounts/{accountId}/rum/site_info/list", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RumSitesResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRumSiteInfoSiteTagList*(client: CloudflareClient,
                                                 accountId: types.RumIdentifier,
                                                 all: bool = default(bool)): Future[types.RumSiteTagListResponse] {.async.} =
  ## Returns all site tags for an account as an array of site tag strings. This
  ## endpoint returns all results without pagination.

  var q = initOrderedTable[string, string]()
  q["all"] = $all
  let res = await client.httpGET(fmt"/accounts/{accountId}/rum/site_info/site_tag/list", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RumSiteTagListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRumSiteInfoValidateHostname*(client: CloudflareClient,
                                                      accountId: types.RumIdentifier,
                                                      hostname: string): Future[types.RumEmptyResponse] {.async.} =
  ## Validates that the provided hostname is well-formed, does not contain wildcards,
  ## and has a valid TLD. Returns an empty result on success.

  let res = await client.httpGET(fmt"/accounts/{accountId}/rum/site_info/validate/{hostname}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RumEmptyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRumSiteInfoZoneTagList*(client: CloudflareClient,
                                                 accountId: types.RumIdentifier): Future[types.RumZoneTagListResponse] {.async.} =
  ## Returns all zone tags associated with Web Analytics sites for an account. These
  ## can be used to filter or exclude zones in the zone selection input. This
  ## endpoint returns all results without pagination.

  let res = await client.httpGET(fmt"/accounts/{accountId}/rum/site_info/zone_tag/list")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RumZoneTagListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRumSiteInfoSiteId*(client: CloudflareClient,
                                            accountId: types.RumIdentifier,
                                            siteId: types.RumIdentifier): Future[types.RumSiteResponseSingle] {.async.} =
  ## Retrieves a Web Analytics site.

  let res = await client.httpGET(fmt"/accounts/{accountId}/rum/site_info/{siteId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RumSiteResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdRumSiteInfoSiteId*(client: CloudflareClient,
                                            accountId: types.RumIdentifier,
                                            siteId: types.RumIdentifier,
                                            body: types.RumUpdateSiteRequest): Future[types.RumSiteResponseSingle] {.async.} =
  ## Updates an existing Web Analytics site.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/rum/site_info/{siteId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RumSiteResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdRumSiteInfoSiteId*(client: CloudflareClient,
                                               accountId: types.RumIdentifier,
                                               siteId: types.RumIdentifier): Future[types.RumSiteTagResponseSingle] {.async.} =
  ## Deletes an existing Web Analytics site.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/rum/site_info/{siteId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RumSiteTagResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdRumV2RulesetIdRule*(client: CloudflareClient,
                                              accountId: types.RumIdentifier,
                                              rulesetId: types.RumRulesetIdentifier,
                                              body: types.RumCreateRuleRequest): Future[types.RumRuleResponseSingle] {.async.} =
  ## Creates a new rule in a Web Analytics ruleset.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/rum/v2/{rulesetId}/rule", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RumRuleResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdRumV2RulesetIdRuleRuleId*(client: CloudflareClient,
                                                   accountId: types.RumIdentifier,
                                                   rulesetId: types.RumRulesetIdentifier,
                                                   ruleId: types.RumRuleIdentifier,
                                                   body: types.RumCreateRuleRequest): Future[types.RumRuleResponseSingle] {.async.} =
  ## Updates a rule in a Web Analytics ruleset.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/rum/v2/{rulesetId}/rule/{ruleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RumRuleResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdRumV2RulesetIdRuleRuleId*(client: CloudflareClient,
                                                      accountId: types.RumIdentifier,
                                                      rulesetId: types.RumRulesetIdentifier,
                                                      ruleId: types.RumRuleIdentifier): Future[types.RumRuleIdResponseSingle] {.async.} =
  ## Deletes an existing rule from a Web Analytics ruleset.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/rum/v2/{rulesetId}/rule/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RumRuleIdResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRumV2RulesetIdRules*(client: CloudflareClient,
                                              accountId: types.RumIdentifier,
                                              rulesetId: types.RumRulesetIdentifier): Future[types.RumRulesResponseCollection] {.async.} =
  ## Lists all the rules in a Web Analytics ruleset.

  let res = await client.httpGET(fmt"/accounts/{accountId}/rum/v2/{rulesetId}/rules")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RumRulesResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdRumV2RulesetIdRules*(client: CloudflareClient,
                                               accountId: types.RumIdentifier,
                                               rulesetId: types.RumRulesetIdentifier,
                                               body: types.RumModifyRulesRequest): Future[types.RumRulesResponseCollection] {.async.} =
  ## Modifies one or more rules in a Web Analytics ruleset with a single request.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/rum/v2/{rulesetId}/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RumRulesResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSettingsRum*(client: CloudflareClient,
                                zoneId: types.RumIdentifier): Future[types.RumRumSiteResponseSingle] {.async.} =
  ## Retrieves RUM status for a zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/rum")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RumRumSiteResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSettingsRum*(client: CloudflareClient,
                                  zoneId: types.RumIdentifier,
                                  body: types.RumToggleRumRequest): Future[types.RumRumSiteResponseSingle] {.async.} =
  ## Toggles RUM on/off for an existing zone.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/settings/rum", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RumRumSiteResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
