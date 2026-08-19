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

suite "user_s_invites serialization":
  test "round-trips IamSingleInviteResponse":
    let obj = newIamSingleInviteResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamSingleInviteResponse)) == openjson.toJson(obj)

  test "round-trips IamSchemasCollectionInviteResponse":
    let obj = newIamSchemasCollectionInviteResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamSchemasCollectionInviteResponse)) == openjson.toJson(obj)

  test "round-trips IamApiResponseCommonFailure":
    let obj = newIamApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseCommonFailure)) == openjson.toJson(obj)

suite "user_s_invites endpoints":
  test "GET /user/invites":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUserInvites()

  test "GET /user/invites/{invite_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUserInvitesInviteId("test")

