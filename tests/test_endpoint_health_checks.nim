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

suite "endpoint_health_checks serialization":
  test "round-trips MagicTransitEndpointHealthCheckResponseSingle":
    let obj = newMagicTransitEndpointHealthCheckResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicTransitEndpointHealthCheckResponseSingle)) == openjson.toJson(obj)

  test "round-trips MagicTransitApiResponseCommonFailure":
    let obj = newMagicTransitApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicTransitApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips MagicTransitApiResponseCommon":
    let obj = newMagicTransitApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicTransitApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips MagicTransitTracerouteResponseCollection":
    let obj = newMagicTransitTracerouteResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicTransitTracerouteResponseCollection)) == openjson.toJson(obj)

  test "round-trips MagicTransitEndpointHealthCheck":
    let obj = newMagicTransitEndpointHealthCheck()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicTransitEndpointHealthCheck)) == openjson.toJson(obj)

suite "endpoint_health_checks endpoints":
  test "GET /accounts/{account_id}/diagnostics/endpoint-healthchecks":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDiagnosticsEndpointHealthchecks("test")

  test "POST /accounts/{account_id}/diagnostics/endpoint-healthchecks":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDiagnosticsEndpointHealthchecks("test", newMagicTransitEndpointHealthCheck())

  test "GET /accounts/{account_id}/diagnostics/endpoint-healthchecks/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDiagnosticsEndpointHealthchecksId("test", "test")

  test "PUT /accounts/{account_id}/diagnostics/endpoint-healthchecks/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDiagnosticsEndpointHealthchecksId("test", "test", newMagicTransitEndpointHealthCheck())

  test "DELETE /accounts/{account_id}/diagnostics/endpoint-healthchecks/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDiagnosticsEndpointHealthchecksId("test", "test")

