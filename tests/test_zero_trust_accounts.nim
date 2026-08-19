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

suite "zero_trust_accounts serialization":
  test "round-trips TeamsDevicesIdentifier":
    let obj = newTeamsDevicesIdentifier()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesIdentifier)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayApiResponseCommonFailure":
    let obj = newZeroTrustGatewayApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayCustomCertificateSettings":
    let obj = newZeroTrustGatewayCustomCertificateSettings()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayCustomCertificateSettings)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayGatewayAccountSettings":
    let obj = newZeroTrustGatewayGatewayAccountSettings()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayGatewayAccountSettings)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayGatewayAccountLoggingSettingsResponse":
    let obj = newZeroTrustGatewayGatewayAccountLoggingSettingsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayGatewayAccountLoggingSettingsResponse)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayGatewayAccount":
    let obj = newZeroTrustGatewayGatewayAccount()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayGatewayAccount)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesZeroTrustAccountDeviceSettingsResponse":
    let obj = newTeamsDevicesZeroTrustAccountDeviceSettingsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesZeroTrustAccountDeviceSettingsResponse)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayGatewayAccountLoggingSettings":
    let obj = newZeroTrustGatewayGatewayAccountLoggingSettings()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayGatewayAccountLoggingSettings)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesZeroTrustAccountDeviceSettings":
    let obj = newTeamsDevicesZeroTrustAccountDeviceSettings()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesZeroTrustAccountDeviceSettings)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayGatewayAccountEgressCidrPairListResponse":
    let obj = newZeroTrustGatewayGatewayAccountEgressCidrPairListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayGatewayAccountEgressCidrPairListResponse)) == openjson.toJson(obj)

  test "round-trips TeamsDevicesApiResponseCommonFailure":
    let obj = newTeamsDevicesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TeamsDevicesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ZeroTrustGatewayGatewayAccountConfig":
    let obj = newZeroTrustGatewayGatewayAccountConfig()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ZeroTrustGatewayGatewayAccountConfig)) == openjson.toJson(obj)

suite "zero_trust_accounts endpoints":
  test "GET /accounts/{account_id}/devices/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDevicesSettings(newTeamsDevicesIdentifier())

  test "PUT /accounts/{account_id}/devices/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDevicesSettings(newTeamsDevicesIdentifier(), newTeamsDevicesZeroTrustAccountDeviceSettings())

  test "DELETE /accounts/{account_id}/devices/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDevicesSettings(newTeamsDevicesIdentifier())

  test "PATCH /accounts/{account_id}/devices/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdDevicesSettings(newTeamsDevicesIdentifier(), newTeamsDevicesZeroTrustAccountDeviceSettings())

  test "GET /accounts/{account_id}/gateway":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdGateway("test")

  test "POST /accounts/{account_id}/gateway":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdGateway("test")

  test "GET /accounts/{account_id}/gateway/configuration":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdGatewayConfiguration("test")

  test "PUT /accounts/{account_id}/gateway/configuration":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdGatewayConfiguration("test", newZeroTrustGatewayGatewayAccountSettings())

  test "PATCH /accounts/{account_id}/gateway/configuration":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdGatewayConfiguration("test", newZeroTrustGatewayGatewayAccountSettings())

  test "GET /accounts/{account_id}/gateway/configuration/custom_certificate":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdGatewayConfigurationCustomCertificate("test")

  test "GET /accounts/{account_id}/gateway/egress_cidr_pairs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdGatewayEgressCidrPairs("test")

  test "GET /accounts/{account_id}/gateway/logging":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdGatewayLogging("test")

  test "PUT /accounts/{account_id}/gateway/logging":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdGatewayLogging("test", newZeroTrustGatewayGatewayAccountLoggingSettings())

