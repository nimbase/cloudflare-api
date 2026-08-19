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

suite "accounts serialization":
  test "round-trips OrganizationsApiOrganization":
    let obj = newOrganizationsApiOrganization()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiOrganization)) == openjson.toJson(obj)

  test "round-trips IamResponseCollectionAccounts":
    let obj = newIamResponseCollectionAccounts()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamResponseCollectionAccounts)) == openjson.toJson(obj)

  test "round-trips IamApiResponseSingleId":
    let obj = newIamApiResponseSingleId()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseSingleId)) == openjson.toJson(obj)

  test "round-trips IamAccountIdentifier":
    let obj = newIamAccountIdentifier()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamAccountIdentifier)) == openjson.toJson(obj)

  test "round-trips IamCreateAccount":
    let obj = newIamCreateAccount()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamCreateAccount)) == openjson.toJson(obj)

  test "round-trips OrganizationsApiProfile":
    let obj = newOrganizationsApiProfile()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiProfile)) == openjson.toJson(obj)

  test "round-trips IamApiResponseCommonFailure":
    let obj = newIamApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips OrganizationsApiV4ErrorResponse":
    let obj = newOrganizationsApiV4ErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiV4ErrorResponse)) == openjson.toJson(obj)

  test "round-trips IamComponentsSchemasAccount":
    let obj = newIamComponentsSchemasAccount()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamComponentsSchemasAccount)) == openjson.toJson(obj)

  test "round-trips OrganizationsApiV4Message":
    let obj = newOrganizationsApiV4Message()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiV4Message)) == openjson.toJson(obj)

  test "round-trips IamResponseSingleAccount":
    let obj = newIamResponseSingleAccount()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamResponseSingleAccount)) == openjson.toJson(obj)

  test "round-trips OrganizationsApiMoveAccountResponse":
    let obj = newOrganizationsApiMoveAccountResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiMoveAccountResponse)) == openjson.toJson(obj)

  test "round-trips OrganizationsApiBatchAccountMoveResponse":
    let obj = newOrganizationsApiBatchAccountMoveResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OrganizationsApiBatchAccountMoveResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsMoveResponse":
    let obj = cloudflare.PostAccountsMoveResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsMoveResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdMoveResponse":
    let obj = cloudflare.PostAccountsAccountIdMoveResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdMoveResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdOrganizationsResponse":
    let obj = cloudflare.GetAccountsAccountIdOrganizationsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdOrganizationsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdProfileResponse":
    let obj = cloudflare.GetAccountsAccountIdProfileResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdProfileResponse)) == openjson.toJson(obj)

suite "accounts endpoints":
  test "GET /accounts":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccounts("test", 1.0, 1.0, {})

  test "POST /accounts":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccounts(newIamCreateAccount())

  test "GET /accounts/{account_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountId(newIamAccountIdentifier())

  test "PUT /accounts/{account_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountId(newIamAccountIdentifier(), newIamComponentsSchemasAccount())

  test "DELETE /accounts/{account_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountId("test")

  test "GET /accounts/{account_id}/organizations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdOrganizations("test")

  test "GET /accounts/{account_id}/profile":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdProfile("test")

  test "PUT /accounts/{account_id}/profile":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdProfile("test", newOrganizationsApiProfile())

