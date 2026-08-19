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

suite "security_center_insights serialization":
  test "round-trips SecurityCenterApiResponseCommonFailure":
    let obj = newSecurityCenterApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecurityCenterApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips SecurityCenterUpdateAccountStateRequest":
    let obj = newSecurityCenterUpdateAccountStateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecurityCenterUpdateAccountStateRequest)) == openjson.toJson(obj)

  test "round-trips SecurityCenterAccountStateResponse":
    let obj = newSecurityCenterAccountStateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecurityCenterAccountStateResponse)) == openjson.toJson(obj)

  test "round-trips SecurityCenterApiResponseCommon":
    let obj = newSecurityCenterApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecurityCenterApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips SecurityCenterUserClassificationUpdate":
    let obj = newSecurityCenterUserClassificationUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecurityCenterUserClassificationUpdate)) == openjson.toJson(obj)

  test "round-trips SecurityCenterApiResponseSingle":
    let obj = newSecurityCenterApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecurityCenterApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips SecurityCenterValueCountsResponse":
    let obj = newSecurityCenterValueCountsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SecurityCenterValueCountsResponse)) == openjson.toJson(obj)

suite "security_center_insights endpoints":
  test "GET /accounts/{account_id}/intel/attack-surface-report/issue-types":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIntelAttackSurfaceReportIssueTypes("test")

  test "PATCH /accounts/{account_id}/security-center/insights/{issue_id}/classification":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdSecurityCenterInsightsIssueIdClassification("test", "test", newSecurityCenterUserClassificationUpdate())

  test "GET /accounts/{account_id}/security-center/insights/{issue_id}/context":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSecurityCenterInsightsIssueIdContext("test", "test")

  test "GET /accounts/{account_id}/security-center/state":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSecurityCenterState("test")

  test "PUT /accounts/{account_id}/security-center/state":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdSecurityCenterState("test", newSecurityCenterUpdateAccountStateRequest())

  test "PATCH /zones/{zone_id}/security-center/insights/{issue_id}/classification":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdSecurityCenterInsightsIssueIdClassification("test", "test", newSecurityCenterUserClassificationUpdate())

