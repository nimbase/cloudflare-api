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
  PostZonesZoneIdFirewallUaRulesRequest = object
    configuration: types.FirewallUaConfiguration
    description: Option[types.FirewallDescription]
    mode: types.FirewallSchemasMode
    paused: Option[types.FirewallSchemasPaused]
  PutZonesZoneIdFirewallUaRulesUaRuleIdRequest = object
    configuration: types.FirewallConfiguration
    description: Option[types.FirewallDescription]
    id: types.FirewallComponentsSchemasIdentifier
    mode: types.FirewallSchemasMode
    paused: Option[types.FirewallSchemasPaused]

proc getZonesZoneIdFirewallUaRules*(client: CloudflareClient,
                                    zoneId: types.FirewallIdentifier,
                                    page: float64 = default(float64),
                                    description: JsonNode = default(JsonNode),
                                    perPage: float64 = default(float64),
                                    userAgent: string = default(string),
                                    paused: bool = default(bool)): Future[types.FirewallFirewalluablockResponseCollection] {.async.} =
  ## Fetches User Agent Blocking rules in a zone. You can filter the results using
  ## several optional parameters.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["description"] = $description
  q["per_page"] = $perPage
  q["user_agent"] = $userAgent
  q["paused"] = $paused
  let res = await client.httpGET(fmt"/zones/{zoneId}/firewall/ua_rules", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallFirewalluablockResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdFirewallUaRules*(client: CloudflareClient,
                                     zoneId: types.FirewallIdentifier,
                                     body: PostZonesZoneIdFirewallUaRulesRequest): Future[types.FirewallFirewalluablockResponseSingle] {.async.} =
  ## Creates a new User Agent Blocking rule in a zone.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/firewall/ua_rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallFirewalluablockResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdFirewallUaRulesUaRuleId*(client: CloudflareClient,
                                            uaRuleId: types.FirewallComponentsUaRuleId,
                                            zoneId: types.FirewallIdentifier): Future[types.FirewallFirewalluablockResponseSingle] {.async.} =
  ## Fetches the details of a User Agent Blocking rule.

  let res = await client.httpGET(fmt"/zones/{zoneId}/firewall/ua_rules/{uaRuleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallFirewalluablockResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdFirewallUaRulesUaRuleId*(client: CloudflareClient,
                                            uaRuleId: types.FirewallComponentsUaRuleId,
                                            zoneId: types.FirewallIdentifier,
                                            body: PutZonesZoneIdFirewallUaRulesUaRuleIdRequest): Future[types.FirewallFirewalluablockResponseSingle] {.async.} =
  ## Updates an existing User Agent Blocking rule.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/firewall/ua_rules/{uaRuleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallFirewalluablockResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdFirewallUaRulesUaRuleId*(client: CloudflareClient,
                                               uaRuleId: types.FirewallComponentsUaRuleId,
                                               zoneId: types.FirewallIdentifier): Future[JsonNode] {.async.} =
  ## Deletes an existing User Agent Blocking rule.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/firewall/ua_rules/{uaRuleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
