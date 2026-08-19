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

suite "ct_alerting serialization":
  test "round-trips TlsCertificatesAndHostnamesCtAlertingSubscriptionUpdate":
    let obj = newTlsCertificatesAndHostnamesCtAlertingSubscriptionUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCtAlertingSubscriptionUpdate)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesCtAlertingSubscriptionResponseSingle":
    let obj = newTlsCertificatesAndHostnamesCtAlertingSubscriptionResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesCtAlertingSubscriptionResponseSingle)) == openjson.toJson(obj)

  test "round-trips TlsCertificatesAndHostnamesApiResponseCommonFailure":
    let obj = newTlsCertificatesAndHostnamesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.TlsCertificatesAndHostnamesApiResponseCommonFailure)) == openjson.toJson(obj)

suite "ct_alerting endpoints":
  test "GET /zones/{zone_id}/ct/alerting":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdCtAlerting("test")

  test "PATCH /zones/{zone_id}/ct/alerting":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdCtAlerting("test", newTlsCertificatesAndHostnamesCtAlertingSubscriptionUpdate())

