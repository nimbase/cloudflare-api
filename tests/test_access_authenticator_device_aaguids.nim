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

suite "access_authenticator_device_aaguids serialization":
  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessResponseCollection16":
    let obj = newAccessResponseCollection16()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollection16)) == openjson.toJson(obj)

suite "access_authenticator_device_aaguids endpoints":
  test "GET /accounts/{account_id}/access/authenticator_device_aaguids":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessAuthenticatorDeviceAaguids("test")

