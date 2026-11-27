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

suite "organizationmembers serialization":
  test "round-trips OrganizationsV4ErrorResponse":
    let obj = newOrganizationsV4ErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsV4ErrorResponse)) == openjson.toJson(obj)

  test "round-trips OrganizationsV4Message":
    let obj = newOrganizationsV4Message()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsV4Message)) == openjson.toJson(obj)

  test "round-trips OrganizationsDeleteOrganizationMemberResult":
    let obj = newOrganizationsDeleteOrganizationMemberResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsDeleteOrganizationMemberResult)) == openjson.toJson(obj)

  test "round-trips OrganizationsPageTokenResultInfo":
    let obj = newOrganizationsPageTokenResultInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsPageTokenResultInfo)) == openjson.toJson(obj)

  test "round-trips OrganizationsMember":
    let obj = newOrganizationsMember()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsMember)) == openjson.toJson(obj)

  test "round-trips OrganizationsCreateMemberRequest":
    let obj = newOrganizationsCreateMemberRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsCreateMemberRequest)) == openjson.toJson(obj)

  test "round-trips OrganizationsBatchCreateMembersRequest":
    let obj = newOrganizationsBatchCreateMembersRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsBatchCreateMembersRequest)) == openjson.toJson(obj)

  test "round-trips GetOrganizationsOrganizationIdMembersResponse":
    let obj = cloudflare.GetOrganizationsOrganizationIdMembersResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetOrganizationsOrganizationIdMembersResponse)) == openjson.toJson(obj)

  test "round-trips PostOrganizationsOrganizationIdMembersResponse":
    let obj = cloudflare.PostOrganizationsOrganizationIdMembersResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostOrganizationsOrganizationIdMembersResponse)) == openjson.toJson(obj)

  test "round-trips GetOrganizationsOrganizationIdMembersMemberIdResponse":
    let obj = cloudflare.GetOrganizationsOrganizationIdMembersMemberIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetOrganizationsOrganizationIdMembersMemberIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteOrganizationsOrganizationIdMembersMemberIdResponse":
    let obj = cloudflare.DeleteOrganizationsOrganizationIdMembersMemberIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteOrganizationsOrganizationIdMembersMemberIdResponse)) == openjson.toJson(obj)

  test "round-trips PostOrganizationsOrganizationIdMembersBatchCreateResponse":
    let obj = cloudflare.PostOrganizationsOrganizationIdMembersBatchCreateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostOrganizationsOrganizationIdMembersBatchCreateResponse)) == openjson.toJson(obj)

suite "organizationmembers endpoints":
  test "POST /organizations/{organization_id}/members":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postOrganizationsOrganizationIdMembers("test", newOrganizationsCreateMemberRequest())

  test "GET /organizations/{organization_id}/members/{member_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getOrganizationsOrganizationIdMembersMemberId("test", "test")

  test "DELETE /organizations/{organization_id}/members/{member_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteOrganizationsOrganizationIdMembersMemberId("test", "test")

  test "POST /organizations/{organization_id}/members:batchCreate":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postOrganizationsOrganizationIdMembersBatchCreate("test", newOrganizationsBatchCreateMembersRequest())

