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

suite "secondary_dns_acl serialization":
  test "round-trips SecondaryDnsSingleResponse3":
    let obj = newSecondaryDnsSingleResponse3()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsSingleResponse3)) == openjson.toJson(obj)

  test "round-trips SecondaryDnsAcl":
    let obj = newSecondaryDnsAcl()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsAcl)) == openjson.toJson(obj)

  test "round-trips SecondaryDnsApiResponseCommonFailure":
    let obj = newSecondaryDnsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips SecondaryDnsResponseCollection3":
    let obj = newSecondaryDnsResponseCollection3()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsResponseCollection3)) == openjson.toJson(obj)

  test "round-trips SecondaryDnsIdResponse3":
    let obj = newSecondaryDnsIdResponse3()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecondaryDnsIdResponse3)) == openjson.toJson(obj)

suite "secondary_dns_acl endpoints":
  test "GET /accounts/{account_id}/secondary_dns/acls":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSecondaryDnsAcls("test")

  test "GET /accounts/{account_id}/secondary_dns/acls/{acl_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSecondaryDnsAclsAclId("test", "test")

  test "PUT /accounts/{account_id}/secondary_dns/acls/{acl_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdSecondaryDnsAclsAclId("test", "test", newSecondaryDnsAcl())

  test "DELETE /accounts/{account_id}/secondary_dns/acls/{acl_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdSecondaryDnsAclsAclId("test", "test")

