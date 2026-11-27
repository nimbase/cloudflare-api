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

suite "user serialization":
  test "round-trips IamSingleUserResponse":
    let obj = newIamSingleUserResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamSingleUserResponse)) == openjson.toJson(obj)

  test "round-trips OrganizationsV4ErrorResponse":
    let obj = newOrganizationsV4ErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsV4ErrorResponse)) == openjson.toJson(obj)

  test "round-trips OrganizationsV4Message":
    let obj = newOrganizationsV4Message()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsV4Message)) == openjson.toJson(obj)

  test "round-trips IamApiResponseCommonFailure":
    let obj = newIamApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips OrganizationsLegacyTenant":
    let obj = newOrganizationsLegacyTenant()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsLegacyTenant)) == openjson.toJson(obj)

  test "round-trips GetUserTenantsResponse":
    let obj = cloudflare.GetUserTenantsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetUserTenantsResponse)) == openjson.toJson(obj)

suite "user endpoints":
  test "GET /user":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUser()

  test "GET /user/tenants":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUserTenants()

