# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdSchemaValidationSettings*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Retrieves the current global schema validation settings for a zone.

  let res = await client.httpGET("/zones/{zone_id}/schema_validation/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdSchemaValidationSettings*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Fully updates global schema validation settings for a zone, replacing existing
  ## configuration.

  let res = await client.httpPUT("/zones/{zone_id}/schema_validation/settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSchemaValidationSettings*(client: CloudflareClient,
                                               body: types.ApiShieldGlobalSettingChangeBase): Future[JsonNode] {.async.} =
  ## Partially updates global schema validation settings for a zone using PATCH
  ## semantics.

  let res = await client.httpPATCH("/zones/{zone_id}/schema_validation/settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSchemaValidationSettingsOperations*(client: CloudflareClient,
                                                       page: int64 = 1,
                                                       perPage: int64 = 20): Future[JsonNode] {.async.} =
  ## Lists per-operation schema validation settings configured for the zone.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET("/zones/{zone_id}/schema_validation/settings/operations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSchemaValidationSettingsOperations*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Updates schema validation settings for multiple API operations in a single
  ## request. Efficient for applying consistent validation rules across endpoints.

  let res = await client.httpPATCH("/zones/{zone_id}/schema_validation/settings/operations", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSchemaValidationSettingsOperationsOperationId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Retrieves the schema validation settings configured for a specific API
  ## operation.

  let res = await client.httpGET("/zones/{zone_id}/schema_validation/settings/operations/{operation_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdSchemaValidationSettingsOperationsOperationId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Fully updates schema validation settings for a specific API operation.

  let res = await client.httpPUT("/zones/{zone_id}/schema_validation/settings/operations/{operation_id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdSchemaValidationSettingsOperationsOperationId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Removes custom schema validation settings for a specific API operation,
  ## reverting to zone-level defaults.

  let res = await client.httpDELETE("/zones/{zone_id}/schema_validation/settings/operations/{operation_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
