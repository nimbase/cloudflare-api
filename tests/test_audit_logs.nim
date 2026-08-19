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

suite "audit_logs serialization":
  test "round-trips AaaAuditLogsV2HistoryNotFound":
    let obj = newAaaAuditLogsV2HistoryNotFound()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaAuditLogsV2HistoryNotFound)) == openjson.toJson(obj)

  test "round-trips AaaAuditLogsV2HistoryResponseCollection":
    let obj = newAaaAuditLogsV2HistoryResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaAuditLogsV2HistoryResponseCollection)) == openjson.toJson(obj)

  test "round-trips AaaApiResponseCommonFailure":
    let obj = newAaaApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AaaAuditLogsV2OrgResponseCollection":
    let obj = newAaaAuditLogsV2OrgResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaAuditLogsV2OrgResponseCollection)) == openjson.toJson(obj)

  test "round-trips AaaAuditLogsV2ResponseCollection":
    let obj = newAaaAuditLogsV2ResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaAuditLogsV2ResponseCollection)) == openjson.toJson(obj)

  test "round-trips AaaAuditLogsV2ProductCategoriesResponseCollection":
    let obj = newAaaAuditLogsV2ProductCategoriesResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaAuditLogsV2ProductCategoriesResponseCollection)) == openjson.toJson(obj)

  test "round-trips AaaAuditLogsResponseCollection2":
    let obj = newAaaAuditLogsResponseCollection2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaAuditLogsResponseCollection2)) == openjson.toJson(obj)

  test "round-trips AaaApiResponseCommonFailure2":
    let obj = newAaaApiResponseCommonFailure2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaApiResponseCommonFailure2)) == openjson.toJson(obj)

  test "round-trips AaaAuditLogsV2OrgHistoryResponseCollection":
    let obj = newAaaAuditLogsV2OrgHistoryResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AaaAuditLogsV2OrgHistoryResponseCollection)) == openjson.toJson(obj)

suite "audit_logs endpoints":
  test "GET /accounts/{account_id}/audit_logs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAuditLogs("test", "test", true, "test", "test", "test", openjson.newJObject(), openjson.newJObject(), "test", {}, 1.0, 1.0, true)

  test "GET /accounts/{account_id}/logs/audit/product_categories":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLogsAuditProductCategories("test")

  test "GET /accounts/{account_id}/logs/audit/{id}/history":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdLogsAuditIdHistory("test", "test", "test", "test", "test", {}, 1.0, "test")

  test "GET /organizations/{organization_id}/logs/audit/{id}/history":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getOrganizationsOrganizationIdLogsAuditIdHistory("test", "test", "test", "test", "test", {}, 1.0, "test")

  test "GET /user/audit_logs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUserAuditLogs("test", true, "test", "test", "test", openjson.newJObject(), openjson.newJObject(), "test", {}, 1.0, 1.0, true)

