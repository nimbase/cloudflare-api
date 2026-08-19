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
  PostZonesZoneIdLoadBalancersRequest = object
    adaptive_routing: Option[types.LoadBalancingAdaptiveRouting]
    country_pools: Option[types.LoadBalancingCountryPools]
    default_pools: types.LoadBalancingDefaultPools
    description: Option[types.LoadBalancingComponentsSchemasDescription]
    fallback_pool: types.LoadBalancingFallbackPool
    location_strategy: Option[types.LoadBalancingLocationStrategy]
    name: types.LoadBalancingComponentsSchemasName
    networks: Option[types.LoadBalancingNetworks]
    pop_pools: Option[types.LoadBalancingPopPools]
    proxied: Option[types.LoadBalancingProxied]
    random_steering: Option[types.LoadBalancingRandomSteering]
    region_pools: Option[types.LoadBalancingRegionPools]
    rules: Option[types.LoadBalancingRules]
    session_affinity: Option[types.LoadBalancingSessionAffinity]
    session_affinity_attributes: Option[types.LoadBalancingSessionAffinityAttributes]
    session_affinity_ttl: Option[types.LoadBalancingSessionAffinityTtl]
    steering_policy: Option[types.LoadBalancingSteeringPolicy]
    ttl: Option[types.LoadBalancingTtl]
  PutZonesZoneIdLoadBalancersLoadBalancerIdRequest = object
    adaptive_routing: Option[types.LoadBalancingAdaptiveRouting]
    country_pools: Option[types.LoadBalancingCountryPools]
    default_pools: types.LoadBalancingDefaultPools
    description: Option[types.LoadBalancingComponentsSchemasDescription]
    enabled: Option[types.LoadBalancingComponentsSchemasEnabled]
    fallback_pool: types.LoadBalancingFallbackPool
    location_strategy: Option[types.LoadBalancingLocationStrategy]
    name: types.LoadBalancingComponentsSchemasName
    networks: Option[types.LoadBalancingNetworks]
    pop_pools: Option[types.LoadBalancingPopPools]
    proxied: Option[types.LoadBalancingProxied]
    random_steering: Option[types.LoadBalancingRandomSteering]
    region_pools: Option[types.LoadBalancingRegionPools]
    rules: Option[types.LoadBalancingRules]
    session_affinity: Option[types.LoadBalancingSessionAffinity]
    session_affinity_attributes: Option[types.LoadBalancingSessionAffinityAttributes]
    session_affinity_ttl: Option[types.LoadBalancingSessionAffinityTtl]
    steering_policy: Option[types.LoadBalancingSteeringPolicy]
    ttl: Option[types.LoadBalancingTtl]
  PatchZonesZoneIdLoadBalancersLoadBalancerIdRequest = object
    adaptive_routing: Option[types.LoadBalancingAdaptiveRouting]
    country_pools: Option[types.LoadBalancingCountryPools]
    default_pools: Option[types.LoadBalancingDefaultPools]
    description: Option[types.LoadBalancingComponentsSchemasDescription]
    enabled: Option[types.LoadBalancingComponentsSchemasEnabled]
    fallback_pool: Option[types.LoadBalancingFallbackPool]
    location_strategy: Option[types.LoadBalancingLocationStrategy]
    name: Option[types.LoadBalancingComponentsSchemasName]
    pop_pools: Option[types.LoadBalancingPopPools]
    proxied: Option[types.LoadBalancingProxied]
    random_steering: Option[types.LoadBalancingRandomSteering]
    region_pools: Option[types.LoadBalancingRegionPools]
    rules: Option[types.LoadBalancingRules]
    session_affinity: Option[types.LoadBalancingSessionAffinity]
    session_affinity_attributes: Option[types.LoadBalancingSessionAffinityAttributes]
    session_affinity_ttl: Option[types.LoadBalancingSessionAffinityTtl]
    steering_policy: Option[types.LoadBalancingSteeringPolicy]
    ttl: Option[types.LoadBalancingTtl]

proc getZonesZoneIdLoadBalancers*(client: CloudflareClient,
                                  zoneId: types.LoadBalancingLoadBalancerComponentsSchemasIdentifier): Future[types.LoadBalancingLoadBalancerComponentsSchemasResponseCollection] {.async.} =
  ## List configured load balancers.

  let res = await client.httpGET(fmt"/zones/{zoneId}/load_balancers")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingLoadBalancerComponentsSchemasResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdLoadBalancers*(client: CloudflareClient,
                                   zoneId: types.LoadBalancingLoadBalancerComponentsSchemasIdentifier,
                                   body: PostZonesZoneIdLoadBalancersRequest): Future[types.LoadBalancingLoadBalancerComponentsSchemasSingleResponse] {.async.} =
  ## Create a new load balancer.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/load_balancers", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingLoadBalancerComponentsSchemasSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdLoadBalancersLoadBalancerId*(client: CloudflareClient,
                                                zoneId: types.LoadBalancingLoadBalancerComponentsSchemasIdentifier,
                                                loadBalancerId: types.LoadBalancingLoadBalancerComponentsSchemasIdentifier): Future[types.LoadBalancingLoadBalancerComponentsSchemasSingleResponse] {.async.} =
  ## Fetch a single configured load balancer.

  let res = await client.httpGET(fmt"/zones/{zoneId}/load_balancers/{loadBalancerId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingLoadBalancerComponentsSchemasSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdLoadBalancersLoadBalancerId*(client: CloudflareClient,
                                                zoneId: types.LoadBalancingLoadBalancerComponentsSchemasIdentifier,
                                                loadBalancerId: types.LoadBalancingLoadBalancerComponentsSchemasIdentifier,
                                                body: PutZonesZoneIdLoadBalancersLoadBalancerIdRequest): Future[types.LoadBalancingLoadBalancerComponentsSchemasSingleResponse] {.async.} =
  ## Update a configured load balancer.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/load_balancers/{loadBalancerId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingLoadBalancerComponentsSchemasSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdLoadBalancersLoadBalancerId*(client: CloudflareClient,
                                                   zoneId: types.LoadBalancingLoadBalancerComponentsSchemasIdentifier,
                                                   loadBalancerId: types.LoadBalancingLoadBalancerComponentsSchemasIdentifier): Future[types.LoadBalancingComponentsSchemasIdResponse] {.async.} =
  ## Delete a configured load balancer.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/load_balancers/{loadBalancerId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingComponentsSchemasIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdLoadBalancersLoadBalancerId*(client: CloudflareClient,
                                                  zoneId: types.LoadBalancingLoadBalancerComponentsSchemasIdentifier,
                                                  loadBalancerId: types.LoadBalancingLoadBalancerComponentsSchemasIdentifier,
                                                  body: PatchZonesZoneIdLoadBalancersLoadBalancerIdRequest): Future[types.LoadBalancingLoadBalancerComponentsSchemasSingleResponse] {.async.} =
  ## Apply changes to an existing load balancer, overwriting the supplied properties.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/load_balancers/{loadBalancerId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingLoadBalancerComponentsSchemasSingleResponse)
  else:
    raise newException(CloudflareClientError, body)
