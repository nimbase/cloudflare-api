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

suite "pages_project serialization":
  test "round-trips PagesApiResponseCollection":
    let obj = newPagesApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips PagesApiResponseCommonFailure":
    let obj = newPagesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips PagesProject":
    let obj = newPagesProject()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesProject)) == openjson.toJson(obj)

  test "round-trips PagesPagesUploadTokenResponse":
    let obj = newPagesPagesUploadTokenResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesPagesUploadTokenResponse)) == openjson.toJson(obj)

  test "round-trips PagesApiResponseCommon":
    let obj = newPagesApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips PagesSource":
    let obj = newPagesSource()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesSource)) == openjson.toJson(obj)

  test "round-trips PagesDeploymentConfigValuesRequest":
    let obj = newPagesDeploymentConfigValuesRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesDeploymentConfigValuesRequest)) == openjson.toJson(obj)

suite "pages_project endpoints":
  test "GET /accounts/{account_id}/pages/projects":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPagesProjects("test", 1, 1)

  test "GET /accounts/{account_id}/pages/projects/{project_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPagesProjectsProjectName("test", "test")

  test "DELETE /accounts/{account_id}/pages/projects/{project_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdPagesProjectsProjectName("test", "test")

  test "POST /accounts/{account_id}/pages/projects/{project_name}/source":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdPagesProjectsProjectNameSource("test", "test", newPagesSource())

  test "DELETE /accounts/{account_id}/pages/projects/{project_name}/source":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdPagesProjectsProjectNameSource("test", "test")

  test "GET /accounts/{account_id}/pages/projects/{project_name}/upload-token":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPagesProjectsProjectNameUploadToken("test", "test")

