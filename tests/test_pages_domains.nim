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

suite "pages_domains serialization":
  test "round-trips PagesApiResponseCollection":
    let obj = newPagesApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips PagesApiResponseCommonFailure":
    let obj = newPagesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips PagesApiResponseCommon":
    let obj = newPagesApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips PagesDomain":
    let obj = newPagesDomain()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesDomain)) == openjson.toJson(obj)

suite "pages_domains endpoints":
  test "GET /accounts/{account_id}/pages/projects/{project_name}/domains":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPagesProjectsProjectNameDomains("test", "test")

  test "GET /accounts/{account_id}/pages/projects/{project_name}/domains/{domain_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPagesProjectsProjectNameDomainsDomainName("test", "test", "test")

  test "DELETE /accounts/{account_id}/pages/projects/{project_name}/domains/{domain_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdPagesProjectsProjectNameDomainsDomainName("test", "test", "test")

  test "PATCH /accounts/{account_id}/pages/projects/{project_name}/domains/{domain_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdPagesProjectsProjectNameDomainsDomainName("test", "test", "test")

