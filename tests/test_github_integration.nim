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

suite "github_integration serialization":
  test "round-trips BuildsConfigAutofillResponse":
    let obj = newBuildsConfigAutofillResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsConfigAutofillResponse)) == openjson.toJson(obj)

  test "round-trips BuildsErrorResponse":
    let obj = newBuildsErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsErrorResponse)) == openjson.toJson(obj)

  test "round-trips BuildsAPIResponse":
    let obj = newBuildsAPIResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsAPIResponse)) == openjson.toJson(obj)

suite "github_integration endpoints":
  test "module has no sampleable endpoints":
    check true

