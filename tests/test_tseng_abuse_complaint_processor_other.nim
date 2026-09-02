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

suite "tseng_abuse_complaint_processor_other serialization":
  test "round-trips AbuseReportsSubmittedAbuseReportDetailResponse":
    let obj = newAbuseReportsSubmittedAbuseReportDetailResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AbuseReportsSubmittedAbuseReportDetailResponse)) == openjson.toJson(obj)

  test "round-trips AbuseReportsSubmitErrorResponse":
    let obj = newAbuseReportsSubmitErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AbuseReportsSubmitErrorResponse)) == openjson.toJson(obj)

  test "round-trips AbuseReportsErrorMessage":
    let obj = newAbuseReportsErrorMessage()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AbuseReportsErrorMessage)) == openjson.toJson(obj)

  test "round-trips AbuseReportsMitigationListItem":
    let obj = newAbuseReportsMitigationListItem()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AbuseReportsMitigationListItem)) == openjson.toJson(obj)

  test "round-trips AbuseReportsSubmitReportRequest":
    let obj = newAbuseReportsSubmitReportRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AbuseReportsSubmitReportRequest)) == openjson.toJson(obj)

  test "round-trips AbuseReportsEmailListResponse":
    let obj = newAbuseReportsEmailListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AbuseReportsEmailListResponse)) == openjson.toJson(obj)

  test "round-trips AbuseReportsMitigationAppealResult":
    let obj = newAbuseReportsMitigationAppealResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AbuseReportsMitigationAppealResult)) == openjson.toJson(obj)

  test "round-trips AbuseReportsMitigationAppealRequest":
    let obj = newAbuseReportsMitigationAppealRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AbuseReportsMitigationAppealRequest)) == openjson.toJson(obj)

  test "round-trips AbuseReportsEmailListItem":
    let obj = newAbuseReportsEmailListItem()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AbuseReportsEmailListItem)) == openjson.toJson(obj)

  test "round-trips AbuseReportsUnauthorizedErrorResponse":
    let obj = newAbuseReportsUnauthorizedErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AbuseReportsUnauthorizedErrorResponse)) == openjson.toJson(obj)

  test "round-trips AbuseReportsMessage":
    let obj = newAbuseReportsMessage()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AbuseReportsMessage)) == openjson.toJson(obj)

  test "round-trips AbuseReportsAbuseReport":
    let obj = newAbuseReportsAbuseReport()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AbuseReportsAbuseReport)) == openjson.toJson(obj)

  test "round-trips AbuseReportsAppealEligibility":
    let obj = newAbuseReportsAppealEligibility()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AbuseReportsAppealEligibility)) == openjson.toJson(obj)

  test "round-trips AbuseReportsSubmittedAbuseReportListResponse":
    let obj = newAbuseReportsSubmittedAbuseReportListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AbuseReportsSubmittedAbuseReportListResponse)) == openjson.toJson(obj)

  test "round-trips AbuseReportsSubmitReportResponse":
    let obj = newAbuseReportsSubmitReportResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AbuseReportsSubmitReportResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAbuseReportsResponse":
    let obj = cloudflare.GetAccountsAccountIdAbuseReportsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAbuseReportsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAbuseReportsReportIdAppealsEligibilityResponse":
    let obj = cloudflare.GetAccountsAccountIdAbuseReportsReportIdAppealsEligibilityResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAbuseReportsReportIdAppealsEligibilityResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAbuseReportsReportIdEmailsResponse":
    let obj = cloudflare.GetAccountsAccountIdAbuseReportsReportIdEmailsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAbuseReportsReportIdEmailsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAbuseReportsReportIdMitigationsResponse":
    let obj = cloudflare.GetAccountsAccountIdAbuseReportsReportIdMitigationsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAbuseReportsReportIdMitigationsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAbuseReportsReportParamResponse":
    let obj = cloudflare.GetAccountsAccountIdAbuseReportsReportParamResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAbuseReportsReportParamResponse)) == openjson.toJson(obj)

suite "tseng_abuse_complaint_processor_other endpoints":
  test "GET /accounts/{account_id}/abuse-reports/submitted":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAbuseReportsSubmitted("test", 1, 1, "test", "test", @["test"], "test", "test", @["test"], @["test"])

  test "GET /accounts/{account_id}/abuse-reports/submitted/{report_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAbuseReportsSubmittedReportId("test", "test")

  test "GET /accounts/{account_id}/abuse-reports/submitted/{report_id}/emails":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAbuseReportsSubmittedReportIdEmails("test", "test", 1, 1)

  test "GET /accounts/{account_id}/abuse-reports/{report_id}/appeals/eligibility":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAbuseReportsReportIdAppealsEligibility("test", "test")

  test "GET /accounts/{account_id}/abuse-reports/{report_id}/emails":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAbuseReportsReportIdEmails("test", "test", 1, 1)

  test "POST /accounts/{account_id}/abuse-reports/{report_id}/mitigations/appeal":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAbuseReportsReportIdMitigationsAppeal("test", "test", newAbuseReportsMitigationAppealRequest())

  test "GET /accounts/{account_id}/abuse-reports/{report_param}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAbuseReportsReportParam("test", "test")

  test "POST /accounts/{account_id}/abuse-reports/{report_param}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAbuseReportsReportParam("test", "test", newAbuseReportsSubmitReportRequest())

