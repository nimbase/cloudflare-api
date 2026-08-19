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

suite "organizations serialization":
  test "round-trips OrganizationsApiOrganization":
    let obj = newOrganizationsApiOrganization()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiOrganization)) == openjson.toJson(obj)

  test "round-trips OrganizationsApiProfileResponse":
    let obj = newOrganizationsApiProfileResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiProfileResponse)) == openjson.toJson(obj)

  test "round-trips OrganizationsApiAccount":
    let obj = newOrganizationsApiAccount()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiAccount)) == openjson.toJson(obj)

  test "round-trips OrganizationsApiDeleteOrganizationResponse":
    let obj = newOrganizationsApiDeleteOrganizationResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiDeleteOrganizationResponse)) == openjson.toJson(obj)

  test "round-trips OrganizationsApiProfile":
    let obj = newOrganizationsApiProfile()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiProfile)) == openjson.toJson(obj)

  test "round-trips OrganizationsApiV4ErrorResponse":
    let obj = newOrganizationsApiV4ErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiV4ErrorResponse)) == openjson.toJson(obj)

  test "round-trips OrganizationsApiV4Message":
    let obj = newOrganizationsApiV4Message()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiV4Message)) == openjson.toJson(obj)

  test "round-trips OrganizationsApiPageTokenResultInfo":
    let obj = newOrganizationsApiPageTokenResultInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiPageTokenResultInfo)) == openjson.toJson(obj)

  test "round-trips GetOrganizationsResponse":
    let obj = cloudflare.GetOrganizationsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetOrganizationsResponse)) == openjson.toJson(obj)

  test "round-trips PostOrganizationsResponse":
    let obj = cloudflare.PostOrganizationsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostOrganizationsResponse)) == openjson.toJson(obj)

  test "round-trips GetOrganizationsOrganizationIdResponse":
    let obj = cloudflare.GetOrganizationsOrganizationIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetOrganizationsOrganizationIdResponse)) == openjson.toJson(obj)

  test "round-trips PutOrganizationsOrganizationIdResponse":
    let obj = cloudflare.PutOrganizationsOrganizationIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutOrganizationsOrganizationIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteOrganizationsOrganizationIdResponse":
    let obj = cloudflare.DeleteOrganizationsOrganizationIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteOrganizationsOrganizationIdResponse)) == openjson.toJson(obj)

  test "round-trips GetOrganizationsOrganizationIdAccountsResponse":
    let obj = cloudflare.GetOrganizationsOrganizationIdAccountsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetOrganizationsOrganizationIdAccountsResponse)) == openjson.toJson(obj)

suite "organizations endpoints":
  test "GET /organizations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getOrganizations(@["test"], "test", "test", "test", "test", "test", "test", "test", openjson.newJObject(), "test", 1)

  test "POST /organizations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postOrganizations(newOrganizationsApiOrganization())

  test "GET /organizations/{organization_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getOrganizationsOrganizationId("test")

  test "PUT /organizations/{organization_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putOrganizationsOrganizationId("test", newOrganizationsApiOrganization())

  test "DELETE /organizations/{organization_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteOrganizationsOrganizationId("test")

  test "GET /organizations/{organization_id}/accounts":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getOrganizationsOrganizationIdAccounts("test", "test", "test", "test", "test", "test", "test", "test", "test", {}, {}, "test", 1)

  test "GET /organizations/{organization_id}/profile":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getOrganizationsOrganizationIdProfile("test")

  test "PUT /organizations/{organization_id}/profile":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putOrganizationsOrganizationIdProfile("test", newOrganizationsApiProfile())

