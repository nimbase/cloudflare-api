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

suite "indicators serialization":
  test "round-trips PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorTypesCreateResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorTypesCreateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorTypesCreateResponse)) == openjson.toJson(obj)

suite "indicators endpoints":
  test "module has no sampleable endpoints":
    check true

