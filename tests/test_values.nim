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

suite "values serialization":
  test "round-trips WorkersObservabilityFilterNode":
    let obj = newWorkersObservabilityFilterNode()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersObservabilityFilterNode)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdWorkersObservabilityTelemetryValuesResponse":
    let obj = cloudflare.PostAccountsAccountIdWorkersObservabilityTelemetryValuesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdWorkersObservabilityTelemetryValuesResponse)) == openjson.toJson(obj)

suite "values endpoints":
  test "module has no sampleable endpoints":
    check true

