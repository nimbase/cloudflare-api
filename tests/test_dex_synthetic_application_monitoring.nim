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

suite "dex_synthetic_application_monitoring serialization":
  test "round-trips DigitalExperienceMonitoringApiResponseSingle":
    let obj = newDigitalExperienceMonitoringApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringDexDeleteResponseCollection":
    let obj = newDigitalExperienceMonitoringDexDeleteResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringDexDeleteResponseCollection)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringApiResponseCollection":
    let obj = newDigitalExperienceMonitoringApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringTracerouteDetailsResponse":
    let obj = newDigitalExperienceMonitoringTracerouteDetailsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringTracerouteDetailsResponse)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringHttpDetailsPercentilesResponse":
    let obj = newDigitalExperienceMonitoringHttpDetailsPercentilesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringHttpDetailsPercentilesResponse)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringFleetStatusLiveResponse":
    let obj = newDigitalExperienceMonitoringFleetStatusLiveResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringFleetStatusLiveResponse)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringHttpDetailsResponse":
    let obj = newDigitalExperienceMonitoringHttpDetailsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringHttpDetailsResponse)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringFleetStatusDevicesResponse":
    let obj = newDigitalExperienceMonitoringFleetStatusDevicesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringFleetStatusDevicesResponse)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringDeviceStatusOverTimeResult":
    let obj = newDigitalExperienceMonitoringDeviceStatusOverTimeResult()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringDeviceStatusOverTimeResult)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringDeviceDexTestSchemasHttp":
    let obj = newDigitalExperienceMonitoringDeviceDexTestSchemasHttp()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringDeviceDexTestSchemasHttp)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringApiResponseCommon":
    let obj = newDigitalExperienceMonitoringApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringFleetStatusOverTimeResponse":
    let obj = newDigitalExperienceMonitoringFleetStatusOverTimeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringFleetStatusOverTimeResponse)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringTracerouteDetailsPercentilesResponse":
    let obj = newDigitalExperienceMonitoringTracerouteDetailsPercentilesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringTracerouteDetailsPercentilesResponse)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringDexSingleResponse":
    let obj = newDigitalExperienceMonitoringDexSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringDexSingleResponse)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringDevice":
    let obj = newDigitalExperienceMonitoringDevice()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringDevice)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringDexResponseCollection":
    let obj = newDigitalExperienceMonitoringDexResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringDexResponseCollection)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringTestsResponse":
    let obj = newDigitalExperienceMonitoringTestsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringTestsResponse)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringUniqueDevicesResponse":
    let obj = newDigitalExperienceMonitoringUniqueDevicesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringUniqueDevicesResponse)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringDeviceIspsResponse":
    let obj = newDigitalExperienceMonitoringDeviceIspsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringDeviceIspsResponse)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringApiResponseCommonFailure":
    let obj = newDigitalExperienceMonitoringApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringTracerouteTestResultNetworkPathResponse":
    let obj = newDigitalExperienceMonitoringTracerouteTestResultNetworkPathResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringTracerouteTestResultNetworkPathResponse)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringTracerouteTestNetworkPathResponse":
    let obj = newDigitalExperienceMonitoringTracerouteTestNetworkPathResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringTracerouteTestNetworkPathResponse)) == openjson.toJson(obj)

suite "dex_synthetic_application_monitoring endpoints":
  test "GET /accounts/{account_id}/dex/colos":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDexColos("test", "test", "test", {})

  test "GET /accounts/{account_id}/dex/devices/dex_tests":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDexDevicesDexTests("test", 1.0, 1.0, "test", {})

  test "POST /accounts/{account_id}/dex/devices/dex_tests":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDexDevicesDexTests("test", newDigitalExperienceMonitoringDeviceDexTestSchemasHttp())

  test "GET /accounts/{account_id}/dex/devices/dex_tests/{dex_test_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDexDevicesDexTestsDexTestId("test", "test")

  test "PUT /accounts/{account_id}/dex/devices/dex_tests/{dex_test_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDexDevicesDexTestsDexTestId("test", "test", newDigitalExperienceMonitoringDeviceDexTestSchemasHttp())

  test "DELETE /accounts/{account_id}/dex/devices/dex_tests/{dex_test_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDexDevicesDexTestsDexTestId("test", "test")

  test "GET /accounts/{account_id}/dex/devices/{device_id}/fleet-status/live":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDexDevicesDeviceIdFleetStatusLive("test", "test", 1.0, "test", "test")

  test "GET /accounts/{account_id}/dex/devices/{device_id}/fleet-status/over-time":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDexDevicesDeviceIdFleetStatusOverTime("test", "test", "test", "test", {}, "test")

  test "GET /accounts/{account_id}/dex/devices/{device_id}/isps":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDexDevicesDeviceIdIsps("test", "test", 1, 1, "test", {}, {}, "test", "test")

  test "GET /accounts/{account_id}/dex/fleet-status/live":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDexFleetStatusLive("test", 1.0)

  test "GET /accounts/{account_id}/dex/fleet-status/over-time":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDexFleetStatusOverTime("test", "test", "test", "test", "test")

  test "GET /accounts/{account_id}/dex/http-tests/{test_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDexHttpTestsTestId("test", "test", @["test"], "test", "test", {}, "test")

  test "GET /accounts/{account_id}/dex/http-tests/{test_id}/percentiles":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDexHttpTestsTestIdPercentiles("test", "test", @["test"], "test", "test", "test")

  test "GET /accounts/{account_id}/dex/tests/overview":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDexTestsOverview("test", "test", "test", @["test"], "test", 1.0, 1.0, {})

  test "GET /accounts/{account_id}/dex/tests/unique-devices":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDexTestsUniqueDevices("test", "test", @["test"])

  test "GET /accounts/{account_id}/dex/traceroute-test-results/{test_result_id}/network-path":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDexTracerouteTestResultsTestResultIdNetworkPath("test", "test")

  test "GET /accounts/{account_id}/dex/traceroute-tests/{test_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDexTracerouteTestsTestId("test", "test", @["test"], "test", "test", {}, "test")

  test "GET /accounts/{account_id}/dex/traceroute-tests/{test_id}/network-path":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDexTracerouteTestsTestIdNetworkPath("test", "test", "test", "test", "test", {})

  test "GET /accounts/{account_id}/dex/traceroute-tests/{test_id}/percentiles":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDexTracerouteTestsTestIdPercentiles("test", "test", @["test"], "test", "test", "test")

