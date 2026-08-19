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

suite "pages_deployment serialization":
  test "round-trips PagesApiResponseCollection":
    let obj = newPagesApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips PagesApiResponseCommonFailure":
    let obj = newPagesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips PagesDeployment":
    let obj = newPagesDeployment()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesDeployment)) == openjson.toJson(obj)

  test "round-trips PagesApiResponseCommon":
    let obj = newPagesApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips PagesTail":
    let obj = newPagesTail()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesTail)) == openjson.toJson(obj)

  test "round-trips PagesDeploymentLog":
    let obj = newPagesDeploymentLog()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesDeploymentLog)) == openjson.toJson(obj)

suite "pages_deployment endpoints":
  test "GET /accounts/{account_id}/pages/projects/{project_name}/deployments":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPagesProjectsProjectNameDeployments("test", "test", {}, 1, 1)

  test "POST /accounts/{account_id}/pages/projects/{project_name}/deployments":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdPagesProjectsProjectNameDeployments("test", "test")

  test "GET /accounts/{account_id}/pages/projects/{project_name}/deployments/{deployment_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPagesProjectsProjectNameDeploymentsDeploymentId("test", "test", "test")

  test "DELETE /accounts/{account_id}/pages/projects/{project_name}/deployments/{deployment_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdPagesProjectsProjectNameDeploymentsDeploymentId("test", "test", "test", true)

  test "GET /accounts/{account_id}/pages/projects/{project_name}/deployments/{deployment_id}/history/logs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPagesProjectsProjectNameDeploymentsDeploymentIdHistoryLogs("test", "test", "test")

  test "POST /accounts/{account_id}/pages/projects/{project_name}/deployments/{deployment_id}/retry":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdPagesProjectsProjectNameDeploymentsDeploymentIdRetry("test", "test", "test")

  test "POST /accounts/{account_id}/pages/projects/{project_name}/deployments/{deployment_id}/rollback":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdPagesProjectsProjectNameDeploymentsDeploymentIdRollback("test", "test", "test")

  test "DELETE /accounts/{account_id}/pages/projects/{project_name}/deployments/{deployment_id}/tails/{tail_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdPagesProjectsProjectNameDeploymentsDeploymentIdTailsTailId("test", "test", "test", "test")

