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
  PatchZonesZoneIdApiGatewayUserSchemasSchemaIdRequest = object
    validation_enabled: Option[JsonNode]
  ApiShieldSchemaValidation20OperationStatusOption* = enum
    operationStatusNew = "new"
    operationStatusExisting = "existing"


proc patchZonesZoneIdApiGatewayOperationsSchemaValidation*(client: CloudflareClient,
                                                           body: types.ApiShieldOldOperationSchemaValidationSettingsMultipleRequest): Future[JsonNode] {.async.} =
  ## Updates multiple operation-level schema validation settings on the zone.
  ## Deprecated; use `/zones/{zone_id}/schema_validation/settings/operations`
  ## instead.

  let res = await client.httpPATCH("/zones/{zone_id}/api_gateway/operations/schema_validation", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdApiGatewayOperationsOperationIdSchemaValidation*(client: CloudflareClient): Future[types.ApiShieldOldOperationSchemaValidationSettings] {.async.} =
  ## Retrieves operation-level schema validation settings on the zone. Deprecated;
  ## use `/zones/{zone_id}/schema_validation/settings/operations/{operation_id}`
  ## instead.

  let res = await client.httpGET("/zones/{zone_id}/api_gateway/operations/{operation_id}/schema_validation")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ApiShieldOldOperationSchemaValidationSettings)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdApiGatewayOperationsOperationIdSchemaValidation*(client: CloudflareClient,
                                                                    body: types.ApiShieldOldOperationSchemaValidationSettingsModifyRequest): Future[types.ApiShieldOldOperationSchemaValidationSettings] {.async.} =
  ## Updates operation-level schema validation settings on the zone. Deprecated; use
  ## `/zones/{zone_id}/schema_validation/settings/operations/{operation_id}` instead.

  let res = await client.httpPUT("/zones/{zone_id}/api_gateway/operations/{operation_id}/schema_validation", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ApiShieldOldOperationSchemaValidationSettings)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdApiGatewaySettingsSchemaValidation*(client: CloudflareClient): Future[types.ApiShieldOldZoneSchemaValidationSettings] {.async.} =
  ## Retrieves zone level schema validation settings currently set on the zone.
  ## Deprecated; use `/zones/{zone_id}/schema_validation/settings` instead.

  let res = await client.httpGET("/zones/{zone_id}/api_gateway/settings/schema_validation")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ApiShieldOldZoneSchemaValidationSettings)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdApiGatewaySettingsSchemaValidation*(client: CloudflareClient,
                                                       body: types.ApiShieldOldZoneSchemaValidationSettingsPut): Future[types.ApiShieldOldZoneSchemaValidationSettings] {.async.} =
  ## Updates zone level schema validation settings on the zone. Deprecated; use
  ## `/zones/{zone_id}/schema_validation/settings` instead.

  let res = await client.httpPUT("/zones/{zone_id}/api_gateway/settings/schema_validation", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ApiShieldOldZoneSchemaValidationSettings)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdApiGatewaySettingsSchemaValidation*(client: CloudflareClient,
                                                         body: types.ApiShieldOldZoneSchemaValidationSettingsPatch): Future[types.ApiShieldOldZoneSchemaValidationSettings] {.async.} =
  ## Updates zone level schema validation settings on the zone. Deprecated; use
  ## `/zones/{zone_id}/schema_validation/settings` instead.

  let res = await client.httpPATCH("/zones/{zone_id}/api_gateway/settings/schema_validation", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ApiShieldOldZoneSchemaValidationSettings)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdApiGatewayUserSchemas*(client: CloudflareClient,
                                          page: int64 = 1, perPage: int64 = 20,
                                          omitSource: bool = false,
                                          validationEnabled: types.ApiShieldOldValidationEnabled = default(types.ApiShieldOldValidationEnabled)): Future[JsonNode] {.async.} =
  ## Lists all OpenAPI schemas uploaded to API Shield for the zone, including their
  ## validation status and associated operations. Deprecated; use
  ## `/zones/{zone_id}/schema_validation/schemas` instead.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["omit_source"] = $omitSource
  q["validation_enabled"] = $validationEnabled
  let res = await client.httpGET("/zones/{zone_id}/api_gateway/user_schemas", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdApiGatewayUserSchemas*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Uploads an OpenAPI schema that defines expected request formats for API
  ## endpoints. Deprecated; use `/zones/{zone_id}/schema_validation/schemas` instead.

  let res = await client.httpPOST("/zones/{zone_id}/api_gateway/user_schemas")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdApiGatewayUserSchemasHosts*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Lists all unique hosts found in uploaded OpenAPI schemas for the zone. Useful
  ## for understanding which domains have schema coverage. Deprecated; use
  ## `/zones/{zone_id}/schema_validation/schemas/hosts` instead.

  let res = await client.httpGET("/zones/{zone_id}/api_gateway/user_schemas/hosts")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdApiGatewayUserSchemasSchemaId*(client: CloudflareClient,
                                                  omitSource: bool = false): Future[JsonNode] {.async.} =
  ## Gets detailed information about a specific uploaded OpenAPI schema, including
  ## its contents and validation configuration. Deprecated; use
  ## `/zones/{zone_id}/schema_validation/schemas/{schema_id}` instead.

  var q = initOrderedTable[string, string]()
  q["omit_source"] = $omitSource
  let res = await client.httpGET("/zones/{zone_id}/api_gateway/user_schemas/{schema_id}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdApiGatewayUserSchemasSchemaId*(client: CloudflareClient): Future[types.ApiShieldApiResponseSingle] {.async.} =
  ## Permanently removes an uploaded OpenAPI schema from API Shield schema
  ## validation. Operations using this schema will lose their validation rules.
  ## Deprecated; use `/zones/{zone_id}/schema_validation/schemas/{schema_id}`
  ## instead.

  let res = await client.httpDELETE("/zones/{zone_id}/api_gateway/user_schemas/{schema_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ApiShieldApiResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdApiGatewayUserSchemasSchemaId*(client: CloudflareClient,
                                                    body: PatchZonesZoneIdApiGatewayUserSchemasSchemaIdRequest): Future[JsonNode] {.async.} =
  ## Activates schema validation for an uploaded OpenAPI schema. Requests to matching
  ## endpoints will be validated against the schema definitions. Deprecated; use
  ## `/zones/{zone_id}/schema_validation/schemas/{schema_id}` instead.

  let res = await client.httpPATCH("/zones/{zone_id}/api_gateway/user_schemas/{schema_id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdApiGatewayUserSchemasSchemaIdOperations*(client: CloudflareClient,
                                                            feature: seq[string] = default(seq[string]),
                                                            host: seq[string] = @[],
                                                            `method`: seq[string] = @[],
                                                            endpoint: string = default(string),
                                                            page: int64 = 1,
                                                            perPage: int64 = 20,
                                                            operationStatus: ApiShieldSchemaValidation20OperationStatusOption): Future[JsonNode] {.async.} =
  ## Retrieves all operations from the schema. Operations that already exist in API
  ## Shield Endpoint Management will be returned as full operations. Deprecated; use
  ## `/zones/{zone_id}/schema_validation/schemas/{schema_id}/operations` instead.

  var q = initOrderedTable[string, string]()
  q["feature"] = $feature
  for v in host: q["host"] = $v
  for v in `method`: q["method"] = $v
  q["endpoint"] = $endpoint
  q["page"] = $page
  q["per_page"] = $perPage
  q["operation_status"] = $operationStatus
  let res = await client.httpGET("/zones/{zone_id}/api_gateway/user_schemas/{schema_id}/operations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
