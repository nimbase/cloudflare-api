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

suite "domain_search serialization":
  test "round-trips BrandProtectionApiQueryBulk":
    let obj = newBrandProtectionApiQueryBulk()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BrandProtectionApiQueryBulk)) == openjson.toJson(obj)

  test "round-trips BrandProtectionApiQuery":
    let obj = newBrandProtectionApiQuery()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BrandProtectionApiQuery)) == openjson.toJson(obj)

  test "round-trips BrandProtectionApiQueryMatch":
    let obj = newBrandProtectionApiQueryMatch()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BrandProtectionApiQueryMatch)) == openjson.toJson(obj)

  test "round-trips BrandProtectionApiError":
    let obj = newBrandProtectionApiError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BrandProtectionApiError)) == openjson.toJson(obj)

suite "domain_search endpoints":
  test "GET /accounts/{account_id}/brand-protection/matches":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrandProtectionMatches("test", 1, 1, true, true)

  test "GET /accounts/{account_id}/brand-protection/matches/download":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrandProtectionMatchesDownload("test", 1, 1, true, true)

  test "GET /accounts/{account_id}/brand-protection/queries":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrandProtectionQueries()

  test "POST /accounts/{account_id}/brand-protection/queries":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdBrandProtectionQueries("test", "test", true, newBrandProtectionApiQuery())

  test "DELETE /accounts/{account_id}/brand-protection/queries":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdBrandProtectionQueries("test", "test", true)

  test "POST /accounts/{account_id}/brand-protection/queries/bulk":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdBrandProtectionQueriesBulk(newBrandProtectionApiQueryBulk())

  test "POST /accounts/{account_id}/brand-protection/queries/{query_id}/matches/{domain_id}/dismiss":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdBrandProtectionQueriesQueryIdMatchesDomainIdDismiss()

  test "POST /accounts/{account_id}/brand-protection/queries/{query_id}/matches/{domain_id}/undismiss":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdBrandProtectionQueriesQueryIdMatchesDomainIdUndismiss()

  test "POST /accounts/{account_id}/brand-protection/search":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdBrandProtectionSearch()

  test "GET /accounts/{account_id}/brand-protection/total-queries":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrandProtectionTotalQueries()

