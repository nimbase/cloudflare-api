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

suite "threat_intelligence serialization":
  test "round-trips PostAccountsAccountIdCloudforceOneV2SearchResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneV2SearchResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneV2SearchResponse)) == openjson.toJson(obj)

suite "threat_intelligence endpoints":
  test "module has no sampleable endpoints":
    check true

