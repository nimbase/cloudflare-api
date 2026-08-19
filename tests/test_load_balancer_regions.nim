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

suite "load_balancer_regions serialization":
  test "round-trips LoadBalancingApiResponseCommonFailure":
    let obj = newLoadBalancingApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips LoadBalancingRegionComponentsSchemasResponseCollection":
    let obj = newLoadBalancingRegionComponentsSchemasResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingRegionComponentsSchemasResponseCollection)) == openjson.toJson(obj)

  test "round-trips LoadBalancingComponentsSchemasSingleResponse":
    let obj = newLoadBalancingComponentsSchemasSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingComponentsSchemasSingleResponse)) == openjson.toJson(obj)

suite "load_balancer_regions endpoints":
  test "GET /accounts/{account_id}/load_balancers/regions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLoadBalancersRegions("test", "test", "test", "test")

  test "GET /user/load_balancers/regions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUserLoadBalancersRegions("test", "test")

