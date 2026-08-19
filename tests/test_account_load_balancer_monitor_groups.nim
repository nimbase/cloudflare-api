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

suite "account_load_balancer_monitor_groups serialization":
  test "round-trips LoadBalancingMonitorGroupReferencesResponse":
    let obj = newLoadBalancingMonitorGroupReferencesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingMonitorGroupReferencesResponse)) == openjson.toJson(obj)

  test "round-trips LoadBalancingMonitorGroupResponseCollection":
    let obj = newLoadBalancingMonitorGroupResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingMonitorGroupResponseCollection)) == openjson.toJson(obj)

  test "round-trips LoadBalancingMonitorGroupSingleResponse":
    let obj = newLoadBalancingMonitorGroupSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingMonitorGroupSingleResponse)) == openjson.toJson(obj)

  test "round-trips LoadBalancingApiResponseCommonFailure":
    let obj = newLoadBalancingApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips LoadBalancingMonitorGroup":
    let obj = newLoadBalancingMonitorGroup()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.LoadBalancingMonitorGroup)) == openjson.toJson(obj)

suite "account_load_balancer_monitor_groups endpoints":
  test "GET /accounts/{account_id}/load_balancers/monitor_groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLoadBalancersMonitorGroups("test")

  test "POST /accounts/{account_id}/load_balancers/monitor_groups":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdLoadBalancersMonitorGroups("test", newLoadBalancingMonitorGroup())

  test "GET /accounts/{account_id}/load_balancers/monitor_groups/{monitor_group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLoadBalancersMonitorGroupsMonitorGroupId("test", "test")

  test "PUT /accounts/{account_id}/load_balancers/monitor_groups/{monitor_group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdLoadBalancersMonitorGroupsMonitorGroupId("test", "test", newLoadBalancingMonitorGroup())

  test "DELETE /accounts/{account_id}/load_balancers/monitor_groups/{monitor_group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdLoadBalancersMonitorGroupsMonitorGroupId("test", "test")

  test "PATCH /accounts/{account_id}/load_balancers/monitor_groups/{monitor_group_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdLoadBalancersMonitorGroupsMonitorGroupId("test", "test", newLoadBalancingMonitorGroup())

  test "GET /accounts/{account_id}/load_balancers/monitor_groups/{monitor_group_id}/references":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLoadBalancersMonitorGroupsMonitorGroupIdReferences("test", "test")

