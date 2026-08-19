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

suite "metrics_export serialization":
  test "round-trips GetAccountsAccountIdWorkersObservabilityMetricsexportResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkersObservabilityMetricsexportResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkersObservabilityMetricsexportResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdWorkersObservabilityMetricsexportResponse":
    let obj = cloudflare.PostAccountsAccountIdWorkersObservabilityMetricsexportResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdWorkersObservabilityMetricsexportResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdWorkersObservabilityMetricsexportResponse":
    let obj = cloudflare.DeleteAccountsAccountIdWorkersObservabilityMetricsexportResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdWorkersObservabilityMetricsexportResponse)) == openjson.toJson(obj)

suite "metrics_export endpoints":
  test "GET /accounts/{account_id}/workers/observability/metricsexport":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersObservabilityMetricsexport()

  test "POST /accounts/{account_id}/workers/observability/metricsexport":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdWorkersObservabilityMetricsexport()

