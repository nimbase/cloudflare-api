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

suite "email_for_platforms serialization":
  test "round-trips EmailEmailDomainErrorResponse":
    let obj = newEmailEmailDomainErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailEmailDomainErrorResponse)) == openjson.toJson(obj)

  test "round-trips EmailEmailDomainChangeCollectionResponse":
    let obj = newEmailEmailDomainChangeCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailEmailDomainChangeCollectionResponse)) == openjson.toJson(obj)

  test "round-trips EmailEmailDomainCollectionResponse":
    let obj = newEmailEmailDomainCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailEmailDomainCollectionResponse)) == openjson.toJson(obj)

  test "round-trips EmailEmailDomainResponse":
    let obj = newEmailEmailDomainResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailEmailDomainResponse)) == openjson.toJson(obj)

  test "round-trips EmailEmailDomainCreate":
    let obj = newEmailEmailDomainCreate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailEmailDomainCreate)) == openjson.toJson(obj)

suite "email_for_platforms endpoints":
  test "GET /accounts/{account_id}/email/domain-changes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailDomainChanges("test", 1, "test", "test")

  test "GET /accounts/{account_id}/email/domains":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailDomains("test", 1, "test", "test", includeDnsRecords)

  test "POST /accounts/{account_id}/email/domains":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdEmailDomains("test", newEmailEmailDomainCreate())

  test "GET /accounts/{account_id}/email/domains/{email_domain_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailDomainsEmailDomainId("test", "test")

  test "DELETE /accounts/{account_id}/email/domains/{email_domain_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdEmailDomainsEmailDomainId("test", "test")

  test "POST /accounts/{account_id}/email/domains/{email_domain_id}/verify":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdEmailDomainsEmailDomainIdVerify("test", "test")

