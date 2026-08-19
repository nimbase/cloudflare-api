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

suite "registrar_domains serialization":
  test "round-trips RegistrarApiDomainResponseSingle":
    let obj = newRegistrarApiDomainResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiDomainResponseSingle)) == openjson.toJson(obj)

  test "round-trips RegistrarApiDomainUpdateProperties":
    let obj = newRegistrarApiDomainUpdateProperties()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiDomainUpdateProperties)) == openjson.toJson(obj)

  test "round-trips RegistrarApiApiResponseCommonFailure":
    let obj = newRegistrarApiApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips RegistrarApiDomainResponseCollection":
    let obj = newRegistrarApiDomainResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RegistrarApiDomainResponseCollection)) == openjson.toJson(obj)

suite "registrar_domains endpoints":
  test "GET /accounts/{account_id}/registrar/domains":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarDomains("test")

  test "GET /accounts/{account_id}/registrar/domains/{domain_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRegistrarDomainsDomainName("test", "test")

  test "PUT /accounts/{account_id}/registrar/domains/{domain_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdRegistrarDomainsDomainName("test", "test")

