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

suite "rfi serialization":
  test "round-trips GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneV2RequestsProjectTypeResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneV2RequestsProjectTypeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneV2RequestsProjectTypeResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdResponse":
    let obj = cloudflare.PutAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdResponse)) == openjson.toJson(obj)

suite "rfi endpoints":
  test "module has no sampleable endpoints":
    check true

