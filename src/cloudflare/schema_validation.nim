# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[options, json]
import ./private/metaclient
import ./private/types

type
  PostZonesZoneIdSchemaValidationSchemasRequest = object
    kind: string
    name: string
    source: string
    validation_enabled: bool
  PatchZonesZoneIdSchemaValidationSchemasSchemaIdRequest = object
    validation_enabled: Option[bool]
  SchemaValidationOperationStatusOption* = enum
    operationStatusNew = "new"
    operationStatusExisting = "existing"


proc getZonesZoneIdSchemaValidationSchemas*(client: CloudflareClient,
                                            page: int64 = 1, perPage: int64 = 20,
                                            omitSource: bool = false,
                                            validationEnabled: bool = default(bool)): Future[JsonNode] {.async.} =
  ## Lists all OpenAPI schemas uploaded to API Security.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["omit_source"] = $omitSource
  q["validation_enabled"] = $validationEnabled
  let res = await client.httpGET("/zones/{zone_id}/schema_validation/schemas", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdSchemaValidationSchemas*(client: CloudflareClient,
                                             body: PostZonesZoneIdSchemaValidationSchemasRequest): Future[JsonNode] {.async.} =
  ## Uploads an OpenAPI schema that defines expected request formats for API
  ## operations.

  let res = await client.httpPOST("/zones/{zone_id}/schema_validation/schemas", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSchemaValidationSchemasHosts*(client: CloudflareClient,
                                                 page: int64 = 1,
                                                 perPage: int64 = 20): Future[JsonNode] {.async.} =
  ## Lists all unique hosts found in uploaded OpenAPI schemas for the zone.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET("/zones/{zone_id}/schema_validation/schemas/hosts", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSchemaValidationSchemasSchemaId*(client: CloudflareClient,
                                                    omitSource: bool = false): Future[types.ApiShieldPublicSchemaSuccessResult] {.async.} =
  ## Gets the contents and metadata of a specific OpenAPI schema uploaded to API
  ## Security.

  var q = initOrderedTable[string, string]()
  q["omit_source"] = $omitSource
  let res = await client.httpGET("/zones/{zone_id}/schema_validation/schemas/{schema_id}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ApiShieldPublicSchemaSuccessResult)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdSchemaValidationSchemasSchemaId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Permanently removes an uploaded OpenAPI schema from API Security. Operations
  ## using this schema will lose their validation rules.

  let res = await client.httpDELETE("/zones/{zone_id}/schema_validation/schemas/{schema_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSchemaValidationSchemasSchemaId*(client: CloudflareClient,
                                                      body: PatchZonesZoneIdSchemaValidationSchemasSchemaIdRequest): Future[types.ApiShieldPublicSchemaSuccessResult] {.async.} =
  ## Enables or disables validation for an uploaded OpenAPI schema without changing
  ## the schema document.

  let res = await client.httpPATCH("/zones/{zone_id}/schema_validation/schemas/{schema_id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ApiShieldPublicSchemaSuccessResult)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSchemaValidationSchemasSchemaIdOperations*(client: CloudflareClient,
                                                              feature: seq[string] = default(seq[string]),
                                                              host: seq[string] = @[],
                                                              `method`: seq[string] = @[],
                                                              endpoint: string = default(string),
                                                              page: int64 = 1,
                                                              perPage: int64 = 20,
                                                              operationStatus: SchemaValidationOperationStatusOption): Future[JsonNode] {.async.} =
  ## Retrieves all operations from the schema. Operations that already exist in API
  ## Shield Endpoint Management will be returned as full operations.

  var q = initOrderedTable[string, string]()
  q["feature"] = $feature
  for v in host: q["host"] = $v
  for v in `method`: q["method"] = $v
  q["endpoint"] = $endpoint
  q["page"] = $page
  q["per_page"] = $perPage
  q["operation_status"] = $operationStatus
  let res = await client.httpGET("/zones/{zone_id}/schema_validation/schemas/{schema_id}/operations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
