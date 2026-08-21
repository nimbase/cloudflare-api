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
  ZarazSortFieldOption* = enum
    sortFieldId = "id"
    sortFieldUserId = "user_id"
    sortFieldDescription = "description"
    sortFieldCreatedAt = "created_at"
    sortFieldUpdatedAt = "updated_at"

  ZarazSortOrderOption* = enum
    sortOrderDESC = "DESC"
    sortOrderASC = "ASC"


proc getZonesZoneIdSettingsZarazConfig*(client: CloudflareClient,
                                        zoneId: types.ZarazIdentifier): Future[types.ZarazZarazConfigResponse] {.async.} =
  ## Gets latest Zaraz configuration for a zone. It can be preview or published
  ## configuration, whichever was the last updated. Secret variables values will not
  ## be included.

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/zaraz/config")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZarazZarazConfigResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdSettingsZarazConfig*(client: CloudflareClient,
                                        zoneId: types.ZarazIdentifier,
                                        body: types.ZarazZarazConfigBody): Future[types.ZarazZarazConfigResponse] {.async.} =
  ## Updates Zaraz configuration for a zone.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/settings/zaraz/config", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZarazZarazConfigResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSettingsZarazDefault*(client: CloudflareClient,
                                         zoneId: types.ZarazIdentifier): Future[types.ZarazZarazConfigResponse] {.async.} =
  ## Gets default Zaraz configuration for a zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/zaraz/default")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZarazZarazConfigResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSettingsZarazExport*(client: CloudflareClient,
                                        zoneId: types.ZarazIdentifier): Future[types.ZarazZarazConfigReturn] {.async.} =
  ## Exports full current published Zaraz configuration for a zone, secret variables
  ## included.

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/zaraz/export")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZarazZarazConfigReturn)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSettingsZarazHistory*(client: CloudflareClient,
                                         zoneId: types.ZarazIdentifier,
                                         offset: int64 = default(int64),
                                         limit: int64 = default(int64),
                                         sortField: ZarazSortFieldOption,
                                         sortOrder: ZarazSortOrderOption): Future[types.ZarazZarazHistoryResponse] {.async.} =
  ## Lists a history of published Zaraz configuration records for a zone.

  var q = initOrderedTable[string, string]()
  q["offset"] = $offset
  q["limit"] = $limit
  q["sortField"] = $sortField
  q["sortOrder"] = $sortOrder
  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/zaraz/history", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZarazZarazHistoryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdSettingsZarazHistory*(client: CloudflareClient,
                                         zoneId: types.ZarazIdentifier): Future[types.ZarazZarazConfigResponse] {.async.} =
  ## Restores a historical published Zaraz configuration by ID for a zone.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/settings/zaraz/history", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZarazZarazConfigResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSettingsZarazHistoryConfigs*(client: CloudflareClient,
                                                zoneId: types.ZarazIdentifier,
                                                ids: seq[string] = @[]): Future[types.ZarazZarazConfigHistoryResponse] {.async.} =
  ## Gets a history of published Zaraz configurations by ID(s) for a zone.

  var q = initOrderedTable[string, string]()
  for v in ids: q["ids"] = $v
  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/zaraz/history/configs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZarazZarazConfigHistoryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdSettingsZarazPublish*(client: CloudflareClient,
                                          zoneId: types.ZarazIdentifier): Future[JsonNode] {.async.} =
  ## Publish current Zaraz preview configuration for a zone.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/settings/zaraz/publish", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSettingsZarazWorkflow*(client: CloudflareClient,
                                          zoneId: types.ZarazIdentifier): Future[types.ZarazZarazWorkflowResponse] {.async.} =
  ## Gets Zaraz workflow for a zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/zaraz/workflow")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZarazZarazWorkflowResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdSettingsZarazWorkflow*(client: CloudflareClient,
                                          zoneId: types.ZarazIdentifier,
                                          body: types.ZarazZarazWorkflow): Future[types.ZarazZarazWorkflowResponse] {.async.} =
  ## Updates Zaraz workflow for a zone.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/settings/zaraz/workflow", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZarazZarazWorkflowResponse)
  else:
    raise newException(CloudflareClientError, body)
