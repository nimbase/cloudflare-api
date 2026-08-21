# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient
import ./private/types

type
  ApiShieldLabelOrderOption* = enum
    orderName = "name"
    orderDescription = "description"
    orderCreatedAt = "created_at"
    orderLastUpdated = "last_updated"
    orderMappedResourcesOperations = "mapped_resources.operations"

  ApiShieldLabelDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getZonesZoneIdApiGatewayLabels*(client: CloudflareClient, page: int64 = 1,
                                     perPage: int64 = 20,
                                     order: ApiShieldLabelOrderOption,
                                     direction: ApiShieldLabelDirectionOption,
                                     source: types.ApiShieldLabelSource = default(types.ApiShieldLabelSource),
                                     filter: string = default(string),
                                     withMappedResourceCounts: bool = false): Future[JsonNode] {.async.} =
  ## Retrieve all labels

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  q["source"] = $source
  q["filter"] = $filter
  q["with_mapped_resource_counts"] = $withMappedResourceCounts
  let res = await client.httpGET("/zones/{zone_id}/api_gateway/labels", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdApiGatewayLabelsManagedName*(client: CloudflareClient,
                                                withMappedResourceCounts: bool = false): Future[JsonNode] {.async.} =
  ## Retrieve managed label

  var q = initOrderedTable[string, string]()
  q["with_mapped_resource_counts"] = $withMappedResourceCounts
  let res = await client.httpGET("/zones/{zone_id}/api_gateway/labels/managed/{name}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdApiGatewayLabelsManagedNameResourcesOperation*(client: CloudflareClient,
                                                                  body: types.ApiShieldReplaceOperationsAttachedToLabelRequest): Future[JsonNode] {.async.} =
  ## Replace all operations(s) attached to a managed label

  let res = await client.httpPUT("/zones/{zone_id}/api_gateway/labels/managed/{name}/resources/operation", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdApiGatewayLabelsUser*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Create user labels

  let res = await client.httpPOST("/zones/{zone_id}/api_gateway/labels/user", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdApiGatewayLabelsUser*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Delete user labels

  let res = await client.httpDELETE("/zones/{zone_id}/api_gateway/labels/user", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdApiGatewayLabelsUserName*(client: CloudflareClient,
                                             withMappedResourceCounts: bool = false): Future[JsonNode] {.async.} =
  ## Retrieve user label

  var q = initOrderedTable[string, string]()
  q["with_mapped_resource_counts"] = $withMappedResourceCounts
  let res = await client.httpGET("/zones/{zone_id}/api_gateway/labels/user/{name}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdApiGatewayLabelsUserName*(client: CloudflareClient,
                                             body: types.ApiShieldPutLabelRequest): Future[JsonNode] {.async.} =
  ## Update all fields on a label

  let res = await client.httpPUT("/zones/{zone_id}/api_gateway/labels/user/{name}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdApiGatewayLabelsUserName*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Delete user label

  let res = await client.httpDELETE("/zones/{zone_id}/api_gateway/labels/user/{name}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdApiGatewayLabelsUserName*(client: CloudflareClient,
                                               body: types.ApiShieldPatchLabelRequest): Future[JsonNode] {.async.} =
  ## Update certain fields on a label

  let res = await client.httpPATCH("/zones/{zone_id}/api_gateway/labels/user/{name}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdApiGatewayLabelsUserNameResourcesOperation*(client: CloudflareClient,
                                                               body: types.ApiShieldReplaceOperationsAttachedToLabelRequest): Future[JsonNode] {.async.} =
  ## Replace all operations(s) attached to a user label

  let res = await client.httpPUT("/zones/{zone_id}/api_gateway/labels/user/{name}/resources/operation", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdApiGatewayOperationsLabels*(client: CloudflareClient,
                                                body: types.ApiShieldBulkPostLabelsOnOperationRequest): Future[JsonNode] {.async.} =
  ## Bulk attach label(s) on operation(s) in endpoint management

  let res = await client.httpPOST("/zones/{zone_id}/api_gateway/operations/labels", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdApiGatewayOperationsLabels*(client: CloudflareClient,
                                               body: types.ApiShieldBulkPutLabelsOnOperationRequest): Future[JsonNode] {.async.} =
  ## Bulk replace label(s) on operation(s) in endpoint management

  let res = await client.httpPUT("/zones/{zone_id}/api_gateway/operations/labels", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdApiGatewayOperationsLabels*(client: CloudflareClient,
                                                  body: types.ApiShieldBulkDeleteLabelsOnOperationRequest): Future[JsonNode] {.async.} =
  ## Bulk remove label(s) on operation(s) in endpoint management

  let res = await client.httpDELETE("/zones/{zone_id}/api_gateway/operations/labels", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdApiGatewayOperationsOperationIdLabels*(client: CloudflareClient,
                                                           body: types.ApiShieldPostLabelsOnOperationRequest): Future[JsonNode] {.async.} =
  ## Attach label(s) on an operation in endpoint management

  let res = await client.httpPOST("/zones/{zone_id}/api_gateway/operations/{operation_id}/labels", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdApiGatewayOperationsOperationIdLabels*(client: CloudflareClient,
                                                          body: types.ApiShieldPutLabelsOnOperationRequest): Future[JsonNode] {.async.} =
  ## Replace label(s) on an operation in endpoint management

  let res = await client.httpPUT("/zones/{zone_id}/api_gateway/operations/{operation_id}/labels", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdApiGatewayOperationsOperationIdLabels*(client: CloudflareClient,
                                                             body: types.ApiShieldDeleteLabelsOnOperationRequest): Future[JsonNode] {.async.} =
  ## Remove label(s) on an operation in endpoint management

  let res = await client.httpDELETE("/zones/{zone_id}/api_gateway/operations/{operation_id}/labels", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
