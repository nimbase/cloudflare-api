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

suite "dex_remote_commands serialization":
  test "round-trips DigitalExperienceMonitoringApiResponseCollection":
    let obj = newDigitalExperienceMonitoringApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringGetCommandsQuotaResponse":
    let obj = newDigitalExperienceMonitoringGetCommandsQuotaResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringGetCommandsQuotaResponse)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringGetCommandsResponse":
    let obj = newDigitalExperienceMonitoringGetCommandsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringGetCommandsResponse)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringApiResponseCommonFailure":
    let obj = newDigitalExperienceMonitoringApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringCommandsDevicesResponse":
    let obj = newDigitalExperienceMonitoringCommandsDevicesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringCommandsDevicesResponse)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringPostCommandsResponse":
    let obj = newDigitalExperienceMonitoringPostCommandsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringPostCommandsResponse)) == openjson.toJson(obj)

suite "dex_remote_commands endpoints":
  test "GET /accounts/{account_id}/dex/commands":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDexCommands("test", 1.0, 1.0, "test", "test", "test", "test", {}, {})

  test "GET /accounts/{account_id}/dex/commands/devices":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDexCommandsDevices("test", 1.0, 1.0, "test")

  test "GET /accounts/{account_id}/dex/commands/quota":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDexCommandsQuota("test")

  test "GET /accounts/{account_id}/dex/commands/{command_id}/downloads/{filename}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDexCommandsCommandIdDownloadsFilename("test", "test", "test")

