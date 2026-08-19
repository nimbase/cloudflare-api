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

suite "load_balancer_pools serialization":
  test "round-trips LoadBalancingHealthDetails":
    let obj = newLoadBalancingHealthDetails()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingHealthDetails)) == openjson.toJson(obj)

  test "round-trips LoadBalancingSchemasResponseCollection":
    let obj = newLoadBalancingSchemasResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingSchemasResponseCollection)) == openjson.toJson(obj)

  test "round-trips LoadBalancingSchemasSingleResponse":
    let obj = newLoadBalancingSchemasSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingSchemasSingleResponse)) == openjson.toJson(obj)

  test "round-trips LoadBalancingSchemasIdResponse":
    let obj = newLoadBalancingSchemasIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingSchemasIdResponse)) == openjson.toJson(obj)

  test "round-trips LoadBalancingMonitorEditable":
    let obj = newLoadBalancingMonitorEditable()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingMonitorEditable)) == openjson.toJson(obj)

  test "round-trips LoadBalancingPoolsReferencesResponse":
    let obj = newLoadBalancingPoolsReferencesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingPoolsReferencesResponse)) == openjson.toJson(obj)

  test "round-trips LoadBalancingApiResponseCommonFailure":
    let obj = newLoadBalancingApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips LoadBalancingOriginSteering":
    let obj = newLoadBalancingOriginSteering()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingOriginSteering)) == openjson.toJson(obj)

  test "round-trips LoadBalancingPreviewResponse":
    let obj = newLoadBalancingPreviewResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingPreviewResponse)) == openjson.toJson(obj)

  test "round-trips LoadBalancingLoadShedding":
    let obj = newLoadBalancingLoadShedding()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingLoadShedding)) == openjson.toJson(obj)

  test "round-trips LoadBalancingNotificationFilter":
    let obj = newLoadBalancingNotificationFilter()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingNotificationFilter)) == openjson.toJson(obj)

suite "load_balancer_pools endpoints":
  test "GET /user/load_balancers/pools":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUserLoadBalancersPools("test")

  test "PATCH /user/load_balancers/pools":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchUserLoadBalancersPools()

  test "GET /user/load_balancers/pools/{pool_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUserLoadBalancersPoolsPoolId("test")

  test "DELETE /user/load_balancers/pools/{pool_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteUserLoadBalancersPoolsPoolId("test")

  test "GET /user/load_balancers/pools/{pool_id}/health":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUserLoadBalancersPoolsPoolIdHealth("test")

  test "POST /user/load_balancers/pools/{pool_id}/preview":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postUserLoadBalancersPoolsPoolIdPreview("test")

  test "GET /user/load_balancers/pools/{pool_id}/references":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUserLoadBalancersPoolsPoolIdReferences("test")

