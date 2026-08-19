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
  test "round-trips OrganizationsApiTenantMembership":
    let obj = newOrganizationsApiTenantMembership()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiTenantMembership)) == openjson.toJson(obj)

  test "round-trips OrganizationsApiAccount":
    let obj = newOrganizationsApiAccount()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiAccount)) == openjson.toJson(obj)

  test "round-trips OrganizationsApiInnateEntitlements":
    let obj = newOrganizationsApiInnateEntitlements()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiInnateEntitlements)) == openjson.toJson(obj)

  test "round-trips OrganizationsApiV4ErrorResponse":
    let obj = newOrganizationsApiV4ErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiV4ErrorResponse)) == openjson.toJson(obj)

  test "round-trips OrganizationsApiTenant":
    let obj = newOrganizationsApiTenant()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiTenant)) == openjson.toJson(obj)

  test "round-trips OrganizationsApiV4Message":
    let obj = newOrganizationsApiV4Message()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiV4Message)) == openjson.toJson(obj)

  test "round-trips GetTenantsTenantIdResponse":
    let obj = cloudflare.GetTenantsTenantIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetTenantsTenantIdResponse)) == openjson.toJson(obj)

  test "round-trips GetTenantsTenantIdAccountTypesResponse":
    let obj = cloudflare.GetTenantsTenantIdAccountTypesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetTenantsTenantIdAccountTypesResponse)) == openjson.toJson(obj)

  test "round-trips GetTenantsTenantIdAccountsResponse":
    let obj = cloudflare.GetTenantsTenantIdAccountsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetTenantsTenantIdAccountsResponse)) == openjson.toJson(obj)

  test "round-trips GetTenantsTenantIdEntitlementsResponse":
    let obj = cloudflare.GetTenantsTenantIdEntitlementsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetTenantsTenantIdEntitlementsResponse)) == openjson.toJson(obj)

  test "round-trips GetTenantsTenantIdMembershipsResponse":
    let obj = cloudflare.GetTenantsTenantIdMembershipsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetTenantsTenantIdMembershipsResponse)) == openjson.toJson(obj)

suite "tenants endpoints":
  test "GET /tenants/{tenant_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getTenantsTenantId("test")

  test "GET /tenants/{tenant_id}/account_types":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getTenantsTenantIdAccountTypes("test")

  test "GET /tenants/{tenant_id}/accounts":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getTenantsTenantIdAccounts("test")

  test "GET /tenants/{tenant_id}/entitlements":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getTenantsTenantIdEntitlements("test")

  test "GET /tenants/{tenant_id}/memberships":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getTenantsTenantIdMemberships("test")

