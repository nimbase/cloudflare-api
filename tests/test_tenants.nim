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

suite "tenants serialization":
  test "round-trips OrganizationsApiV4ErrorResponse":
    let obj = newOrganizationsApiV4ErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiV4ErrorResponse)) == openjson.toJson(obj)

  test "round-trips OrganizationsApiAccountListResultInfo":
    let obj = newOrganizationsApiAccountListResultInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiAccountListResultInfo)) == openjson.toJson(obj)

  test "round-trips OrganizationsApiLegacyAccount":
    let obj = newOrganizationsApiLegacyAccount()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiLegacyAccount)) == openjson.toJson(obj)

  test "round-trips OrganizationsApiV4Message":
    let obj = newOrganizationsApiV4Message()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiV4Message)) == openjson.toJson(obj)

  test "round-trips GetTenantsTenantIdAccountsResponse":
    let obj = cloudflare.GetTenantsTenantIdAccountsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetTenantsTenantIdAccountsResponse)) == openjson.toJson(obj)

suite "tenants endpoints":
  test "GET /tenants/{tenant_id}/accounts":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getTenantsTenantIdAccounts("test", "test", "test", "test", "test", "test", "test", "test", "test", statusActive, orderByAccountName, directionAsc, true, 1, 1, "test", 1)

