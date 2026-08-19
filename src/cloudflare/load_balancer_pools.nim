# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options]
import ./private/metaclient
import ./private/types

type
  PostUserLoadBalancersPoolsRequest = object
    check_regions: Option[types.LoadBalancingCheckRegions]
    description: Option[types.LoadBalancingSchemasDescription]
    enabled: Option[types.LoadBalancingEnabled]
    health_sources: Option[types.LoadBalancingHealthSources]
    latitude: Option[types.LoadBalancingLatitude]
    load_shedding: Option[types.LoadBalancingLoadShedding]
    longitude: Option[types.LoadBalancingLongitude]
    minimum_origins: Option[types.LoadBalancingMinimumOrigins]
    monitor: Option[types.LoadBalancingMonitorId]
    monitor_group: Option[types.LoadBalancingMonitorGroupId]
    name: types.LoadBalancingName
    networks: Option[types.LoadBalancingNetworks]
    notification_email: Option[types.LoadBalancingNotificationEmail]
    notification_filter: Option[types.LoadBalancingNotificationFilter]
    origin_steering: Option[types.LoadBalancingOriginSteering]
    origins: types.LoadBalancingOrigins
  PutUserLoadBalancersPoolsPoolIdRequest = object
    check_regions: Option[types.LoadBalancingCheckRegions]
    description: Option[types.LoadBalancingSchemasDescription]
    disabled_at: Option[types.LoadBalancingSchemasDisabledAt]
    enabled: Option[types.LoadBalancingEnabled]
    health_sources: Option[types.LoadBalancingHealthSources]
    latitude: Option[types.LoadBalancingLatitude]
    load_shedding: Option[types.LoadBalancingLoadShedding]
    longitude: Option[types.LoadBalancingLongitude]
    minimum_origins: Option[types.LoadBalancingMinimumOrigins]
    monitor: Option[types.LoadBalancingMonitorId]
    monitor_group: Option[types.LoadBalancingMonitorGroupId]
    name: types.LoadBalancingName
    networks: Option[types.LoadBalancingNetworks]
    notification_email: Option[types.LoadBalancingNotificationEmail]
    notification_filter: Option[types.LoadBalancingNotificationFilter]
    origin_steering: Option[types.LoadBalancingOriginSteering]
    origins: types.LoadBalancingOrigins
  PatchUserLoadBalancersPoolsPoolIdRequest = object
    check_regions: Option[types.LoadBalancingCheckRegions]
    description: Option[types.LoadBalancingSchemasDescription]
    disabled_at: Option[types.LoadBalancingSchemasDisabledAt]
    enabled: Option[types.LoadBalancingEnabled]
    health_sources: Option[types.LoadBalancingHealthSources]
    latitude: Option[types.LoadBalancingLatitude]
    load_shedding: Option[types.LoadBalancingLoadShedding]
    longitude: Option[types.LoadBalancingLongitude]
    minimum_origins: Option[types.LoadBalancingMinimumOrigins]
    monitor: Option[types.LoadBalancingMonitorId]
    monitor_group: Option[types.LoadBalancingMonitorGroupId]
    name: Option[types.LoadBalancingName]
    notification_email: Option[types.LoadBalancingNotificationEmail]
    notification_filter: Option[types.LoadBalancingNotificationFilter]
    origin_steering: Option[types.LoadBalancingOriginSteering]
    origins: Option[types.LoadBalancingOrigins]

proc getUserLoadBalancersPools*(client: CloudflareClient,
                                monitor: string = default(string)): Future[types.LoadBalancingSchemasResponseCollection] {.async.} =
  ## List configured pools.

  var q = initOrderedTable[string, string]()
  q["monitor"] = $monitor
  let res = await client.httpGET("/user/load_balancers/pools", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingSchemasResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postUserLoadBalancersPools*(client: CloudflareClient,
                                 body: PostUserLoadBalancersPoolsRequest): Future[types.LoadBalancingSchemasSingleResponse] {.async.} =
  ## Create a new pool.

  let res = await client.httpPOST("/user/load_balancers/pools", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingSchemasSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchUserLoadBalancersPools*(client: CloudflareClient): Future[types.LoadBalancingSchemasResponseCollection] {.async.} =
  ## Apply changes to a number of existing pools, overwriting the supplied
  ## properties. Pools are ordered by ascending `name`. Returns the list of affected
  ## pools. Supports the standard pagination query parameters, either
  ## `limit`/`offset` or `per_page`/`page`.

  let res = await client.httpPATCH("/user/load_balancers/pools", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingSchemasResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getUserLoadBalancersPoolsPoolId*(client: CloudflareClient,
                                      poolId: types.LoadBalancingSchemasIdentifier): Future[types.LoadBalancingSchemasSingleResponse] {.async.} =
  ## Fetch a single configured pool.

  let res = await client.httpGET(fmt"/user/load_balancers/pools/{poolId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingSchemasSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putUserLoadBalancersPoolsPoolId*(client: CloudflareClient,
                                      poolId: types.LoadBalancingSchemasIdentifier,
                                      body: PutUserLoadBalancersPoolsPoolIdRequest): Future[types.LoadBalancingSchemasSingleResponse] {.async.} =
  ## Modify a configured pool.

  let res = await client.httpPUT(fmt"/user/load_balancers/pools/{poolId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingSchemasSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteUserLoadBalancersPoolsPoolId*(client: CloudflareClient,
                                         poolId: types.LoadBalancingSchemasIdentifier): Future[types.LoadBalancingSchemasIdResponse] {.async.} =
  ## Delete a configured pool.

  let res = await client.httpDELETE(fmt"/user/load_balancers/pools/{poolId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingSchemasIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchUserLoadBalancersPoolsPoolId*(client: CloudflareClient,
                                        poolId: types.LoadBalancingSchemasIdentifier,
                                        body: PatchUserLoadBalancersPoolsPoolIdRequest): Future[types.LoadBalancingSchemasSingleResponse] {.async.} =
  ## Apply changes to an existing pool, overwriting the supplied properties.

  let res = await client.httpPATCH(fmt"/user/load_balancers/pools/{poolId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingSchemasSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getUserLoadBalancersPoolsPoolIdHealth*(client: CloudflareClient,
                                            poolId: types.LoadBalancingSchemasIdentifier): Future[types.LoadBalancingHealthDetails] {.async.} =
  ## Fetch the latest pool health status for a single pool.

  let res = await client.httpGET(fmt"/user/load_balancers/pools/{poolId}/health")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingHealthDetails)
  else:
    raise newException(CloudflareClientError, body)

proc postUserLoadBalancersPoolsPoolIdPreview*(client: CloudflareClient,
                                              poolId: types.LoadBalancingSchemasIdentifier): Future[types.LoadBalancingPreviewResponse] {.async.} =
  ## Preview pool health using provided monitor details. The returned preview_id can
  ## be used in the preview endpoint to retrieve the results.

  let res = await client.httpPOST(fmt"/user/load_balancers/pools/{poolId}/preview", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingPreviewResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getUserLoadBalancersPoolsPoolIdReferences*(client: CloudflareClient,
                                                poolId: types.LoadBalancingSchemasIdentifier): Future[types.LoadBalancingPoolsReferencesResponse] {.async.} =
  ## Get the list of resources that reference the provided pool.

  let res = await client.httpGET(fmt"/user/load_balancers/pools/{poolId}/references")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingPoolsReferencesResponse)
  else:
    raise newException(CloudflareClientError, body)
