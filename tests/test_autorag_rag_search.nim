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

suite "autorag_rag_search serialization":
  test "round-trips PostAccountsAccountIdAutoragRagsIdAiSearchResponse":
    let obj = cloudflare.PostAccountsAccountIdAutoragRagsIdAiSearchResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAutoragRagsIdAiSearchResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAutoragRagsIdSearchResponse":
    let obj = cloudflare.PostAccountsAccountIdAutoragRagsIdSearchResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAutoragRagsIdSearchResponse)) == openjson.toJson(obj)

suite "autorag_rag_search endpoints":
  test "module has no sampleable endpoints":
    check true

