# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import ./private/metaclient
import ./private/types

type
  ApiShieldEndpointManagementOrderOption* = enum
    orderMethod = "method"
    orderHost = "host"
    orderEndpoint = "endpoint"
    orderThresholdsKey = "thresholds.$key"

  ApiShieldEndpointManagementDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getZonesZoneIdApiGatewayOperations*(client: CloudflareClient,
                                         page: int64 = 1, perPage: int64 = 20,
                                         order: ApiShieldEndpointManagementOrderOption,
                                         direction: ApiShieldEndpointManagementDirectionOption,
                                         host: seq[string] = @[],
                                         `method`: seq[string] = @[],
                                         endpoint: string = default(string),
                                         feature: seq[string] = default(seq[string])): Future[types.ApiShieldMultipleOperationResponsePaginated] {.async.} =
  ## Lists all API operations tracked by API Shield for a zone with pagination.
  ## Returns operation details including method, path, and feature configurations.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  for v in host: q["host"] = $v
  for v in `method`: q["method"] = $v
  q["endpoint"] = $endpoint
  q["feature"] = $feature
  let res = await client.httpGET("/zones/{zone_id}/api_gateway/operations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ApiShieldMultipleOperationResponsePaginated)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdApiGatewayOperations*(client: CloudflareClient): Future[types.ApiShieldMultipleOperationResponse] {.async.} =
  ## Add one or more operations to a zone. Endpoints can contain path variables.
  ## Host, method, endpoint will be normalized to a canoncial form when creating an
  ## operation and must be unique on the zone. Inserting an operation that matches an
  ## existing one will return the record of the already existing operation and update
  ## its last_updated date.

  let res = await client.httpPOST("/zones/{zone_id}/api_gateway/operations", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ApiShieldMultipleOperationResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdApiGatewayOperations*(client: CloudflareClient): Future[types.ApiShieldApiResponseCommon] {.async.} =
  ## Bulk removes multiple API operations from API Shield endpoint management in a
  ## single request. Efficient for cleaning up unused endpoints.

  let res = await client.httpDELETE("/zones/{zone_id}/api_gateway/operations", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ApiShieldApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdApiGatewayOperationsItem*(client: CloudflareClient,
                                              body: types.ApiShieldBasicOperation): Future[types.ApiShieldSingleOperationResponse] {.async.} =
  ## Add one operation to a zone. Endpoints can contain path variables. Host, method,
  ## endpoint will be normalized to a canoncial form when creating an operation and
  ## must be unique on the zone. Inserting an operation that matches an existing one
  ## will return the record of the already existing operation and update its
  ## last_updated date.

  let res = await client.httpPOST("/zones/{zone_id}/api_gateway/operations/item", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ApiShieldSingleOperationResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdApiGatewayOperationsOperationId*(client: CloudflareClient,
                                                    feature: seq[string] = default(seq[string]),
                                                    withSchemas: bool = false): Future[types.ApiShieldSingleOperationResponse] {.async.} =
  ## Gets detailed information about a specific API operation in API Shield,
  ## including its schema validation settings and traffic statistics.

  var q = initOrderedTable[string, string]()
  q["feature"] = $feature
  q["with_schemas"] = $withSchemas
  let res = await client.httpGET("/zones/{zone_id}/api_gateway/operations/{operation_id}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ApiShieldSingleOperationResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdApiGatewayOperationsOperationId*(client: CloudflareClient): Future[types.ApiShieldApiResponseCommon] {.async.} =
  ## Removes a single API operation from API Shield endpoint management. The
  ## operation will no longer be tracked or protected by API Shield rules.

  let res = await client.httpDELETE("/zones/{zone_id}/api_gateway/operations/{operation_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ApiShieldApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdApiGatewaySchemas*(client: CloudflareClient,
                                      host: seq[string] = @[],
                                      feature: seq[string] = default(seq[string]),
                                      includeSchemaKind: seq[string] = default(seq[string])): Future[types.ApiShieldSchemaResponseWithThresholds] {.async.} =
  ## Retrieves API operations and their features exported as OpenAPI schemas.

  var q = initOrderedTable[string, string]()
  for v in host: q["host"] = $v
  q["feature"] = $feature
  q["include_schema_kind"] = $includeSchemaKind
  let res = await client.httpGET("/zones/{zone_id}/api_gateway/schemas", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ApiShieldSchemaResponseWithThresholds)
  else:
    raise newException(CloudflareClientError, body)
