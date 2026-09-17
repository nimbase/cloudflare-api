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

suite "dashboard_assets serialization":
  test "round-trips GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdAssetsListResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdAssetsListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdAssetsListResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdAssetsUploadResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdAssetsUploadResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdAssetsUploadResponse)) == openjson.toJson(obj)

suite "dashboard_assets endpoints":
  test "module has no sampleable endpoints":
    check true

