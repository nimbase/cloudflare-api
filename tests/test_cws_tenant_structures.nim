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

suite "cws_tenant_structures serialization":
  test "round-trips CwsBatchTenantNodesInputBody":
    let obj = newCwsBatchTenantNodesInputBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsBatchTenantNodesInputBody)) == openjson.toJson(obj)

  test "round-trips CwsPageResponseTenantStructure":
    let obj = newCwsPageResponseTenantStructure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsPageResponseTenantStructure)) == openjson.toJson(obj)

  test "round-trips CwsPageResponseTenantStructureNode":
    let obj = newCwsPageResponseTenantStructureNode()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsPageResponseTenantStructureNode)) == openjson.toJson(obj)

  test "round-trips CwsUpdateTenantStructureInputBody":
    let obj = newCwsUpdateTenantStructureInputBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsUpdateTenantStructureInputBody)) == openjson.toJson(obj)

  test "round-trips CwsResponseTenantStructure":
    let obj = newCwsResponseTenantStructure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsResponseTenantStructure)) == openjson.toJson(obj)

  test "round-trips CwsCreateTenantStructureInputBody":
    let obj = newCwsCreateTenantStructureInputBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsCreateTenantStructureInputBody)) == openjson.toJson(obj)

  test "round-trips CwsTenantNodeBody":
    let obj = newCwsTenantNodeBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsTenantNodeBody)) == openjson.toJson(obj)

  test "round-trips CwsResponseTenantStructureNode":
    let obj = newCwsResponseTenantStructureNode()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsResponseTenantStructureNode)) == openjson.toJson(obj)

  test "round-trips CwsResponseTenantNodeBatchResult":
    let obj = newCwsResponseTenantNodeBatchResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsResponseTenantNodeBatchResult)) == openjson.toJson(obj)

  test "round-trips CwsErrorResponse":
    let obj = newCwsErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsErrorResponse)) == openjson.toJson(obj)

  test "round-trips CwsResponseDeletedResult":
    let obj = newCwsResponseDeletedResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CwsResponseDeletedResult)) == openjson.toJson(obj)

suite "cws_tenant_structures endpoints":
  test "GET /accounts/{account_id}/cws/tenant-structures":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCwsTenantStructures("test", "test", 1, orderName, directionAsc, "test", "test")

  test "POST /accounts/{account_id}/cws/tenant-structures":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCwsTenantStructures("test", newCwsCreateTenantStructureInputBody())

  test "GET /accounts/{account_id}/cws/tenant-structures/{structure_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCwsTenantStructuresStructureId("test", "test")

  test "PUT /accounts/{account_id}/cws/tenant-structures/{structure_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdCwsTenantStructuresStructureId("test", "test", newCwsUpdateTenantStructureInputBody())

  test "DELETE /accounts/{account_id}/cws/tenant-structures/{structure_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCwsTenantStructuresStructureId("test", "test")

  test "GET /accounts/{account_id}/cws/tenant-structures/{structure_id}/nodes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCwsTenantStructuresStructureIdNodes("test", "test", "test", 1, orderName, directionAsc, "test", "test", "test", "test")

  test "POST /accounts/{account_id}/cws/tenant-structures/{structure_id}/nodes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCwsTenantStructuresStructureIdNodes("test", "test", newCwsTenantNodeBody())

  test "POST /accounts/{account_id}/cws/tenant-structures/{structure_id}/nodes/batch":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCwsTenantStructuresStructureIdNodesBatch("test", "test", newCwsBatchTenantNodesInputBody())

  test "GET /accounts/{account_id}/cws/tenant-structures/{structure_id}/nodes/{node_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCwsTenantStructuresStructureIdNodesNodeId("test", "test", "test")

  test "PUT /accounts/{account_id}/cws/tenant-structures/{structure_id}/nodes/{node_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdCwsTenantStructuresStructureIdNodesNodeId("test", "test", "test", newCwsTenantNodeBody())

  test "DELETE /accounts/{account_id}/cws/tenant-structures/{structure_id}/nodes/{node_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCwsTenantStructuresStructureIdNodesNodeId("test", "test", "test")

