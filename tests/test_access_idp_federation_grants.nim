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

suite "access_idp_federation_grants serialization":
  test "round-trips AccessIdpFederationGrantCreateRequest":
    let obj = newAccessIdpFederationGrantCreateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessIdpFederationGrantCreateRequest)) == openjson.toJson(obj)

  test "round-trips AccessIdpFederationGrantResponse":
    let obj = newAccessIdpFederationGrantResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessIdpFederationGrantResponse)) == openjson.toJson(obj)

  test "round-trips AccessIdpFederationGrantListResponse":
    let obj = newAccessIdpFederationGrantListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessIdpFederationGrantListResponse)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessIdpFederationGrantIdResponse":
    let obj = newAccessIdpFederationGrantIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessIdpFederationGrantIdResponse)) == openjson.toJson(obj)

suite "access_idp_federation_grants endpoints":
  test "GET /accounts/{account_id}/access/idp_federation_grants":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessIdpFederationGrants("test")

  test "POST /accounts/{account_id}/access/idp_federation_grants":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAccessIdpFederationGrants("test", newAccessIdpFederationGrantCreateRequest())

  test "GET /accounts/{account_id}/access/idp_federation_grants/{grant_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessIdpFederationGrantsGrantId("test", "test")

  test "DELETE /accounts/{account_id}/access/idp_federation_grants/{grant_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAccessIdpFederationGrantsGrantId("test", "test")

