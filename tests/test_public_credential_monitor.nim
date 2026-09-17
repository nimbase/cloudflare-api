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

suite "public_credential_monitor serialization":
  test "round-trips GetAccountsAccountIdCloudforceOneV2CredentialMonitorDomainsResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2CredentialMonitorDomainsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2CredentialMonitorDomainsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdCloudforceOneV2CredentialMonitorDomainsResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneV2CredentialMonitorDomainsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneV2CredentialMonitorDomainsResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdCloudforceOneV2CredentialMonitorDomainsIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdCloudforceOneV2CredentialMonitorDomainsIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdCloudforceOneV2CredentialMonitorDomainsIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdCloudforceOneV2CredentialMonitorMatchesResponse":
    let obj = cloudflare.GetAccountsAccountIdCloudforceOneV2CredentialMonitorMatchesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdCloudforceOneV2CredentialMonitorMatchesResponse)) == openjson.toJson(obj)

suite "public_credential_monitor endpoints":
  test "GET /accounts/{account_id}/cloudforce-one/v2/credential-monitor/domains":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2CredentialMonitorDomains("test", 1, 1)

  test "DELETE /accounts/{account_id}/cloudforce-one/v2/credential-monitor/domains/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneV2CredentialMonitorDomainsId("test", 1)

  test "GET /accounts/{account_id}/cloudforce-one/v2/credential-monitor/matches":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneV2CredentialMonitorMatches("test", "test", "test", 1, 1)

