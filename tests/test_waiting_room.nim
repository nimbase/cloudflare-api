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

suite "waiting_room serialization":
  test "round-trips WaitingroomQueryPreview":
    let obj = newWaitingroomQueryPreview()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WaitingroomQueryPreview)) == openjson.toJson(obj)

  test "round-trips WaitingroomWaitingRoomIdResponse":
    let obj = newWaitingroomWaitingRoomIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WaitingroomWaitingRoomIdResponse)) == openjson.toJson(obj)

  test "round-trips WaitingroomPreviewResponse":
    let obj = newWaitingroomPreviewResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WaitingroomPreviewResponse)) == openjson.toJson(obj)

  test "round-trips WaitingroomSingleResponse":
    let obj = newWaitingroomSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WaitingroomSingleResponse)) == openjson.toJson(obj)

  test "round-trips WaitingroomEventIdResponse":
    let obj = newWaitingroomEventIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WaitingroomEventIdResponse)) == openjson.toJson(obj)

  test "round-trips WaitingroomQueryWaitingroom":
    let obj = newWaitingroomQueryWaitingroom()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WaitingroomQueryWaitingroom)) == openjson.toJson(obj)

  test "round-trips WaitingroomPatchRule":
    let obj = newWaitingroomPatchRule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WaitingroomPatchRule)) == openjson.toJson(obj)

  test "round-trips WaitingroomZoneSettingsResponse":
    let obj = newWaitingroomZoneSettingsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WaitingroomZoneSettingsResponse)) == openjson.toJson(obj)

  test "round-trips WaitingroomEventResponse":
    let obj = newWaitingroomEventResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WaitingroomEventResponse)) == openjson.toJson(obj)

  test "round-trips WaitingroomStatusResponse":
    let obj = newWaitingroomStatusResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WaitingroomStatusResponse)) == openjson.toJson(obj)

  test "round-trips WaitingroomRulesResponseCollection":
    let obj = newWaitingroomRulesResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WaitingroomRulesResponseCollection)) == openjson.toJson(obj)

  test "round-trips WaitingroomEventDetailsResponse":
    let obj = newWaitingroomEventDetailsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WaitingroomEventDetailsResponse)) == openjson.toJson(obj)

  test "round-trips WaitingroomResponseCollection":
    let obj = newWaitingroomResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WaitingroomResponseCollection)) == openjson.toJson(obj)

  test "round-trips WaitingroomApiResponseCommonFailure":
    let obj = newWaitingroomApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WaitingroomApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips WaitingroomCreateRule":
    let obj = newWaitingroomCreateRule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WaitingroomCreateRule)) == openjson.toJson(obj)

  test "round-trips WaitingroomZoneSettings":
    let obj = newWaitingroomZoneSettings()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WaitingroomZoneSettings)) == openjson.toJson(obj)

  test "round-trips WaitingroomEventResponseCollection":
    let obj = newWaitingroomEventResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WaitingroomEventResponseCollection)) == openjson.toJson(obj)

  test "round-trips WaitingroomQueryEvent":
    let obj = newWaitingroomQueryEvent()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WaitingroomQueryEvent)) == openjson.toJson(obj)

suite "waiting_room endpoints":
  test "GET /accounts/{account_id}/waiting_rooms":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWaitingRooms("test", 1.0, 1.0)

  test "GET /zones/{zone_id}/waiting_rooms":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdWaitingRooms("test", 1.0, 1.0)

  test "POST /zones/{zone_id}/waiting_rooms":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdWaitingRooms("test", newWaitingroomQueryWaitingroom())

  test "POST /zones/{zone_id}/waiting_rooms/preview":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdWaitingRoomsPreview("test", newWaitingroomQueryPreview())

  test "GET /zones/{zone_id}/waiting_rooms/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdWaitingRoomsSettings("test")

  test "PUT /zones/{zone_id}/waiting_rooms/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdWaitingRoomsSettings("test", newWaitingroomZoneSettings())

  test "PATCH /zones/{zone_id}/waiting_rooms/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdWaitingRoomsSettings("test", newWaitingroomZoneSettings())

  test "GET /zones/{zone_id}/waiting_rooms/{waiting_room_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdWaitingRoomsWaitingRoomId("test", "test")

  test "PUT /zones/{zone_id}/waiting_rooms/{waiting_room_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdWaitingRoomsWaitingRoomId("test", "test", newWaitingroomQueryWaitingroom())

  test "DELETE /zones/{zone_id}/waiting_rooms/{waiting_room_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdWaitingRoomsWaitingRoomId("test", "test")

  test "PATCH /zones/{zone_id}/waiting_rooms/{waiting_room_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdWaitingRoomsWaitingRoomId("test", "test", newWaitingroomQueryWaitingroom())

  test "GET /zones/{zone_id}/waiting_rooms/{waiting_room_id}/events":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdWaitingRoomsWaitingRoomIdEvents("test", "test", 1.0, 1.0)

  test "POST /zones/{zone_id}/waiting_rooms/{waiting_room_id}/events":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdWaitingRoomsWaitingRoomIdEvents("test", "test", newWaitingroomQueryEvent())

  test "GET /zones/{zone_id}/waiting_rooms/{waiting_room_id}/events/{event_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdWaitingRoomsWaitingRoomIdEventsEventId("test", "test", "test")

  test "PUT /zones/{zone_id}/waiting_rooms/{waiting_room_id}/events/{event_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdWaitingRoomsWaitingRoomIdEventsEventId("test", "test", "test", newWaitingroomQueryEvent())

  test "DELETE /zones/{zone_id}/waiting_rooms/{waiting_room_id}/events/{event_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdWaitingRoomsWaitingRoomIdEventsEventId("test", "test", "test")

  test "PATCH /zones/{zone_id}/waiting_rooms/{waiting_room_id}/events/{event_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdWaitingRoomsWaitingRoomIdEventsEventId("test", "test", "test", newWaitingroomQueryEvent())

  test "GET /zones/{zone_id}/waiting_rooms/{waiting_room_id}/events/{event_id}/details":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdWaitingRoomsWaitingRoomIdEventsEventIdDetails("test", "test", "test")

  test "GET /zones/{zone_id}/waiting_rooms/{waiting_room_id}/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdWaitingRoomsWaitingRoomIdRules("test", "test")

  test "POST /zones/{zone_id}/waiting_rooms/{waiting_room_id}/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdWaitingRoomsWaitingRoomIdRules("test", "test", newWaitingroomCreateRule())

  test "DELETE /zones/{zone_id}/waiting_rooms/{waiting_room_id}/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdWaitingRoomsWaitingRoomIdRulesRuleId("test", "test", "test")

  test "PATCH /zones/{zone_id}/waiting_rooms/{waiting_room_id}/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdWaitingRoomsWaitingRoomIdRulesRuleId("test", "test", "test", newWaitingroomPatchRule())

  test "GET /zones/{zone_id}/waiting_rooms/{waiting_room_id}/status":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdWaitingRoomsWaitingRoomIdStatus("test", "test")

