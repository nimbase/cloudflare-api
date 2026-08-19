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

suite "email_security_settings serialization":
  test "round-trips EmailSecurityUpdateSendingDomainRestriction":
    let obj = newEmailSecurityUpdateSendingDomainRestriction()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityUpdateSendingDomainRestriction)) == openjson.toJson(obj)

  test "round-trips EmailSecurityAllowPolicy":
    let obj = newEmailSecurityAllowPolicy()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityAllowPolicy)) == openjson.toJson(obj)

  test "round-trips EmailSecurityCreateSendingDomainRestriction":
    let obj = newEmailSecurityCreateSendingDomainRestriction()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityCreateSendingDomainRestriction)) == openjson.toJson(obj)

  test "round-trips EmailSecurityCreateImpersonationRegistry":
    let obj = newEmailSecurityCreateImpersonationRegistry()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityCreateImpersonationRegistry)) == openjson.toJson(obj)

  test "round-trips EmailSecurityCreateDomain":
    let obj = newEmailSecurityCreateDomain()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityCreateDomain)) == openjson.toJson(obj)

  test "round-trips EmailSecuritySendingDomainRestriction":
    let obj = newEmailSecuritySendingDomainRestriction()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecuritySendingDomainRestriction)) == openjson.toJson(obj)

  test "round-trips EmailSecurityCreateAllowPolicy":
    let obj = newEmailSecurityCreateAllowPolicy()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityCreateAllowPolicy)) == openjson.toJson(obj)

  test "round-trips EmailSecurityImpersonationRegistry":
    let obj = newEmailSecurityImpersonationRegistry()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityImpersonationRegistry)) == openjson.toJson(obj)

  test "round-trips EmailSecurityUpdateAllowPolicy":
    let obj = newEmailSecurityUpdateAllowPolicy()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityUpdateAllowPolicy)) == openjson.toJson(obj)

  test "round-trips EmailSecurityTrustedDomain":
    let obj = newEmailSecurityTrustedDomain()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityTrustedDomain)) == openjson.toJson(obj)

  test "round-trips EmailSecurityDeletedBlockedSender":
    let obj = newEmailSecurityDeletedBlockedSender()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityDeletedBlockedSender)) == openjson.toJson(obj)

  test "round-trips EmailSecurityApiResponseCommonFailure":
    let obj = newEmailSecurityApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips EmailSecurityDeletedSendingDomainRestriction":
    let obj = newEmailSecurityDeletedSendingDomainRestriction()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityDeletedSendingDomainRestriction)) == openjson.toJson(obj)

  test "round-trips EmailSecurityUpdateBlockedSender":
    let obj = newEmailSecurityUpdateBlockedSender()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityUpdateBlockedSender)) == openjson.toJson(obj)

  test "round-trips EmailSecurityDeletedUrlIgnorePattern":
    let obj = newEmailSecurityDeletedUrlIgnorePattern()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityDeletedUrlIgnorePattern)) == openjson.toJson(obj)

  test "round-trips EmailSecurityDeletedTrustedDomain":
    let obj = newEmailSecurityDeletedTrustedDomain()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityDeletedTrustedDomain)) == openjson.toJson(obj)

  test "round-trips EmailSecurityDeletedAllowPolicy":
    let obj = newEmailSecurityDeletedAllowPolicy()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityDeletedAllowPolicy)) == openjson.toJson(obj)

  test "round-trips EmailSecurityApiResponseSingle":
    let obj = newEmailSecurityApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips EmailSecurityUrlIgnorePattern":
    let obj = newEmailSecurityUrlIgnorePattern()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityUrlIgnorePattern)) == openjson.toJson(obj)

  test "round-trips EmailSecurityUpdateTrustedDomain":
    let obj = newEmailSecurityUpdateTrustedDomain()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityUpdateTrustedDomain)) == openjson.toJson(obj)

  test "round-trips EmailSecurityDeletedImpersonationRegistry":
    let obj = newEmailSecurityDeletedImpersonationRegistry()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityDeletedImpersonationRegistry)) == openjson.toJson(obj)

  test "round-trips EmailSecurityUpdateDomain":
    let obj = newEmailSecurityUpdateDomain()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityUpdateDomain)) == openjson.toJson(obj)

  test "round-trips EmailSecurityUpdateUrlIgnorePattern":
    let obj = newEmailSecurityUpdateUrlIgnorePattern()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityUpdateUrlIgnorePattern)) == openjson.toJson(obj)

  test "round-trips EmailSecurityApiResponseCommon":
    let obj = newEmailSecurityApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips EmailSecurityUpdateImpersonationRegistry":
    let obj = newEmailSecurityUpdateImpersonationRegistry()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityUpdateImpersonationRegistry)) == openjson.toJson(obj)

  test "round-trips EmailSecurityCreateTrustedDomain":
    let obj = newEmailSecurityCreateTrustedDomain()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityCreateTrustedDomain)) == openjson.toJson(obj)

  test "round-trips EmailSecurityCreateBlockedSender":
    let obj = newEmailSecurityCreateBlockedSender()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityCreateBlockedSender)) == openjson.toJson(obj)

  test "round-trips EmailSecurityApiResponseCollection":
    let obj = newEmailSecurityApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips EmailSecurityReplaceDomain":
    let obj = newEmailSecurityReplaceDomain()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityReplaceDomain)) == openjson.toJson(obj)

  test "round-trips EmailSecurityDomain":
    let obj = newEmailSecurityDomain()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityDomain)) == openjson.toJson(obj)

  test "round-trips EmailSecurityDomainVerificationInfo":
    let obj = newEmailSecurityDomainVerificationInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityDomainVerificationInfo)) == openjson.toJson(obj)

  test "round-trips EmailSecurityBlockedSender":
    let obj = newEmailSecurityBlockedSender()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityBlockedSender)) == openjson.toJson(obj)

  test "round-trips EmailSecurityCreateUrlIgnorePattern":
    let obj = newEmailSecurityCreateUrlIgnorePattern()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityCreateUrlIgnorePattern)) == openjson.toJson(obj)

  test "round-trips EmailSecurityDeletedDomain":
    let obj = newEmailSecurityDeletedDomain()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSecurityDeletedDomain)) == openjson.toJson(obj)

suite "email_security_settings endpoints":
  test "GET /accounts/{account_id}/email-security/settings/allow_policies":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSecuritySettingsAllowPolicies(1, 1, "test", {}, {}, true, true, true, true, openjson.newJObject(), "test")

  test "POST /accounts/{account_id}/email-security/settings/allow_policies":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdEmailSecuritySettingsAllowPolicies(newEmailSecurityCreateAllowPolicy())

  test "GET /accounts/{account_id}/email-security/settings/allow_policies/{policy_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSecuritySettingsAllowPoliciesPolicyId()

  test "DELETE /accounts/{account_id}/email-security/settings/allow_policies/{policy_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdEmailSecuritySettingsAllowPoliciesPolicyId()

  test "PATCH /accounts/{account_id}/email-security/settings/allow_policies/{policy_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdEmailSecuritySettingsAllowPoliciesPolicyId(newEmailSecurityUpdateAllowPolicy())

  test "GET /accounts/{account_id}/email-security/settings/block_senders":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSecuritySettingsBlockSenders(1, 1, "test", {}, {}, openjson.newJObject(), "test")

  test "POST /accounts/{account_id}/email-security/settings/block_senders":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdEmailSecuritySettingsBlockSenders(newEmailSecurityCreateBlockedSender())

  test "GET /accounts/{account_id}/email-security/settings/block_senders/{pattern_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSecuritySettingsBlockSendersPatternId()

  test "DELETE /accounts/{account_id}/email-security/settings/block_senders/{pattern_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdEmailSecuritySettingsBlockSendersPatternId()

  test "PATCH /accounts/{account_id}/email-security/settings/block_senders/{pattern_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdEmailSecuritySettingsBlockSendersPatternId(newEmailSecurityUpdateBlockedSender())

  test "POST /accounts/{account_id}/email-security/settings/domains":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdEmailSecuritySettingsDomains(newEmailSecurityCreateDomain())

  test "DELETE /accounts/{account_id}/email-security/settings/domains":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdEmailSecuritySettingsDomains()

  test "GET /accounts/{account_id}/email-security/settings/domains/{domain_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSecuritySettingsDomainsDomainId()

  test "PUT /accounts/{account_id}/email-security/settings/domains/{domain_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdEmailSecuritySettingsDomainsDomainId(newEmailSecurityReplaceDomain())

  test "DELETE /accounts/{account_id}/email-security/settings/domains/{domain_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdEmailSecuritySettingsDomainsDomainId()

  test "PATCH /accounts/{account_id}/email-security/settings/domains/{domain_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdEmailSecuritySettingsDomainsDomainId(newEmailSecurityUpdateDomain())

  test "GET /accounts/{account_id}/email-security/settings/domains/{domain_id}/verification":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSecuritySettingsDomainsDomainIdVerification()

  test "POST /accounts/{account_id}/email-security/settings/impersonation_registry":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdEmailSecuritySettingsImpersonationRegistry(newEmailSecurityCreateImpersonationRegistry())

  test "GET /accounts/{account_id}/email-security/settings/impersonation_registry/{impersonation_registry_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSecuritySettingsImpersonationRegistryImpersonationRegistryId()

  test "DELETE /accounts/{account_id}/email-security/settings/impersonation_registry/{impersonation_registry_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdEmailSecuritySettingsImpersonationRegistryImpersonationRegistryId()

  test "PATCH /accounts/{account_id}/email-security/settings/impersonation_registry/{impersonation_registry_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdEmailSecuritySettingsImpersonationRegistryImpersonationRegistryId(newEmailSecurityUpdateImpersonationRegistry())

  test "GET /accounts/{account_id}/email-security/settings/sending_domain_restrictions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSecuritySettingsSendingDomainRestrictions(1, 1, "test", {}, {})

  test "POST /accounts/{account_id}/email-security/settings/sending_domain_restrictions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdEmailSecuritySettingsSendingDomainRestrictions(newEmailSecurityCreateSendingDomainRestriction())

  test "GET /accounts/{account_id}/email-security/settings/sending_domain_restrictions/{sending_domain_restriction_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSecuritySettingsSendingDomainRestrictionsSendingDomainRestrictionId()

  test "DELETE /accounts/{account_id}/email-security/settings/sending_domain_restrictions/{sending_domain_restriction_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdEmailSecuritySettingsSendingDomainRestrictionsSendingDomainRestrictionId()

  test "PATCH /accounts/{account_id}/email-security/settings/sending_domain_restrictions/{sending_domain_restriction_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdEmailSecuritySettingsSendingDomainRestrictionsSendingDomainRestrictionId(newEmailSecurityUpdateSendingDomainRestriction())

  test "GET /accounts/{account_id}/email-security/settings/trusted_domains":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSecuritySettingsTrustedDomains(1, 1, "test", {}, {}, true, true, "test")

  test "POST /accounts/{account_id}/email-security/settings/trusted_domains":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdEmailSecuritySettingsTrustedDomains(newEmailSecurityCreateTrustedDomain())

  test "GET /accounts/{account_id}/email-security/settings/trusted_domains/{trusted_domain_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSecuritySettingsTrustedDomainsTrustedDomainId()

  test "DELETE /accounts/{account_id}/email-security/settings/trusted_domains/{trusted_domain_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdEmailSecuritySettingsTrustedDomainsTrustedDomainId()

  test "PATCH /accounts/{account_id}/email-security/settings/trusted_domains/{trusted_domain_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdEmailSecuritySettingsTrustedDomainsTrustedDomainId(newEmailSecurityUpdateTrustedDomain())

  test "GET /accounts/{account_id}/email-security/settings/url_ignore_patterns":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSecuritySettingsUrlIgnorePatterns(1, 1)

  test "POST /accounts/{account_id}/email-security/settings/url_ignore_patterns":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdEmailSecuritySettingsUrlIgnorePatterns(newEmailSecurityCreateUrlIgnorePattern())

  test "GET /accounts/{account_id}/email-security/settings/url_ignore_patterns/{pattern_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdEmailSecuritySettingsUrlIgnorePatternsPatternId()

  test "DELETE /accounts/{account_id}/email-security/settings/url_ignore_patterns/{pattern_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdEmailSecuritySettingsUrlIgnorePatternsPatternId()

  test "PATCH /accounts/{account_id}/email-security/settings/url_ignore_patterns/{pattern_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdEmailSecuritySettingsUrlIgnorePatternsPatternId(newEmailSecurityUpdateUrlIgnorePattern())

