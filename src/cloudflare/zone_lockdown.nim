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
  PostZonesZoneIdFirewallLockdownsRequest = object
    configurations: types.FirewallConfigurations
    description: Option[types.FirewallDescription]
    paused: Option[types.FirewallSchemasPaused]
    priority: Option[types.FirewallSchemasPriority]
    urls: types.FirewallUrls
  PutZonesZoneIdFirewallLockdownsLockDownsIdRequest = object
    configurations: types.FirewallConfigurations
    urls: types.FirewallUrls
  DeleteZonesZoneIdFirewallLockdownsLockDownsIdResponse* = object
    result: JsonNode

proc getZonesZoneIdFirewallLockdowns*(client: CloudflareClient,
                                      zoneId: types.FirewallIdentifier,
                                      page: float64 = default(float64),
                                      description: JsonNode = default(JsonNode),
                                      modifiedOn: JsonNode = default(JsonNode),
                                      ip: JsonNode = default(JsonNode),
                                      priority: JsonNode = default(JsonNode),
                                      uriSearch: JsonNode = default(JsonNode),
                                      ipRangeSearch: JsonNode = default(JsonNode),
                                      perPage: float64 = default(float64),
                                      createdOn: string = default(string),
                                      descriptionSearch: string = default(string),
                                      ipSearch: string = default(string)): Future[types.FirewallZonelockdownResponseCollection] {.async.} =
  ## Fetches Zone Lockdown rules. You can filter the results using several optional
  ## parameters.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["description"] = $description
  q["modified_on"] = $modifiedOn
  q["ip"] = $ip
  q["priority"] = $priority
  q["uri_search"] = $uriSearch
  q["ip_range_search"] = $ipRangeSearch
  q["per_page"] = $perPage
  q["created_on"] = $createdOn
  q["description_search"] = $descriptionSearch
  q["ip_search"] = $ipSearch
  let res = await client.httpGET(fmt"/zones/{zoneId}/firewall/lockdowns", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallZonelockdownResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdFirewallLockdowns*(client: CloudflareClient,
                                       zoneId: types.FirewallIdentifier,
                                       body: PostZonesZoneIdFirewallLockdownsRequest): Future[types.FirewallZonelockdownResponseSingle] {.async.} =
  ## Creates a new Zone Lockdown rule.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/firewall/lockdowns", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallZonelockdownResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdFirewallLockdownsLockDownsId*(client: CloudflareClient,
                                                 lockDownsId: types.FirewallLockdownsComponentsSchemasId,
                                                 zoneId: types.FirewallIdentifier): Future[types.FirewallZonelockdownResponseSingle] {.async.} =
  ## Fetches the details of a Zone Lockdown rule.

  let res = await client.httpGET(fmt"/zones/{zoneId}/firewall/lockdowns/{lockDownsId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallZonelockdownResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdFirewallLockdownsLockDownsId*(client: CloudflareClient,
                                                 lockDownsId: types.FirewallLockdownsComponentsSchemasId,
                                                 zoneId: types.FirewallIdentifier,
                                                 body: PutZonesZoneIdFirewallLockdownsLockDownsIdRequest): Future[types.FirewallZonelockdownResponseSingle] {.async.} =
  ## Updates an existing Zone Lockdown rule.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/firewall/lockdowns/{lockDownsId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallZonelockdownResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdFirewallLockdownsLockDownsId*(client: CloudflareClient,
                                                    lockDownsId: types.FirewallLockdownsComponentsSchemasId,
                                                    zoneId: types.FirewallIdentifier): Future[DeleteZonesZoneIdFirewallLockdownsLockDownsIdResponse] {.async.} =
  ## Deletes an existing Zone Lockdown rule.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/firewall/lockdowns/{lockDownsId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteZonesZoneIdFirewallLockdownsLockDownsIdResponse)
  else:
    raise newException(CloudflareClientError, body)
