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

suite "radar_search serialization":
  test "round-trips GetRadarSearchGlobalResponse":
    let obj = cloudflare.GetRadarSearchGlobalResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetRadarSearchGlobalResponse)) == openjson.toJson(obj)

suite "radar_search endpoints":
  test "module has no sampleable endpoints":
    check true

