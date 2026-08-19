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

suite "live_tail serialization":
  test "round-trips WorkersObservabilityFilterNode":
    let obj = newWorkersObservabilityFilterNode()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersObservabilityFilterNode)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdWorkersObservabilityTelemetryLiveTailResponse":
    let obj = cloudflare.PostAccountsAccountIdWorkersObservabilityTelemetryLiveTailResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdWorkersObservabilityTelemetryLiveTailResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdWorkersObservabilityTelemetryLiveTailHeartbeatResponse":
    let obj = cloudflare.PostAccountsAccountIdWorkersObservabilityTelemetryLiveTailHeartbeatResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdWorkersObservabilityTelemetryLiveTailHeartbeatResponse)) == openjson.toJson(obj)

suite "live_tail endpoints":
  test "module has no sampleable endpoints":
    check true

