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

suite "approvals serialization":
  test "round-trips CloudforceOneRuleApprovalsListResponse":
    let obj = newCloudforceOneRuleApprovalsListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneRuleApprovalsListResponse)) == openjson.toJson(obj)

  test "round-trips CloudforceOneErrorResponse":
    let obj = newCloudforceOneErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneErrorResponse)) == openjson.toJson(obj)

  test "round-trips CloudforceOneResubmitApprovalRequest":
    let obj = newCloudforceOneResubmitApprovalRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneResubmitApprovalRequest)) == openjson.toJson(obj)

  test "round-trips CloudforceOneRuleApprovalDetailResponse":
    let obj = newCloudforceOneRuleApprovalDetailResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneRuleApprovalDetailResponse)) == openjson.toJson(obj)

  test "round-trips CloudforceOneSuccessResponse":
    let obj = newCloudforceOneSuccessResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneSuccessResponse)) == openjson.toJson(obj)

  test "round-trips CloudforceOneResubmitApprovalResponse":
    let obj = newCloudforceOneResubmitApprovalResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudforceOneResubmitApprovalResponse)) == openjson.toJson(obj)

suite "approvals endpoints":
  test "GET /accounts/{account_id}/cloudforce-one/rules/approvals":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneRulesApprovals("test", openjson.newJObject(), {}, 1.0, 1.0, {}, {}, "test")

  test "GET /accounts/{account_id}/cloudforce-one/rules/approvals/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneRulesApprovalsId("test", "test")

  test "POST /accounts/{account_id}/cloudforce-one/rules/approvals/{id}/cancel":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCloudforceOneRulesApprovalsIdCancel("test", "test")

  test "POST /accounts/{account_id}/cloudforce-one/rules/approvals/{id}/resubmit":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdCloudforceOneRulesApprovalsIdResubmit("test", "test", newCloudforceOneResubmitApprovalRequest())

