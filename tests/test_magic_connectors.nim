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

suite "magic_connectors serialization":
  test "round-trips MconnConnectorInterruptsCreateResponse":
    let obj = newMconnConnectorInterruptsCreateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MconnConnectorInterruptsCreateResponse)) == openjson.toJson(obj)

  test "round-trips MconnCustomerConnectorsListResponse":
    let obj = newMconnCustomerConnectorsListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MconnCustomerConnectorsListResponse)) == openjson.toJson(obj)

  test "round-trips MconnCustomerConnectorsCreateRequest":
    let obj = newMconnCustomerConnectorsCreateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MconnCustomerConnectorsCreateRequest)) == openjson.toJson(obj)

  test "round-trips MconnCustomerConnectorsGetResponse":
    let obj = newMconnCustomerConnectorsGetResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MconnCustomerConnectorsGetResponse)) == openjson.toJson(obj)

  test "round-trips MconnCustomerConnectorsEditResponse":
    let obj = newMconnCustomerConnectorsEditResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MconnCustomerConnectorsEditResponse)) == openjson.toJson(obj)

  test "round-trips MconnCustomerSnapshotsGetSuccess":
    let obj = newMconnCustomerSnapshotsGetSuccess()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MconnCustomerSnapshotsGetSuccess)) == openjson.toJson(obj)

  test "round-trips MconnInterrupt":
    let obj = newMconnInterrupt()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MconnInterrupt)) == openjson.toJson(obj)

  test "round-trips MconnCustomerConnectorsUpdateRequest":
    let obj = newMconnCustomerConnectorsUpdateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MconnCustomerConnectorsUpdateRequest)) == openjson.toJson(obj)

  test "round-trips MconnCustomerSnapshotsLatestGetSuccess":
    let obj = newMconnCustomerSnapshotsLatestGetSuccess()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MconnCustomerSnapshotsLatestGetSuccess)) == openjson.toJson(obj)

  test "round-trips MconnCustomerConnectorsUpdateResponse":
    let obj = newMconnCustomerConnectorsUpdateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MconnCustomerConnectorsUpdateResponse)) == openjson.toJson(obj)

  test "round-trips MconnCustomerConnectorsEditRequest":
    let obj = newMconnCustomerConnectorsEditRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MconnCustomerConnectorsEditRequest)) == openjson.toJson(obj)

  test "round-trips MconnCustomerEventsGetSuccess":
    let obj = newMconnCustomerEventsGetSuccess()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MconnCustomerEventsGetSuccess)) == openjson.toJson(obj)

  test "round-trips MconnCustomerEventsListSuccess":
    let obj = newMconnCustomerEventsListSuccess()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MconnCustomerEventsListSuccess)) == openjson.toJson(obj)

  test "round-trips MconnBadResponse":
    let obj = newMconnBadResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MconnBadResponse)) == openjson.toJson(obj)

  test "round-trips MconnConnectorInterruptsListResponse":
    let obj = newMconnConnectorInterruptsListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MconnConnectorInterruptsListResponse)) == openjson.toJson(obj)

  test "round-trips MconnCustomerConnectorsCreateResponse":
    let obj = newMconnCustomerConnectorsCreateResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MconnCustomerConnectorsCreateResponse)) == openjson.toJson(obj)

  test "round-trips MconnCustomerSnapshotsListSuccess":
    let obj = newMconnCustomerSnapshotsListSuccess()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MconnCustomerSnapshotsListSuccess)) == openjson.toJson(obj)

  test "round-trips MconnCustomerConnectorsDeleteResponse":
    let obj = newMconnCustomerConnectorsDeleteResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MconnCustomerConnectorsDeleteResponse)) == openjson.toJson(obj)

  test "round-trips MconnEnvelope":
    let obj = newMconnEnvelope()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MconnEnvelope)) == openjson.toJson(obj)

  test "round-trips MconnCustomerEventsLatestGetSuccess":
    let obj = newMconnCustomerEventsLatestGetSuccess()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MconnCustomerEventsLatestGetSuccess)) == openjson.toJson(obj)

suite "magic_connectors endpoints":
  test "GET /accounts/{account_id}/magic/connectors":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicConnectors("test", {})

  test "POST /accounts/{account_id}/magic/connectors":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicConnectors("test", newMconnCustomerConnectorsCreateRequest())

  test "GET /accounts/{account_id}/magic/connectors/{connector_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicConnectorsConnectorId("test", "test")

  test "PUT /accounts/{account_id}/magic/connectors/{connector_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMagicConnectorsConnectorId("test", "test", newMconnCustomerConnectorsUpdateRequest())

  test "DELETE /accounts/{account_id}/magic/connectors/{connector_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicConnectorsConnectorId("test", "test")

  test "PATCH /accounts/{account_id}/magic/connectors/{connector_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdMagicConnectorsConnectorId("test", "test", newMconnCustomerConnectorsEditRequest())

  test "GET /accounts/{account_id}/magic/connectors/{connector_id}/interrupts":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicConnectorsConnectorIdInterrupts("test", "test")

  test "POST /accounts/{account_id}/magic/connectors/{connector_id}/interrupts":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicConnectorsConnectorIdInterrupts("test", "test", newMconnInterrupt())

  test "GET /accounts/{account_id}/magic/connectors/{connector_id}/telemetry/events":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicConnectorsConnectorIdTelemetryEvents("test", "test", 1.0, 1.0, 1.0, "test", "test")

  test "GET /accounts/{account_id}/magic/connectors/{connector_id}/telemetry/events/latest":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicConnectorsConnectorIdTelemetryEventsLatest("test", "test")

  test "GET /accounts/{account_id}/magic/connectors/{connector_id}/telemetry/events/{event_t}.{event_n}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicConnectorsConnectorIdTelemetryEventsEventTEventN("test", "test", 1.0, 1.0)

  test "GET /accounts/{account_id}/magic/connectors/{connector_id}/telemetry/snapshots":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicConnectorsConnectorIdTelemetrySnapshots("test", "test", 1.0, 1.0, 1.0, "test")

  test "GET /accounts/{account_id}/magic/connectors/{connector_id}/telemetry/snapshots/latest":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicConnectorsConnectorIdTelemetrySnapshotsLatest("test", "test")

  test "GET /accounts/{account_id}/magic/connectors/{connector_id}/telemetry/snapshots/{snapshot_t}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicConnectorsConnectorIdTelemetrySnapshotsSnapshotT("test", "test", 1.0)

