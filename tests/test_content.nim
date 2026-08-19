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

suite "content serialization":
  test "round-trips PostureApiPaginatedContentAssetList":
    let obj = newPostureApiPaginatedContentAssetList()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiPaginatedContentAssetList)) == openjson.toJson(obj)

  test "round-trips PostureApiApiResponseCommon":
    let obj = newPostureApiApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiApiResponseCommon)) == openjson.toJson(obj)

suite "content endpoints":
  test "module has no sampleable endpoints":
    check true

