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

suite "account_members serialization":
  test "round-trips IamCollectionMemberResponseWithPolicies":
    let obj = newIamCollectionMemberResponseWithPolicies()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamCollectionMemberResponseWithPolicies)) == openjson.toJson(obj)

  test "round-trips IamSingleMemberResponseWithPolicies":
    let obj = newIamSingleMemberResponseWithPolicies()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamSingleMemberResponseWithPolicies)) == openjson.toJson(obj)

  test "round-trips IamApiResponseSingleId":
    let obj = newIamApiResponseSingleId()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseSingleId)) == openjson.toJson(obj)

  test "round-trips IamAccountIdentifier":
    let obj = newIamAccountIdentifier()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamAccountIdentifier)) == openjson.toJson(obj)

  test "round-trips IamApiResponseCommonFailure":
    let obj = newIamApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseCommonFailure)) == openjson.toJson(obj)

suite "account_members endpoints":
  test "GET /accounts/{account_id}/members":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMembers(newIamAccountIdentifier(), {}, {}, 1.0, 1.0, {})

  test "POST /accounts/{account_id}/members":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMembers(newIamAccountIdentifier())

  test "GET /accounts/{account_id}/members/{member_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMembersMemberId("test", newIamAccountIdentifier())

  test "PUT /accounts/{account_id}/members/{member_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMembersMemberId("test", newIamAccountIdentifier())

  test "DELETE /accounts/{account_id}/members/{member_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMembersMemberId("test", newIamAccountIdentifier())

