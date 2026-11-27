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

suite "cloudflare_tunnel_hostname serialization":
  test "round-trips TunnelPatchHostnameRecordBody":
    let obj = newTunnelPatchHostnameRecordBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelPatchHostnameRecordBody)) == openjson.toJson(obj)

  test "round-trips TunnelApiResponseCommonFailure":
    let obj = newTunnelApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips TunnelHostnameRecordResponseSingle":
    let obj = newTunnelHostnameRecordResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelHostnameRecordResponseSingle)) == openjson.toJson(obj)

  test "round-trips TunnelHostnameRecordResponseCollection":
    let obj = newTunnelHostnameRecordResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelHostnameRecordResponseCollection)) == openjson.toJson(obj)

  test "round-trips TunnelPostHostnameRecordBody":
    let obj = newTunnelPostHostnameRecordBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TunnelPostHostnameRecordBody)) == openjson.toJson(obj)

suite "cloudflare_tunnel_hostname endpoints":
  test "GET /accounts/{account_id}/tunnels/{tunnel_id}/hostnames":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdTunnelsTunnelIdHostnames("test", "test", "test", true, true, 1.0, 1.0)

  test "POST /accounts/{account_id}/tunnels/{tunnel_id}/hostnames":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdTunnelsTunnelIdHostnames("test", "test", newTunnelPostHostnameRecordBody())

  test "GET /accounts/{account_id}/tunnels/{tunnel_id}/hostnames/{hostname_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdTunnelsTunnelIdHostnamesHostnameId("test", "test", "test")

  test "DELETE /accounts/{account_id}/tunnels/{tunnel_id}/hostnames/{hostname_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdTunnelsTunnelIdHostnamesHostnameId("test", "test", "test")

  test "PATCH /accounts/{account_id}/tunnels/{tunnel_id}/hostnames/{hostname_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdTunnelsTunnelIdHostnamesHostnameId("test", "test", "test", newTunnelPatchHostnameRecordBody())

