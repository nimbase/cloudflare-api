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
  PostZonesZoneIdFirewallRulesRequest = object
    action: types.FirewallAction
    filter: types.FirewallFilter
  DeleteZonesZoneIdFirewallRulesRequest = object
    id: types.FirewallFirewallRulesComponentsSchemasId
  PutZonesZoneIdFirewallRulesRuleIdRequest = object
    action: types.FirewallAction
    filter: types.FirewallFilter
    id: types.FirewallComponentsSchemasIdentifier
  DeleteZonesZoneIdFirewallRulesRuleIdRequest = object
    delete_filter_if_unused: Option[types.FirewallDeleteFilterIfUnused]
  PatchZonesZoneIdFirewallRulesRuleIdRequest = object
    id: types.FirewallComponentsSchemasIdentifier

proc getZonesZoneIdFirewallRules*(client: CloudflareClient,
                                  zoneId: types.FirewallIdentifier,
                                  description: string = default(string),
                                  action: string = default(string),
                                  page: float64 = default(float64),
                                  perPage: float64 = default(float64),
                                  id: string = default(string),
                                  paused: bool = default(bool)): Future[types.FirewallFilterRulesResponseCollection] {.async.} =
  ## Fetches firewall rules in a zone. You can filter the results using several
  ## optional parameters.

  var q = initOrderedTable[string, string]()
  q["description"] = $description
  q["action"] = $action
  q["page"] = $page
  q["per_page"] = $perPage
  q["id"] = $id
  q["paused"] = $paused
  let res = await client.httpGET(fmt"/zones/{zoneId}/firewall/rules", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallFilterRulesResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdFirewallRules*(client: CloudflareClient,
                                   zoneId: types.FirewallIdentifier,
                                   body: PostZonesZoneIdFirewallRulesRequest): Future[types.FirewallFilterRulesResponseCollection] {.async.} =
  ## Create one or more firewall rules.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/firewall/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallFilterRulesResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdFirewallRules*(client: CloudflareClient,
                                  zoneId: types.FirewallIdentifier): Future[types.FirewallFilterRulesResponseCollection] {.async.} =
  ## Updates one or more existing firewall rules.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/firewall/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallFilterRulesResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdFirewallRules*(client: CloudflareClient,
                                     zoneId: types.FirewallIdentifier,
                                     body: DeleteZonesZoneIdFirewallRulesRequest): Future[types.FirewallFilterRulesResponseCollectionDelete] {.async.} =
  ## Deletes existing firewall rules.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/firewall/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallFilterRulesResponseCollectionDelete)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdFirewallRules*(client: CloudflareClient,
                                    zoneId: types.FirewallIdentifier): Future[types.FirewallFilterRulesResponseCollection] {.async.} =
  ## Updates the priority of existing firewall rules.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/firewall/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallFilterRulesResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdFirewallRulesRuleId*(client: CloudflareClient,
                                        ruleId: types.FirewallFirewallRulesComponentsSchemasId,
                                        zoneId: types.FirewallIdentifier,
                                        id: JsonNode = default(JsonNode)): Future[types.FirewallFilterRulesSingleResponse] {.async.} =
  ## Fetches the details of a firewall rule.

  var q = initOrderedTable[string, string]()
  q["id"] = $id
  let res = await client.httpGET(fmt"/zones/{zoneId}/firewall/rules/{ruleId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallFilterRulesSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdFirewallRulesRuleId*(client: CloudflareClient,
                                        ruleId: types.FirewallFirewallRulesComponentsSchemasId,
                                        zoneId: types.FirewallIdentifier,
                                        body: PutZonesZoneIdFirewallRulesRuleIdRequest): Future[types.FirewallFilterRulesSingleResponse] {.async.} =
  ## Updates an existing firewall rule.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/firewall/rules/{ruleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallFilterRulesSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdFirewallRulesRuleId*(client: CloudflareClient,
                                           ruleId: types.FirewallFirewallRulesComponentsSchemasId,
                                           zoneId: types.FirewallIdentifier,
                                           body: DeleteZonesZoneIdFirewallRulesRuleIdRequest): Future[types.FirewallFilterRulesSingleResponseDelete] {.async.} =
  ## Deletes an existing firewall rule.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/firewall/rules/{ruleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallFilterRulesSingleResponseDelete)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdFirewallRulesRuleId*(client: CloudflareClient,
                                          ruleId: types.FirewallFirewallRulesComponentsSchemasId,
                                          zoneId: types.FirewallIdentifier,
                                          body: PatchZonesZoneIdFirewallRulesRuleIdRequest): Future[types.FirewallFilterRulesResponseCollection] {.async.} =
  ## Updates the priority of an existing firewall rule.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/firewall/rules/{ruleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallFilterRulesResponseCollection)
  else:
    raise newException(CloudflareClientError, body)
