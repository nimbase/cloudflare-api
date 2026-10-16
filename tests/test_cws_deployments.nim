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

suite "cws_deployments serialization":
  test "round-trips CwsCreateDeploymentInputBody":
    let obj = newCwsCreateDeploymentInputBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsCreateDeploymentInputBody)) == openjson.toJson(obj)

  test "round-trips CwsPageResponseDeployment":
    let obj = newCwsPageResponseDeployment()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsPageResponseDeployment)) == openjson.toJson(obj)

  test "round-trips CwsErrorResponse":
    let obj = newCwsErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsErrorResponse)) == openjson.toJson(obj)

  test "round-trips CwsResponseDeployment":
    let obj = newCwsResponseDeployment()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsResponseDeployment)) == openjson.toJson(obj)

  test "round-trips CwsUpdateDeploymentInputBody":
    let obj = newCwsUpdateDeploymentInputBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsUpdateDeploymentInputBody)) == openjson.toJson(obj)

  test "round-trips CwsResponseDeletedResult":
    let obj = newCwsResponseDeletedResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsResponseDeletedResult)) == openjson.toJson(obj)

suite "cws_deployments endpoints":
  test "GET /accounts/{account_id}/cws/deployments":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCwsDeployments("test", "test", 1, orderName, directionAsc, "test")

  test "POST /accounts/{account_id}/cws/deployments":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCwsDeployments("test", newCwsCreateDeploymentInputBody())

  test "GET /accounts/{account_id}/cws/deployments/{deployment_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCwsDeploymentsDeploymentId("test", "test")

  test "PUT /accounts/{account_id}/cws/deployments/{deployment_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdCwsDeploymentsDeploymentId("test", "test", newCwsUpdateDeploymentInputBody())

  test "DELETE /accounts/{account_id}/cws/deployments/{deployment_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCwsDeploymentsDeploymentId("test", "test")

