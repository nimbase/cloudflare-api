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

suite "mcp_portal serialization":
  test "round-trips GetAccountsAccountIdAccessAiControlsMcpPortalsResponse":
    let obj = cloudflare.GetAccountsAccountIdAccessAiControlsMcpPortalsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAccessAiControlsMcpPortalsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAccessAiControlsMcpPortalsResponse":
    let obj = cloudflare.PostAccountsAccountIdAccessAiControlsMcpPortalsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAccessAiControlsMcpPortalsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAccessAiControlsMcpPortalsIdResponse":
    let obj = cloudflare.GetAccountsAccountIdAccessAiControlsMcpPortalsIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAccessAiControlsMcpPortalsIdResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdAccessAiControlsMcpPortalsIdResponse":
    let obj = cloudflare.PutAccountsAccountIdAccessAiControlsMcpPortalsIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdAccessAiControlsMcpPortalsIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdAccessAiControlsMcpPortalsIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdAccessAiControlsMcpPortalsIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdAccessAiControlsMcpPortalsIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAccessAiControlsMcpPortalsPortalIdServersServerIdEffectiveRedirectUriResponse":
    let obj = cloudflare.GetAccountsAccountIdAccessAiControlsMcpPortalsPortalIdServersServerIdEffectiveRedirectUriResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAccessAiControlsMcpPortalsPortalIdServersServerIdEffectiveRedirectUriResponse)) == openjson.toJson(obj)

suite "mcp_portal endpoints":
  test "GET /accounts/{account_id}/access/ai-controls/mcp/portals":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessAiControlsMcpPortals("test", 1, 1, "test")

  test "GET /accounts/{account_id}/access/ai-controls/mcp/portals/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessAiControlsMcpPortalsId("test", "test")

  test "DELETE /accounts/{account_id}/access/ai-controls/mcp/portals/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAccessAiControlsMcpPortalsId("test", "test")

  test "GET /accounts/{account_id}/access/ai-controls/mcp/portals/{portal_id}/servers/{server_id}/effective-redirect-uri":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessAiControlsMcpPortalsPortalIdServersServerIdEffectiveRedirectUri("test", "test", "test")

