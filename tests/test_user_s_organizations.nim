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

suite "user_s_organizations serialization":
  test "round-trips IamApiResponseCommonFailure":
    let obj = newIamApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips IamSingleOrganizationResponse":
    let obj = newIamSingleOrganizationResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamSingleOrganizationResponse)) == openjson.toJson(obj)

  test "round-trips IamCollectionOrganizationResponse":
    let obj = newIamCollectionOrganizationResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamCollectionOrganizationResponse)) == openjson.toJson(obj)

  test "round-trips DeleteUserOrganizationsOrganizationIdResponse":
    let obj = cloudflare.DeleteUserOrganizationsOrganizationIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteUserOrganizationsOrganizationIdResponse)) == openjson.toJson(obj)

suite "user_s_organizations endpoints":
  test "GET /user/organizations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUserOrganizations("test", 1.0, 1.0, {}, {}, {}, {})

  test "GET /user/organizations/{organization_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUserOrganizationsOrganizationId("test")

  test "DELETE /user/organizations/{organization_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteUserOrganizationsOrganizationId("test")

