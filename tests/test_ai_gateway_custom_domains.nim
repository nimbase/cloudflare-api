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

suite "ai_gateway_custom_domains serialization":
  test "round-trips GetAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsResponse":
    let obj = cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsResponse":
    let obj = cloudflare.PostAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsHostnameResponse":
    let obj = cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsHostnameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsHostnameResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsHostnameResponse":
    let obj = cloudflare.DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsHostnameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsHostnameResponse)) == openjson.toJson(obj)

suite "ai_gateway_custom_domains endpoints":
  test "GET /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/custom-domains":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomains("test", "test", 1, 1, {}, "test")

  test "GET /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/custom-domains/{hostname}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsHostname("test", "test", "test")

  test "DELETE /accounts/{account_id}/ai-gateway/gateways/{gateway_id}/custom-domains/{hostname}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAiGatewayGatewaysGatewayIdCustomDomainsHostname("test", "test", "test")

