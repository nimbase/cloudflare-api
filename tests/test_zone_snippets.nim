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

suite "zone_snippets serialization":
  test "round-trips SnippetsResponse":
    let obj = newSnippetsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SnippetsResponse)) == openjson.toJson(obj)

  test "round-trips SnippetsSnippet":
    let obj = newSnippetsSnippet()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SnippetsSnippet)) == openjson.toJson(obj)

  test "round-trips SnippetsResultInfo":
    let obj = newSnippetsResultInfo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.SnippetsResultInfo)) == openjson.toJson(obj)

suite "zone_snippets endpoints":
  test "GET /zones/{zone_id}/snippets":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSnippets("test", 1, 1)

  test "GET /zones/{zone_id}/snippets/snippet_rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSnippetsSnippetRules("test")

  test "DELETE /zones/{zone_id}/snippets/snippet_rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdSnippetsSnippetRules("test")

  test "GET /zones/{zone_id}/snippets/{snippet_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSnippetsSnippetName("test", "test")

  test "PUT /zones/{zone_id}/snippets/{snippet_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdSnippetsSnippetName("test", "test")

  test "DELETE /zones/{zone_id}/snippets/{snippet_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdSnippetsSnippetName("test", "test")

  test "GET /zones/{zone_id}/snippets/{snippet_name}/content":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdSnippetsSnippetNameContent("test", "test")

