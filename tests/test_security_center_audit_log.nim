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

suite "security_center_audit_log serialization":
  test "round-trips SecurityCenterApiResponseCommonFailure":
    let obj = newSecurityCenterApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecurityCenterApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips SecurityCenterAuditLogResponse":
    let obj = newSecurityCenterAuditLogResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecurityCenterAuditLogResponse)) == openjson.toJson(obj)

suite "security_center_audit_log endpoints":
  test "GET /accounts/{account_id}/security-center/insights/audit-log":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSecurityCenterInsightsAuditLog("test", 1, "test", {}, "test", "test", "test", {})

  test "GET /accounts/{account_id}/security-center/insights/{issue_id}/audit-log":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSecurityCenterInsightsIssueIdAuditLog("test", "test", 1, "test", {}, "test", "test", "test", {})

  test "GET /zones/{zone_id}/security-center/insights/audit-log":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSecurityCenterInsightsAuditLog("test", 1, "test", {}, "test", "test", "test", {})

  test "GET /zones/{zone_id}/security-center/insights/{issue_id}/audit-log":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSecurityCenterInsightsIssueIdAuditLog("test", "test", 1, "test", {}, "test", "test", "test", {})

