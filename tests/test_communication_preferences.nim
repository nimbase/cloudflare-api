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

suite "communication_preferences serialization":
  test "round-trips CpsUpdateCommunicationPreferencesRequest":
    let obj = newCpsUpdateCommunicationPreferencesRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CpsUpdateCommunicationPreferencesRequest)) == openjson.toJson(obj)

  test "round-trips CpsCommunicationPreferencesResponse":
    let obj = newCpsCommunicationPreferencesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CpsCommunicationPreferencesResponse)) == openjson.toJson(obj)

  test "round-trips CpsApiResponseCommonFailure":
    let obj = newCpsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CpsApiResponseCommonFailure)) == openjson.toJson(obj)

suite "communication_preferences endpoints":
  test "GET /user/communication_preferences":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getUserCommunicationPreferences()

  test "PUT /user/communication_preferences":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putUserCommunicationPreferences(newCpsUpdateCommunicationPreferencesRequest())

