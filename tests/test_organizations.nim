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
  test "round-trips OrganizationsCreateOrganizationRequest":
    let obj = newOrganizationsCreateOrganizationRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsCreateOrganizationRequest)) == openjson.toJson(obj)

  test "round-trips OrganizationsV4ErrorResponse":
    let obj = newOrganizationsV4ErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsV4ErrorResponse)) == openjson.toJson(obj)

  test "round-trips OrganizationsOrganizationInviteMember":
    let obj = newOrganizationsOrganizationInviteMember()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsOrganizationInviteMember)) == openjson.toJson(obj)

  test "round-trips OrganizationsV4Message":
    let obj = newOrganizationsV4Message()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsV4Message)) == openjson.toJson(obj)

  test "round-trips OrganizationsModifyOrganizationRequest":
    let obj = newOrganizationsModifyOrganizationRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsModifyOrganizationRequest)) == openjson.toJson(obj)

  test "round-trips OrganizationsPageTokenResultInfo":
    let obj = newOrganizationsPageTokenResultInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsPageTokenResultInfo)) == openjson.toJson(obj)

  test "round-trips OrganizationsProfileResponse":
    let obj = newOrganizationsProfileResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsProfileResponse)) == openjson.toJson(obj)

  test "round-trips OrganizationsOrganization":
    let obj = newOrganizationsOrganization()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsOrganization)) == openjson.toJson(obj)

  test "round-trips OrganizationsHandleOrganizationInviteRequest":
    let obj = newOrganizationsHandleOrganizationInviteRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsHandleOrganizationInviteRequest)) == openjson.toJson(obj)

  test "round-trips OrganizationsDeleteOrganizationResult":
    let obj = newOrganizationsDeleteOrganizationResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsDeleteOrganizationResult)) == openjson.toJson(obj)

  test "round-trips OrganizationsModifyProfileRequest":
    let obj = newOrganizationsModifyProfileRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsModifyProfileRequest)) == openjson.toJson(obj)

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

  test "round-trips PutOrganizationsOrganizationIdInvitesMemberCodeResponse":
    let obj = cloudflare.PutOrganizationsOrganizationIdInvitesMemberCodeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutOrganizationsOrganizationIdInvitesMemberCodeResponse)) == openjson.toJson(obj)

suite "organizations endpoints":
  test "GET /organizations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getOrganizations(@["test"], "test", "test", "test", "test", "test", "test", "test", openjson.newJObject(), "test", orderByName, directionAsc, "test", 1)

  test "POST /organizations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postOrganizations(newOrganizationsCreateOrganizationRequest())

  test "GET /organizations/{organization_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getOrganizationsOrganizationId("test")

  test "PUT /organizations/{organization_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putOrganizationsOrganizationId("test", newOrganizationsModifyOrganizationRequest())

  test "DELETE /organizations/{organization_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteOrganizationsOrganizationId("test")

  test "GET /organizations/{organization_id}/accounts":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getOrganizationsOrganizationIdAccounts("test", "test", "test", "test", "test", "test", "test", "test", "test", statusActive, orderByName, directionAsc, true, true, "test", 1)

  test "PUT /organizations/{organization_id}/invites/{member_code}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putOrganizationsOrganizationIdInvitesMemberCode("test", "test", newOrganizationsHandleOrganizationInviteRequest())

  test "GET /organizations/{organization_id}/profile":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getOrganizationsOrganizationIdProfile("test")

  test "PUT /organizations/{organization_id}/profile":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putOrganizationsOrganizationIdProfile("test", newOrganizationsModifyProfileRequest())

