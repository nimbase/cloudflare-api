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

suite "zero_trust_organization serialization":
  test "round-trips AccessSingleResponse":
    let obj = newAccessSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleResponse)) == openjson.toJson(obj)

  test "round-trips AccessMfaPivKeyRequirements":
    let obj = newAccessMfaPivKeyRequirements()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessMfaPivKeyRequirements)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessEmptyResponse":
    let obj = newAccessEmptyResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessEmptyResponse)) == openjson.toJson(obj)

  test "round-trips AccessCustomPages":
    let obj = newAccessCustomPages()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessCustomPages)) == openjson.toJson(obj)

  test "round-trips AccessOrgMfaConfig":
    let obj = newAccessOrgMfaConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessOrgMfaConfig)) == openjson.toJson(obj)

  test "round-trips AccessLoginDesign":
    let obj = newAccessLoginDesign()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessLoginDesign)) == openjson.toJson(obj)

  test "round-trips AccessSingleResponse2":
    let obj = newAccessSingleResponse2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleResponse2)) == openjson.toJson(obj)

suite "zero_trust_organization endpoints":
  test "GET /accounts/{account_id}/access/organizations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessOrganizations("test")

  test "GET /accounts/{account_id}/access/organizations/doh":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessOrganizationsDoh("test")

