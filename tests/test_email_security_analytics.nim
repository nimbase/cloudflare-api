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

suite "email_security_analytics serialization":
  test "round-trips EmailSecurityApiResponseCommonFailure":
    let obj = newEmailSecurityApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips EmailSecurityApiResponseSingle":
    let obj = newEmailSecurityApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityApiResponseSingle)) == openjson.toJson(obj)

suite "email_security_analytics endpoints":
  test "GET /accounts/{account_id}/email-security/analytics/monthly_report":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSecurityAnalyticsMonthlyReport()

