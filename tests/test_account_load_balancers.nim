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

suite "account_load_balancers serialization":
  test "round-trips LoadBalancingLoadBalancerComponentsSchemasUsageResponse":
    let obj = newLoadBalancingLoadBalancerComponentsSchemasUsageResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingLoadBalancerComponentsSchemasUsageResponse)) == openjson.toJson(obj)

  test "round-trips LoadBalancingLoadBalancerComponentsSchemasResponseCollection":
    let obj = newLoadBalancingLoadBalancerComponentsSchemasResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingLoadBalancerComponentsSchemasResponseCollection)) == openjson.toJson(obj)

  test "round-trips LoadBalancingLoadBalancerComponentsSchemasSingleResponse":
    let obj = newLoadBalancingLoadBalancerComponentsSchemasSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingLoadBalancerComponentsSchemasSingleResponse)) == openjson.toJson(obj)

  test "round-trips LoadBalancingApiResponseCommonFailure":
    let obj = newLoadBalancingApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips LoadBalancingComponentsSchemasIdResponse":
    let obj = newLoadBalancingComponentsSchemasIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingComponentsSchemasIdResponse)) == openjson.toJson(obj)

  test "round-trips LoadBalancingLoadBalancerEditable":
    let obj = newLoadBalancingLoadBalancerEditable()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingLoadBalancerEditable)) == openjson.toJson(obj)

suite "account_load_balancers endpoints":
  test "GET /accounts/{account_id}/load_balancers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLoadBalancers("test")

  test "POST /accounts/{account_id}/load_balancers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdLoadBalancers("test")

  test "GET /accounts/{account_id}/load_balancers/usage":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLoadBalancersUsage("test")

  test "GET /accounts/{account_id}/load_balancers/{load_balancer_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLoadBalancersLoadBalancerId("test", "test")

  test "PUT /accounts/{account_id}/load_balancers/{load_balancer_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdLoadBalancersLoadBalancerId("test", "test")

  test "DELETE /accounts/{account_id}/load_balancers/{load_balancer_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdLoadBalancersLoadBalancerId("test", "test")

  test "PATCH /accounts/{account_id}/load_balancers/{load_balancer_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdLoadBalancersLoadBalancerId("test", "test")

