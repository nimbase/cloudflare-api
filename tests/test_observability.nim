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

suite "observability serialization":
  test "round-trips GetAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingRulesResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingRulesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingRulesResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingRulesResponse":
    let obj = cloudflare.PutAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingRulesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingRulesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingSettingsResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingSettingsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingSettingsResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingSettingsResponse":
    let obj = cloudflare.PatchAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingSettingsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingSettingsResponse)) == openjson.toJson(obj)

suite "observability endpoints":
  test "GET /accounts/{account_id}/workers/observability/zones/{zone_id}/observability/tracing/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingRules("test")

  test "GET /accounts/{account_id}/workers/observability/zones/{zone_id}/observability/tracing/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersObservabilityZonesZoneIdObservabilityTracingSettings("test")

