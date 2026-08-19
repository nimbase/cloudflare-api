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

suite "account_load_balancer_monitors serialization":
  test "round-trips LoadBalancingMonitorResponseSingle":
    let obj = newLoadBalancingMonitorResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingMonitorResponseSingle)) == openjson.toJson(obj)

  test "round-trips LoadBalancingMonitorEditable":
    let obj = newLoadBalancingMonitorEditable()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingMonitorEditable)) == openjson.toJson(obj)

  test "round-trips LoadBalancingApiResponseCommonFailure":
    let obj = newLoadBalancingApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips LoadBalancingPreviewResponse":
    let obj = newLoadBalancingPreviewResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingPreviewResponse)) == openjson.toJson(obj)

  test "round-trips LoadBalancingPreviewResultResponse":
    let obj = newLoadBalancingPreviewResultResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingPreviewResultResponse)) == openjson.toJson(obj)

  test "round-trips LoadBalancingIdResponse":
    let obj = newLoadBalancingIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingIdResponse)) == openjson.toJson(obj)

  test "round-trips LoadBalancingMonitorReferencesResponse":
    let obj = newLoadBalancingMonitorReferencesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingMonitorReferencesResponse)) == openjson.toJson(obj)

  test "round-trips LoadBalancingMonitorResponseCollection":
    let obj = newLoadBalancingMonitorResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingMonitorResponseCollection)) == openjson.toJson(obj)

suite "account_load_balancer_monitors endpoints":
  test "GET /accounts/{account_id}/load_balancers/monitors":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLoadBalancersMonitors("test")

  test "POST /accounts/{account_id}/load_balancers/monitors":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdLoadBalancersMonitors("test")

  test "GET /accounts/{account_id}/load_balancers/monitors/{monitor_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLoadBalancersMonitorsMonitorId("test", "test")

  test "PUT /accounts/{account_id}/load_balancers/monitors/{monitor_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdLoadBalancersMonitorsMonitorId("test", "test")

  test "DELETE /accounts/{account_id}/load_balancers/monitors/{monitor_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdLoadBalancersMonitorsMonitorId("test", "test")

  test "PATCH /accounts/{account_id}/load_balancers/monitors/{monitor_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdLoadBalancersMonitorsMonitorId("test", "test")

  test "POST /accounts/{account_id}/load_balancers/monitors/{monitor_id}/preview":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdLoadBalancersMonitorsMonitorIdPreview("test", "test")

  test "GET /accounts/{account_id}/load_balancers/monitors/{monitor_id}/references":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLoadBalancersMonitorsMonitorIdReferences("test", "test")

  test "GET /accounts/{account_id}/load_balancers/preview/{preview_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLoadBalancersPreviewPreviewId("test", "test")

