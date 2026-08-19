# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[asyncdispatch]
import unittest
import pkg/openparser/json as openjson
import cloudflare
import ./common

suite "load_balancers serialization":
  test "round-trips LoadBalancingPopPools":
    let obj = newLoadBalancingPopPools()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingPopPools)) == openjson.toJson(obj)

  test "round-trips LoadBalancingSessionAffinityAttributes":
    let obj = newLoadBalancingSessionAffinityAttributes()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingSessionAffinityAttributes)) == openjson.toJson(obj)

  test "round-trips LoadBalancingLoadBalancerComponentsSchemasResponseCollection":
    let obj = newLoadBalancingLoadBalancerComponentsSchemasResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingLoadBalancerComponentsSchemasResponseCollection)) == openjson.toJson(obj)

  test "round-trips LoadBalancingLoadBalancerComponentsSchemasSingleResponse":
    let obj = newLoadBalancingLoadBalancerComponentsSchemasSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingLoadBalancerComponentsSchemasSingleResponse)) == openjson.toJson(obj)

  test "round-trips LoadBalancingAdaptiveRouting":
    let obj = newLoadBalancingAdaptiveRouting()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingAdaptiveRouting)) == openjson.toJson(obj)

  test "round-trips LoadBalancingApiResponseCommonFailure":
    let obj = newLoadBalancingApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips LoadBalancingLocationStrategy":
    let obj = newLoadBalancingLocationStrategy()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingLocationStrategy)) == openjson.toJson(obj)

  test "round-trips LoadBalancingCountryPools":
    let obj = newLoadBalancingCountryPools()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingCountryPools)) == openjson.toJson(obj)

  test "round-trips LoadBalancingComponentsSchemasIdResponse":
    let obj = newLoadBalancingComponentsSchemasIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingComponentsSchemasIdResponse)) == openjson.toJson(obj)

  test "round-trips LoadBalancingRegionPools":
    let obj = newLoadBalancingRegionPools()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingRegionPools)) == openjson.toJson(obj)

  test "round-trips LoadBalancingRandomSteering":
    let obj = newLoadBalancingRandomSteering()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingRandomSteering)) == openjson.toJson(obj)

suite "load_balancers endpoints":
  test "GET /zones/{zone_id}/load_balancers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdLoadBalancers("test")

  test "GET /zones/{zone_id}/load_balancers/{load_balancer_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdLoadBalancersLoadBalancerId("test", "test")

  test "DELETE /zones/{zone_id}/load_balancers/{load_balancer_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdLoadBalancersLoadBalancerId("test", "test")

