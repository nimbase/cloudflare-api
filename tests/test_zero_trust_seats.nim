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

suite "zero_trust_seats serialization":
  test "round-trips AccessIdentifier2":
    let obj = newAccessIdentifier2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessIdentifier2)) == openjson.toJson(obj)

  test "round-trips AccessResponseCollection13":
    let obj = newAccessResponseCollection13()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollection13)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

suite "zero_trust_seats endpoints":
  test "module has no sampleable endpoints":
    check true

