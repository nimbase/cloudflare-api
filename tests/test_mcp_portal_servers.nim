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

suite "mcp_portal_servers serialization":
  test "round-trips GetAccountsAccountIdAccessAiControlsMcpServersResponse":
    let obj = cloudflare.GetAccountsAccountIdAccessAiControlsMcpServersResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAccessAiControlsMcpServersResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAccessAiControlsMcpServersResponse":
    let obj = cloudflare.PostAccountsAccountIdAccessAiControlsMcpServersResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAccessAiControlsMcpServersResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdAccessAiControlsMcpServersIdResponse":
    let obj = cloudflare.GetAccountsAccountIdAccessAiControlsMcpServersIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdAccessAiControlsMcpServersIdResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdAccessAiControlsMcpServersIdResponse":
    let obj = cloudflare.PutAccountsAccountIdAccessAiControlsMcpServersIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdAccessAiControlsMcpServersIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdAccessAiControlsMcpServersIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdAccessAiControlsMcpServersIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdAccessAiControlsMcpServersIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdAccessAiControlsMcpServersIdSyncResponse":
    let obj = cloudflare.PostAccountsAccountIdAccessAiControlsMcpServersIdSyncResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdAccessAiControlsMcpServersIdSyncResponse)) == openjson.toJson(obj)

suite "mcp_portal_servers endpoints":
  test "GET /accounts/{account_id}/access/ai-controls/mcp/servers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessAiControlsMcpServers("test", 1, 1, "test")

  test "GET /accounts/{account_id}/access/ai-controls/mcp/servers/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessAiControlsMcpServersId("test", "test")

  test "DELETE /accounts/{account_id}/access/ai-controls/mcp/servers/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAccessAiControlsMcpServersId("test", "test")

  test "POST /accounts/{account_id}/access/ai-controls/mcp/servers/{id}/sync":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAccessAiControlsMcpServersIdSync("test", "test")

