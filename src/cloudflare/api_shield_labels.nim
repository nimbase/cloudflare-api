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
  ## Returns all managed and user-defined labels available for web and API operations
  ## in the zone.

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
  ## Returns a managed label and the web and API operations associated with it.

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
  ## Replaces the complete set of web and API operations attached to the managed
  ## label.

  let res = await client.httpPUT("/zones/{zone_id}/api_gateway/labels/managed/{name}/resources/operation", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdApiGatewayLabelsUser*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Creates one or more user-defined labels for classifying web and API operations.

  let res = await client.httpPOST("/zones/{zone_id}/api_gateway/labels/user", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdApiGatewayLabelsUser*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Deletes one or more user-defined labels and removes their associations with web
  ## and API operations.

  let res = await client.httpDELETE("/zones/{zone_id}/api_gateway/labels/user", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdApiGatewayLabelsUserName*(client: CloudflareClient,
                                             withMappedResourceCounts: bool = false): Future[JsonNode] {.async.} =
  ## Returns a user-defined label and the web and API operations associated with it.

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
  ## Replaces all editable fields on a user-defined label.

  let res = await client.httpPUT("/zones/{zone_id}/api_gateway/labels/user/{name}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdApiGatewayLabelsUserName*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Deletes a user-defined label and removes its associations with web and API
  ## operations.

  let res = await client.httpDELETE("/zones/{zone_id}/api_gateway/labels/user/{name}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdApiGatewayLabelsUserName*(client: CloudflareClient,
                                               body: types.ApiShieldPatchLabelRequest): Future[JsonNode] {.async.} =
  ## Updates only the supplied fields on a user-defined label.

  let res = await client.httpPATCH("/zones/{zone_id}/api_gateway/labels/user/{name}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdApiGatewayLabelsUserNameResourcesOperation*(client: CloudflareClient,
                                                               body: types.ApiShieldReplaceOperationsAttachedToLabelRequest): Future[JsonNode] {.async.} =
  ## Replaces the complete set of web and API operations attached to the user-defined
  ## label.

  let res = await client.httpPUT("/zones/{zone_id}/api_gateway/labels/user/{name}/resources/operation", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdApiGatewayOperationsLabels*(client: CloudflareClient,
                                                body: types.ApiShieldBulkPostLabelsOnOperationRequest): Future[JsonNode] {.async.} =
  ## Attaches labels to multiple web or API operations in one request.

  let res = await client.httpPOST("/zones/{zone_id}/api_gateway/operations/labels", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdApiGatewayOperationsLabels*(client: CloudflareClient,
                                               body: types.ApiShieldBulkPutLabelsOnOperationRequest): Future[JsonNode] {.async.} =
  ## Replaces the complete label sets on multiple web or API operations in one
  ## request.

  let res = await client.httpPUT("/zones/{zone_id}/api_gateway/operations/labels", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdApiGatewayOperationsLabels*(client: CloudflareClient,
                                                  body: types.ApiShieldBulkDeleteLabelsOnOperationRequest): Future[JsonNode] {.async.} =
  ## Removes labels from multiple web or API operations in one request.

  let res = await client.httpDELETE("/zones/{zone_id}/api_gateway/operations/labels", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdApiGatewayOperationsOperationIdLabels*(client: CloudflareClient,
                                                           body: types.ApiShieldPostLabelsOnOperationRequest): Future[JsonNode] {.async.} =
  ## Attaches one or more labels to a web or API operation.

  let res = await client.httpPOST("/zones/{zone_id}/api_gateway/operations/{operation_id}/labels", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdApiGatewayOperationsOperationIdLabels*(client: CloudflareClient,
                                                          body: types.ApiShieldPutLabelsOnOperationRequest): Future[JsonNode] {.async.} =
  ## Replaces the complete label set on a web or API operation.

  let res = await client.httpPUT("/zones/{zone_id}/api_gateway/operations/{operation_id}/labels", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdApiGatewayOperationsOperationIdLabels*(client: CloudflareClient,
                                                             body: types.ApiShieldDeleteLabelsOnOperationRequest): Future[JsonNode] {.async.} =
  ## Removes one or more labels from a web or API operation.

  let res = await client.httpDELETE("/zones/{zone_id}/api_gateway/operations/{operation_id}/labels", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
