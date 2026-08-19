# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdFilters*(client: CloudflareClient,
                            zoneId: types.FirewallIdentifier,
                            paused: JsonNode = default(JsonNode),
                            expression: string = default(string),
                            description: string = default(string),
                            `ref`: string = default(string),
                            page: float64 = default(float64),
                            perPage: float64 = default(float64),
                            id: string = default(string)): Future[types.FirewallFilterResponseCollection] {.async.} =
  ## Fetches filters in a zone. You can filter the results using several optional
  ## parameters.

  var q = initOrderedTable[string, string]()
  q["paused"] = $paused
  q["expression"] = $expression
  q["description"] = $description
  q["ref"] = $`ref`
  q["page"] = $page
  q["per_page"] = $perPage
  q["id"] = $id
  let res = await client.httpGET(fmt"/zones/{zoneId}/filters", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallFilterResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdFilters*(client: CloudflareClient,
                             zoneId: types.FirewallIdentifier): Future[JsonNode] {.async.} =
  ## Creates one or more filters.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/filters", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdFilters*(client: CloudflareClient,
                            zoneId: types.FirewallIdentifier): Future[types.FirewallFilterResponseCollection] {.async.} =
  ## Updates one or more existing filters.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/filters", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallFilterResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdFilters*(client: CloudflareClient,
                               zoneId: types.FirewallIdentifier,
                               id: seq[string] = @[]): Future[types.FirewallFilterDeleteResponseCollection] {.async.} =
  ## Deletes one or more existing filters.

  var q = initOrderedTable[string, string]()
  for v in id: q["id"] = $v
  let res = await client.httpDELETE(fmt"/zones/{zoneId}/filters", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallFilterDeleteResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdFiltersFilterId*(client: CloudflareClient,
                                    filterId: types.FirewallFiltersComponentsSchemasId,
                                    zoneId: types.FirewallIdentifier): Future[types.FirewallFilterResponseSingle] {.async.} =
  ## Fetches the details of a filter.

  let res = await client.httpGET(fmt"/zones/{zoneId}/filters/{filterId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallFilterResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdFiltersFilterId*(client: CloudflareClient,
                                    filterId: types.FirewallFiltersComponentsSchemasId,
                                    zoneId: types.FirewallIdentifier,
                                    body: types.FirewallFilter): Future[types.FirewallFilterResponseSingle] {.async.} =
  ## Updates an existing filter.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/filters/{filterId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallFilterResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdFiltersFilterId*(client: CloudflareClient,
                                       filterId: types.FirewallFiltersComponentsSchemasId,
                                       zoneId: types.FirewallIdentifier): Future[types.FirewallFilterDeleteResponseSingle] {.async.} =
  ## Deletes an existing filter.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/filters/{filterId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallFilterDeleteResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
