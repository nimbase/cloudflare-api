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

suite "query_run serialization":
  test "round-trips WorkersObservabilityFilterNode":
    let obj = newWorkersObservabilityFilterNode()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersObservabilityFilterNode)) == openjson.toJson(obj)

  test "round-trips WorkersObservabilityQueryResults":
    let obj = newWorkersObservabilityQueryResults()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersObservabilityQueryResults)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdWorkersObservabilityTelemetryQueryResponse":
    let obj = cloudflare.PostAccountsAccountIdWorkersObservabilityTelemetryQueryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdWorkersObservabilityTelemetryQueryResponse)) == openjson.toJson(obj)

suite "query_run endpoints":
  test "module has no sampleable endpoints":
    check true

