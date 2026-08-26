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
  PutZonesZoneIdSnippetsSnippetRulesRequest = object
    rules: types.SnippetsSnippetRules

proc getZonesZoneIdSnippets*(client: CloudflareClient,
                             zoneId: types.SnippetsZoneId,
                             page: types.SnippetsPage = default(types.SnippetsPage),
                             perPage: types.SnippetsPerPage = default(types.SnippetsPerPage)): Future[JsonNode] {.async.} =
  ## Fetches all snippets belonging to the zone.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/zones/{zoneId}/snippets", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSnippetsSnippetRules*(client: CloudflareClient,
                                         zoneId: types.SnippetsZoneId): Future[JsonNode] {.async.} =
  ## Fetches all snippet rules belonging to the zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/snippets/snippet_rules")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdSnippetsSnippetRules*(client: CloudflareClient,
                                         zoneId: types.SnippetsZoneId,
                                         body: PutZonesZoneIdSnippetsSnippetRulesRequest): Future[JsonNode] {.async.} =
  ## Updates all snippet rules belonging to the zone.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/snippets/snippet_rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdSnippetsSnippetRules*(client: CloudflareClient,
                                            zoneId: types.SnippetsZoneId): Future[JsonNode] {.async.} =
  ## Deletes all snippet rules belonging to the zone.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/snippets/snippet_rules")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSnippetsSnippetName*(client: CloudflareClient,
                                        zoneId: types.SnippetsZoneId,
                                        snippetName: types.SnippetsSnippetName): Future[JsonNode] {.async.} =
  ## Fetches a snippet belonging to the zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/snippets/{snippetName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdSnippetsSnippetName*(client: CloudflareClient,
                                        zoneId: types.SnippetsZoneId,
                                        snippetName: types.SnippetsSnippetName): Future[JsonNode] {.async.} =
  ## Creates or updates a snippet belonging to the zone.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/snippets/{snippetName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdSnippetsSnippetName*(client: CloudflareClient,
                                           zoneId: types.SnippetsZoneId,
                                           snippetName: types.SnippetsSnippetName): Future[JsonNode] {.async.} =
  ## Deletes a snippet belonging to the zone. Returns a 4XX response if the zone or
  ## snippet no longer exists.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/snippets/{snippetName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSnippetsSnippetNameContent*(client: CloudflareClient,
                                               zoneId: types.SnippetsZoneId,
                                               snippetName: types.SnippetsSnippetName): Future[AsyncResponse] {.async.} =
  ## Fetches the content of a snippet belonging to the zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/snippets/{snippetName}/content")
  return res
