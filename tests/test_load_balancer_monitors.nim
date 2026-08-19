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

suite "load_balancer_monitors serialization":
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

  test "round-trips LoadBalancingPreviewId":
    let obj = newLoadBalancingPreviewId()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingPreviewId)) == openjson.toJson(obj)

  test "round-trips LoadBalancingMonitorReferencesResponse":
    let obj = newLoadBalancingMonitorReferencesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingMonitorReferencesResponse)) == openjson.toJson(obj)

  test "round-trips LoadBalancingMonitorResponseCollection":
    let obj = newLoadBalancingMonitorResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingMonitorResponseCollection)) == openjson.toJson(obj)

suite "load_balancer_monitors endpoints":
  test "GET /user/load_balancers/monitors":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUserLoadBalancersMonitors()

  test "POST /user/load_balancers/monitors":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postUserLoadBalancersMonitors()

  test "GET /user/load_balancers/monitors/{monitor_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUserLoadBalancersMonitorsMonitorId("test")

  test "PUT /user/load_balancers/monitors/{monitor_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putUserLoadBalancersMonitorsMonitorId("test")

  test "DELETE /user/load_balancers/monitors/{monitor_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteUserLoadBalancersMonitorsMonitorId("test")

  test "PATCH /user/load_balancers/monitors/{monitor_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchUserLoadBalancersMonitorsMonitorId("test")

  test "POST /user/load_balancers/monitors/{monitor_id}/preview":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postUserLoadBalancersMonitorsMonitorIdPreview("test")

  test "GET /user/load_balancers/monitors/{monitor_id}/references":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUserLoadBalancersMonitorsMonitorIdReferences("test")

  test "GET /user/load_balancers/preview/{preview_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUserLoadBalancersPreviewPreviewId(newLoadBalancingPreviewId())

