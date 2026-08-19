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

suite "token_validation_token_configuration serialization":
  test "round-trips ApiShieldTokenConfiguration":
    let obj = newApiShieldTokenConfiguration()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldTokenConfiguration)) == openjson.toJson(obj)

  test "round-trips ApiShieldApiResponseCommonFailure":
    let obj = newApiShieldApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ApiShieldCredentialsRequest":
    let obj = newApiShieldCredentialsRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldCredentialsRequest)) == openjson.toJson(obj)

  test "round-trips ApiShieldApiResponseCommon":
    let obj = newApiShieldApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips ApiShieldCredentialsPatchRequest":
    let obj = newApiShieldCredentialsPatchRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldCredentialsPatchRequest)) == openjson.toJson(obj)

  test "round-trips ApiShieldUuid2":
    let obj = newApiShieldUuid2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldUuid2)) == openjson.toJson(obj)

  test "round-trips ApiShieldCredentials":
    let obj = newApiShieldCredentials()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldCredentials)) == openjson.toJson(obj)

  test "round-trips ApiShieldApiResponseCollection":
    let obj = newApiShieldApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseCollection)) == openjson.toJson(obj)

suite "token_validation_token_configuration endpoints":
  test "GET /zones/{zone_id}/token_validation/config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdTokenValidationConfig(1, 1)

  test "GET /zones/{zone_id}/token_validation/config/{config_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdTokenValidationConfigConfigId()

  test "DELETE /zones/{zone_id}/token_validation/config/{config_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdTokenValidationConfigConfigId()

  test "PUT /zones/{zone_id}/token_validation/config/{config_id}/credentials":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdTokenValidationConfigConfigIdCredentials(newApiShieldCredentialsRequest())

  test "PATCH /zones/{zone_id}/token_validation/config/{config_id}/credentials":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdTokenValidationConfigConfigIdCredentials(newApiShieldCredentialsPatchRequest())

