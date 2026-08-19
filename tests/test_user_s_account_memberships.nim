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

suite "user_s_account_memberships serialization":
  test "round-trips IamSingleMembershipResponseWithPolicies":
    let obj = newIamSingleMembershipResponseWithPolicies()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamSingleMembershipResponseWithPolicies)) == openjson.toJson(obj)

  test "round-trips IamApiResponseCommonFailure":
    let obj = newIamApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips IamApiResponseSingle":
    let obj = newIamApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseSingle)) == openjson.toJson(obj)

suite "user_s_account_memberships endpoints":
  test "GET /memberships":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getMemberships("test", 1.0, 1.0, {}, {}, "test", {})

  test "GET /memberships/{membership_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getMembershipsMembershipId("test")

  test "DELETE /memberships/{membership_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteMembershipsMembershipId("test")

