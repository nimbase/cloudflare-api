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

suite "dex_notifications serialization":
  test "round-trips DigitalExperienceMonitoringApiResponseSingle":
    let obj = newDigitalExperienceMonitoringApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringApiResponseCollection":
    let obj = newDigitalExperienceMonitoringApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringApiResponseCollection)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringCreateNotificationRequest":
    let obj = newDigitalExperienceMonitoringCreateNotificationRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringCreateNotificationRequest)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringClientNotification":
    let obj = newDigitalExperienceMonitoringClientNotification()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringClientNotification)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringGetNotificationsResponse":
    let obj = newDigitalExperienceMonitoringGetNotificationsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringGetNotificationsResponse)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringApiResponseCommonFailure":
    let obj = newDigitalExperienceMonitoringApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DigitalExperienceMonitoringGetNotificationOutcomesResponse":
    let obj = newDigitalExperienceMonitoringGetNotificationOutcomesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DigitalExperienceMonitoringGetNotificationOutcomesResponse)) == openjson.toJson(obj)

suite "dex_notifications endpoints":
  test "GET /accounts/{account_id}/dex/notifications":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDexNotifications("test", 1, 1, "test", "test", "test", scopeAccount, statusPending)

  test "POST /accounts/{account_id}/dex/notifications":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDexNotifications("test", newDigitalExperienceMonitoringCreateNotificationRequest())

  test "GET /accounts/{account_id}/dex/notifications/{notification_id}/outcomes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDexNotificationsNotificationIdOutcomes("test", "test", 1, "test", outcomeDelivered)

