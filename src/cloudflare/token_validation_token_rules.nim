# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdTokenValidationRules*(client: CloudflareClient,
                                         perPage: int64 = 20, page: int64 = 1,
                                         tokenConfiguration: seq[string] = @[],
                                         action: types.ApiShieldAction = default(types.ApiShieldAction),
                                         enabled: types.ApiShieldEnabled = default(types.ApiShieldEnabled),
                                         id: types.ApiShieldUuid2 = default(types.ApiShieldUuid2),
                                         ruleId: types.ApiShieldUuid2 = default(types.ApiShieldUuid2),
                                         host: types.ApiShieldHost = default(types.ApiShieldHost),
                                         hostname: types.ApiShieldHost = default(types.ApiShieldHost)): Future[JsonNode] {.async.} =
  ## List token validation rules

  var q = initOrderedTable[string, string]()
  q["per_page"] = $perPage
  q["page"] = $page
  for v in tokenConfiguration: q["token_configuration"] = $v
  q["action"] = $action
  q["enabled"] = $enabled
  q["id"] = $id
  q["rule_id"] = $ruleId
  q["host"] = $host
  q["hostname"] = $hostname
  let res = await client.httpGET("/zones/{zone_id}/token_validation/rules", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdTokenValidationRules*(client: CloudflareClient,
                                          body: types.ApiShieldCreateSingleRuleRequest): Future[JsonNode] {.async.} =
  ## Create a token validation rule.

  let res = await client.httpPOST("/zones/{zone_id}/token_validation/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdTokenValidationRulesBulk*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Create zone token validation rules.
  ##
  ## A request can create multiple Token Validation Rules.

  let res = await client.httpPOST("/zones/{zone_id}/token_validation/rules/bulk", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdTokenValidationRulesBulk*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Edit token validation rules.
  ##
  ## A request can update multiple Token Validation Rules.
  ##
  ## Rules can be re-ordered using the `position` field.
  ##
  ## Returns all updated rules.

  let res = await client.httpPATCH("/zones/{zone_id}/token_validation/rules/bulk", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdTokenValidationRulesPreview*(client: CloudflareClient,
                                                 perPage: int64 = 20,
                                                 page: int64 = 1,
                                                 state: seq[string] = @[],
                                                 host: seq[string] = @[],
                                                 hostname: seq[string] = @[],
                                                 `method`: seq[string] = @[],
                                                 endpoint: seq[string] = @[],
                                                 body: types.ApiShieldSelector): Future[JsonNode] {.async.} =
  ## Preview operations covered by a Token Validation rule.
  ##
  ## The API will return all operations on a zone annotated with an additional
  ## `state` field.
  ## Operations with an `included` `state` will be covered by a Token Validation
  ## Rule.

  var q = initOrderedTable[string, string]()
  q["per_page"] = $perPage
  q["page"] = $page
  for v in state: q["state"] = $v
  for v in host: q["host"] = $v
  for v in hostname: q["hostname"] = $v
  for v in `method`: q["method"] = $v
  for v in endpoint: q["endpoint"] = $v
  let res = await client.httpPOST("/zones/{zone_id}/token_validation/rules/preview", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdTokenValidationRulesRuleId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Get a zone token validation rule.

  let res = await client.httpGET("/zones/{zone_id}/token_validation/rules/{rule_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdTokenValidationRulesRuleId*(client: CloudflareClient): Future[types.ApiShieldApiResponseSingleObj] {.async.} =
  ## Delete a zone token validation rule.

  let res = await client.httpDELETE("/zones/{zone_id}/token_validation/rules/{rule_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ApiShieldApiResponseSingleObj)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdTokenValidationRulesRuleId*(client: CloudflareClient,
                                                 body: types.ApiShieldEditSingleRuleRequest): Future[JsonNode] {.async.} =
  ## Edit a zone token validation rule.

  let res = await client.httpPATCH("/zones/{zone_id}/token_validation/rules/{rule_id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
