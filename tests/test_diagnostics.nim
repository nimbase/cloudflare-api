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

suite "diagnostics serialization":
  test "round-trips MagicTransitApiResponseCommonFailure":
    let obj = newMagicTransitApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicTransitApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips MagicTransitTracerouteResponseCollection":
    let obj = newMagicTransitTracerouteResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicTransitTracerouteResponseCollection)) == openjson.toJson(obj)

  test "round-trips MagicTransitOptions":
    let obj = newMagicTransitOptions()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicTransitOptions)) == openjson.toJson(obj)

suite "diagnostics endpoints":
  test "module has no sampleable endpoints":
    check true

