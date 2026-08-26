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
  ## Lists web and API operations tracked for the zone, including each operation's
  ## method, path, and feature configuration.

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
  ## Creates one or more web or API operations. Hosts, methods, and paths are
  ## normalized; an existing matching operation is returned instead of duplicated.

  let res = await client.httpPOST("/zones/{zone_id}/api_gateway/operations", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ApiShieldMultipleOperationResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdApiGatewayOperations*(client: CloudflareClient): Future[types.ApiShieldApiResponseCommon] {.async.} =
  ## Deletes multiple web or API operations from endpoint management in one request.

  let res = await client.httpDELETE("/zones/{zone_id}/api_gateway/operations", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ApiShieldApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdApiGatewayOperationsItem*(client: CloudflareClient,
                                              body: types.ApiShieldBasicOperation): Future[types.ApiShieldSingleOperationResponse] {.async.} =
  ## Creates one web or API operation. The host, method, and path are normalized; an
  ## existing matching operation is returned instead of duplicated.

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
  ## Returns a web or API operation, including its schema validation settings and
  ## requested feature data.

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
  ## Deletes a web or API operation from endpoint management so its feature
  ## configuration is no longer tracked.

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
  ## Returns tracked web and API operations and their feature configuration rendered
  ## as OpenAPI schemas.

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
