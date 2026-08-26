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

suite "reports_other serialization":
  test "round-trips ReportsError":
    let obj = newReportsError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ReportsError)) == openjson.toJson(obj)

  test "round-trips ReportsPoliciesListResponse":
    let obj = newReportsPoliciesListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ReportsPoliciesListResponse)) == openjson.toJson(obj)

  test "round-trips ReportsAccountIndustrySingleResponse":
    let obj = newReportsAccountIndustrySingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ReportsAccountIndustrySingleResponse)) == openjson.toJson(obj)

  test "round-trips ReportsPolicySingleResponse":
    let obj = newReportsPolicySingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ReportsPolicySingleResponse)) == openjson.toJson(obj)

  test "round-trips ReportsAccountIndustryPatchResponse":
    let obj = newReportsAccountIndustryPatchResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ReportsAccountIndustryPatchResponse)) == openjson.toJson(obj)

  test "round-trips ReportsPolicyErrorResponse":
    let obj = newReportsPolicyErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ReportsPolicyErrorResponse)) == openjson.toJson(obj)

  test "round-trips ReportsPatchAccountIndustryBody":
    let obj = newReportsPatchAccountIndustryBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ReportsPatchAccountIndustryBody)) == openjson.toJson(obj)

  test "round-trips ReportsAccountIndustryErrorResponse":
    let obj = newReportsAccountIndustryErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ReportsAccountIndustryErrorResponse)) == openjson.toJson(obj)

  test "round-trips ReportsMessage":
    let obj = newReportsMessage()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ReportsMessage)) == openjson.toJson(obj)

  test "round-trips ReportsReportsListResponse":
    let obj = newReportsReportsListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ReportsReportsListResponse)) == openjson.toJson(obj)

  test "round-trips ReportsReportSingleResponse":
    let obj = newReportsReportSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ReportsReportSingleResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdReportingIndustryResponse":
    let obj = cloudflare.GetAccountsAccountIdReportingIndustryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdReportingIndustryResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdReportingIndustryResponse":
    let obj = cloudflare.PatchAccountsAccountIdReportingIndustryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdReportingIndustryResponse)) == openjson.toJson(obj)

suite "reports_other endpoints":
  test "GET /accounts/{account_id}/reporting/industry":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdReportingIndustry("test")

  test "PATCH /accounts/{account_id}/reporting/industry":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdReportingIndustry("test", newReportsPatchAccountIndustryBody())

  test "GET /accounts/{account_id}/reporting/policies":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdReportingPolicies("test")

  test "GET /accounts/{account_id}/reporting/policies/{policy_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdReportingPoliciesPolicyId("test", "test")

  test "GET /accounts/{account_id}/reporting/reports":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdReportingReports("test")

  test "GET /accounts/{account_id}/reporting/reports/{report_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdReportingReportsReportId("test", "test")

