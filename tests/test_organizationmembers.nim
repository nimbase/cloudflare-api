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
  test "round-trips OrganizationsApiBatchCreateMembersRequest":
    let obj = newOrganizationsApiBatchCreateMembersRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiBatchCreateMembersRequest)) == openjson.toJson(obj)

  test "round-trips OrganizationsApiCreateMemberRequest":
    let obj = newOrganizationsApiCreateMemberRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiCreateMemberRequest)) == openjson.toJson(obj)

  test "round-trips OrganizationsApiMember":
    let obj = newOrganizationsApiMember()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiMember)) == openjson.toJson(obj)

  test "round-trips OrganizationsApiV4ErrorResponse":
    let obj = newOrganizationsApiV4ErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiV4ErrorResponse)) == openjson.toJson(obj)

  test "round-trips OrganizationsApiV4Message":
    let obj = newOrganizationsApiV4Message()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiV4Message)) == openjson.toJson(obj)

  test "round-trips OrganizationsApiPageTokenResultInfo":
    let obj = newOrganizationsApiPageTokenResultInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiPageTokenResultInfo)) == openjson.toJson(obj)

  test "round-trips GetOrganizationsOrganizationIdMembersResponse":
    let obj = cloudflare.GetOrganizationsOrganizationIdMembersResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetOrganizationsOrganizationIdMembersResponse)) == openjson.toJson(obj)

  test "round-trips PostOrganizationsOrganizationIdMembersResponse":
    let obj = cloudflare.PostOrganizationsOrganizationIdMembersResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostOrganizationsOrganizationIdMembersResponse)) == openjson.toJson(obj)

  test "round-trips GetOrganizationsOrganizationIdMembersMemberIdResponse":
    let obj = cloudflare.GetOrganizationsOrganizationIdMembersMemberIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetOrganizationsOrganizationIdMembersMemberIdResponse)) == openjson.toJson(obj)

  test "round-trips PostOrganizationsOrganizationIdMembersBatchCreateResponse":
    let obj = cloudflare.PostOrganizationsOrganizationIdMembersBatchCreateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostOrganizationsOrganizationIdMembersBatchCreateResponse)) == openjson.toJson(obj)

suite "organizationmembers endpoints":
  test "POST /organizations/{organization_id}/members":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postOrganizationsOrganizationIdMembers("test", newOrganizationsApiCreateMemberRequest())

  test "GET /organizations/{organization_id}/members/{member_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getOrganizationsOrganizationIdMembersMemberId("test", "test")

  test "POST /organizations/{organization_id}/members:batchCreate":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postOrganizationsOrganizationIdMembersBatchCreate("test", newOrganizationsApiBatchCreateMembersRequest())

