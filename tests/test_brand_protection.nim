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

suite "brand_protection serialization":
  test "round-trips BrandProtectionApiURLSubmit":
    let obj = newBrandProtectionApiURLSubmit()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BrandProtectionApiURLSubmit)) == openjson.toJson(obj)

  test "round-trips BrandProtectionApiError":
    let obj = newBrandProtectionApiError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BrandProtectionApiError)) == openjson.toJson(obj)

  test "round-trips BrandProtectionApiURLInfo":
    let obj = newBrandProtectionApiURLInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BrandProtectionApiURLInfo)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2BrandProtectionDomainMatchesResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2BrandProtectionDomainMatchesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2BrandProtectionDomainMatchesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesQueryIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesQueryIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesQueryIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesQueryIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesQueryIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesQueryIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneV2BrandProtectionLetterGenerateResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneV2BrandProtectionLetterGenerateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneV2BrandProtectionLetterGenerateResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesExamplesResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesExamplesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesExamplesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesTemplateIdResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesTemplateIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesTemplateIdResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesTemplateIdResponse":
    let obj = cloudflare.PutAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesTemplateIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesTemplateIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesTemplateIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesTemplateIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesTemplateIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2BrandProtectionLogoMatchesResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2BrandProtectionLogoMatchesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2BrandProtectionLogoMatchesResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneV2BrandProtectionLogoQueriesResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneV2BrandProtectionLogoQueriesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneV2BrandProtectionLogoQueriesResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdCloudforceOneV2BrandProtectionLogoQueriesQueryIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdCloudforceOneV2BrandProtectionLogoQueriesQueryIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdCloudforceOneV2BrandProtectionLogoQueriesQueryIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneV2BrandProtectionLogoSearchResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneV2BrandProtectionLogoSearchResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneV2BrandProtectionLogoSearchResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesLookupResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesLookupResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesLookupResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdResponse":
    let obj = cloudflare.PutAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersLetterIdResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersLetterIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersLetterIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersLetterIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersLetterIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersLetterIdResponse)) == openjson.toJson(obj)

suite "brand_protection endpoints":
  test "GET /accounts/{account_id}/brand-protection/alerts":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrandProtectionAlerts()

  test "PATCH /accounts/{account_id}/brand-protection/alerts":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdBrandProtectionAlerts()

  test "PATCH /accounts/{account_id}/brand-protection/alerts/clear":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdBrandProtectionAlertsClear()

  test "PATCH /accounts/{account_id}/brand-protection/alerts/refute":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdBrandProtectionAlertsRefute()

  test "PATCH /accounts/{account_id}/brand-protection/alerts/verify":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdBrandProtectionAlertsVerify()

  test "GET /accounts/{account_id}/brand-protection/brands":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrandProtectionBrands()

  test "POST /accounts/{account_id}/brand-protection/brands":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdBrandProtectionBrands()

  test "DELETE /accounts/{account_id}/brand-protection/brands":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdBrandProtectionBrands()

  test "GET /accounts/{account_id}/brand-protection/brands/patterns":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrandProtectionBrandsPatterns()

  test "POST /accounts/{account_id}/brand-protection/brands/patterns":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdBrandProtectionBrandsPatterns()

  test "DELETE /accounts/{account_id}/brand-protection/brands/patterns":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdBrandProtectionBrandsPatterns()

  test "PATCH /accounts/{account_id}/brand-protection/clear":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdBrandProtectionClear()

  test "GET /accounts/{account_id}/brand-protection/domain-info":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrandProtectionDomainInfo()

  test "GET /accounts/{account_id}/brand-protection/recent-submissions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrandProtectionRecentSubmissions()

  test "PATCH /accounts/{account_id}/brand-protection/refute":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdBrandProtectionRefute()

  test "GET /accounts/{account_id}/brand-protection/submission-info":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrandProtectionSubmissionInfo()

  test "POST /accounts/{account_id}/brand-protection/submit":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdBrandProtectionSubmit()

  test "GET /accounts/{account_id}/brand-protection/tracked-domains":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrandProtectionTrackedDomains()

  test "GET /accounts/{account_id}/brand-protection/url-info":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrandProtectionUrlInfo()

  test "PATCH /accounts/{account_id}/brand-protection/verify":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdBrandProtectionVerify()

  test "GET /accounts/{account_id}/cloudforce-one/v2/brand-protection/domain/matches":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2BrandProtectionDomainMatches("test", "test", "test", @["test"], "test", "test", "test", {}, {})

  test "GET /accounts/{account_id}/cloudforce-one/v2/brand-protection/domain/queries":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueries("test", "test", 1, 1)

  test "DELETE /accounts/{account_id}/cloudforce-one/v2/brand-protection/domain/queries/{query_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesQueryId("test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/brand-protection/letter/templates":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplates("test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/brand-protection/letter/templates/examples":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesExamples("test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/brand-protection/letter/templates/{template_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesTemplateId("test", "test")

  test "DELETE /accounts/{account_id}/cloudforce-one/v2/brand-protection/letter/templates/{template_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesTemplateId("test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/brand-protection/logo/matches":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2BrandProtectionLogoMatches("test", "test", "test", "test", "test", {}, {})

  test "GET /accounts/{account_id}/cloudforce-one/v2/brand-protection/logo/queries":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2BrandProtectionLogoQueries("test", "test", "test")

  test "DELETE /accounts/{account_id}/cloudforce-one/v2/brand-protection/logo/queries/{query_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneV2BrandProtectionLogoQueriesQueryId("test", "test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/brand-protection/takedown-notices":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNotices("test")

  test "GET /accounts/{account_id}/cloudforce-one/v2/brand-protection/takedown-notices/{notice_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeId("test", 1)

  test "DELETE /accounts/{account_id}/cloudforce-one/v2/brand-protection/takedown-notices/{notice_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeId("test", 1)

  test "GET /accounts/{account_id}/cloudforce-one/v2/brand-protection/takedown-notices/{notice_id}/letters":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLetters("test", 1)

  test "GET /accounts/{account_id}/cloudforce-one/v2/brand-protection/takedown-notices/{notice_id}/letters/{letter_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersLetterId("test", 1, 1)

  test "DELETE /accounts/{account_id}/cloudforce-one/v2/brand-protection/takedown-notices/{notice_id}/letters/{letter_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersLetterId("test", 1, 1)

  test "GET /accounts/{account_id}/cloudforce-one/v2/brand-protection/takedown-notices/{notice_id}/letters/{letter_id}/pdf":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersLetterIdPdf("test", 1, 1)

  test "GET /accounts/{account_id}/cloudforce-one/v2/brand-protection/total-queries":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2BrandProtectionTotalQueries("test")

  test "POST /internal/submit":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postInternalSubmit()

  test "GET /live":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getLive()

  test "GET /ready":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getReady()

