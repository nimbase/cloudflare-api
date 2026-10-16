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

suite "cws_domain_acls serialization":
  test "round-trips CwsUpdateDomainACLInputBody":
    let obj = newCwsUpdateDomainACLInputBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsUpdateDomainACLInputBody)) == openjson.toJson(obj)

  test "round-trips CwsCreateDomainACLInputBody":
    let obj = newCwsCreateDomainACLInputBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsCreateDomainACLInputBody)) == openjson.toJson(obj)

  test "round-trips CwsPageResponseDomainACL":
    let obj = newCwsPageResponseDomainACL()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsPageResponseDomainACL)) == openjson.toJson(obj)

  test "round-trips CwsErrorResponse":
    let obj = newCwsErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsErrorResponse)) == openjson.toJson(obj)

  test "round-trips CwsResponseDomainACL":
    let obj = newCwsResponseDomainACL()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsResponseDomainACL)) == openjson.toJson(obj)

  test "round-trips CwsResponseDeletedResult":
    let obj = newCwsResponseDeletedResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsResponseDeletedResult)) == openjson.toJson(obj)

suite "cws_domain_acls endpoints":
  test "GET /accounts/{account_id}/cws/domain-acls":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCwsDomainAcls("test", "test", 1, orderName, directionAsc, "test", "test")

  test "POST /accounts/{account_id}/cws/domain-acls":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCwsDomainAcls("test", newCwsCreateDomainACLInputBody())

  test "GET /accounts/{account_id}/cws/domain-acls/{domain_acl_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCwsDomainAclsDomainAclId("test", "test")

  test "PUT /accounts/{account_id}/cws/domain-acls/{domain_acl_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdCwsDomainAclsDomainAclId("test", "test", newCwsUpdateDomainACLInputBody())

  test "DELETE /accounts/{account_id}/cws/domain-acls/{domain_acl_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCwsDomainAclsDomainAclId("test", "test")

