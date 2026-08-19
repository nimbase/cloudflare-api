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

suite "email_security serialization":
  test "round-trips EmailSecurityActionEntry":
    let obj = newEmailSecurityActionEntry()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityActionEntry)) == openjson.toJson(obj)

  test "round-trips EmailSecurityMessageTrace":
    let obj = newEmailSecurityMessageTrace()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityMessageTrace)) == openjson.toJson(obj)

  test "round-trips EmailSecurityMessagePreview":
    let obj = newEmailSecurityMessagePreview()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityMessagePreview)) == openjson.toJson(obj)

  test "round-trips EmailSecurityMoveResponseItem":
    let obj = newEmailSecurityMoveResponseItem()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityMoveResponseItem)) == openjson.toJson(obj)

  test "round-trips EmailSecurityReclassifyRequest":
    let obj = newEmailSecurityReclassifyRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityReclassifyRequest)) == openjson.toJson(obj)

  test "round-trips EmailSecurityApiResponseCommonFailure":
    let obj = newEmailSecurityApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips EmailSecuritySubmission":
    let obj = newEmailSecuritySubmission()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecuritySubmission)) == openjson.toJson(obj)

  test "round-trips EmailSecurityPhishGuardReport":
    let obj = newEmailSecurityPhishGuardReport()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityPhishGuardReport)) == openjson.toJson(obj)

  test "round-trips EmailSecurityApiResponseSingle":
    let obj = newEmailSecurityApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips EmailSecurityApiResponseCommon":
    let obj = newEmailSecurityApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips EmailSecurityMessageDetails":
    let obj = newEmailSecurityMessageDetails()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityMessageDetails)) == openjson.toJson(obj)

  test "round-trips EmailSecurityBulkActionMessageDetail":
    let obj = newEmailSecurityBulkActionMessageDetail()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityBulkActionMessageDetail)) == openjson.toJson(obj)

  test "round-trips EmailSecurityReleaseResponse":
    let obj = newEmailSecurityReleaseResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityReleaseResponse)) == openjson.toJson(obj)

  test "round-trips EmailSecurityBulkJobDetail":
    let obj = newEmailSecurityBulkJobDetail()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityBulkJobDetail)) == openjson.toJson(obj)

  test "round-trips EmailSecurityApiResponseCollection":
    let obj = newEmailSecurityApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips EmailSecurityCursorResultInfo":
    let obj = newEmailSecurityCursorResultInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityCursorResultInfo)) == openjson.toJson(obj)

  test "round-trips EmailSecurityBulkActionRequest":
    let obj = newEmailSecurityBulkActionRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityBulkActionRequest)) == openjson.toJson(obj)

  test "round-trips EmailSecurityMessageDetectionDetails":
    let obj = newEmailSecurityMessageDetectionDetails()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityMessageDetectionDetails)) == openjson.toJson(obj)

  test "round-trips EmailSecurityMessageRaw":
    let obj = newEmailSecurityMessageRaw()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityMessageRaw)) == openjson.toJson(obj)

suite "email_security endpoints":
  test "GET /accounts/{account_id}/email-security/investigate/bulk":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSecurityInvestigateBulk(1, 1, {}, {})

  test "POST /accounts/{account_id}/email-security/investigate/bulk":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdEmailSecurityInvestigateBulk(newEmailSecurityBulkActionRequest())

  test "GET /accounts/{account_id}/email-security/investigate/bulk/{job_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSecurityInvestigateBulkJobId()

  test "DELETE /accounts/{account_id}/email-security/investigate/bulk/{job_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdEmailSecurityInvestigateBulkJobId()

  test "POST /accounts/{account_id}/email-security/investigate/bulk/{job_id}/cancel":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdEmailSecurityInvestigateBulkJobIdCancel()

  test "GET /accounts/{account_id}/email-security/investigate/bulk/{job_id}/messages":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSecurityInvestigateBulkJobIdMessages(1, 1, {})

  test "POST /accounts/{account_id}/email-security/investigate/release":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdEmailSecurityInvestigateRelease()

  test "GET /accounts/{account_id}/email-security/investigate/{investigate_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSecurityInvestigateInvestigateId()

  test "GET /accounts/{account_id}/email-security/investigate/{investigate_id}/action_log":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSecurityInvestigateInvestigateIdActionLog()

  test "GET /accounts/{account_id}/email-security/investigate/{investigate_id}/detections":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSecurityInvestigateInvestigateIdDetections()

  test "GET /accounts/{account_id}/email-security/investigate/{investigate_id}/preview":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSecurityInvestigateInvestigateIdPreview()

  test "GET /accounts/{account_id}/email-security/investigate/{investigate_id}/raw":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSecurityInvestigateInvestigateIdRaw()

  test "POST /accounts/{account_id}/email-security/investigate/{investigate_id}/reclassify":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdEmailSecurityInvestigateInvestigateIdReclassify(newEmailSecurityReclassifyRequest())

  test "GET /accounts/{account_id}/email-security/investigate/{investigate_id}/trace":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSecurityInvestigateInvestigateIdTrace()

  test "GET /accounts/{account_id}/email-security/phishguard/reports":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSecurityPhishguardReports("test", "test", "test", "test")

