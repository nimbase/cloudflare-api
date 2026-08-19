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

suite "magic_static_routes serialization":
  test "round-trips MagicRouteModifiedResponse":
    let obj = newMagicRouteModifiedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicRouteModifiedResponse)) == openjson.toJson(obj)

  test "round-trips MagicRoutesCollectionResponse":
    let obj = newMagicRoutesCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicRoutesCollectionResponse)) == openjson.toJson(obj)

  test "round-trips MagicCreateRouteResponse":
    let obj = newMagicCreateRouteResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicCreateRouteResponse)) == openjson.toJson(obj)

  test "round-trips MagicCreateRouteRequest":
    let obj = newMagicCreateRouteRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicCreateRouteRequest)) == openjson.toJson(obj)

  test "round-trips MagicRouteUpdateRequest":
    let obj = newMagicRouteUpdateRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicRouteUpdateRequest)) == openjson.toJson(obj)

  test "round-trips MagicRouteDeleteManyRequest":
    let obj = newMagicRouteDeleteManyRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicRouteDeleteManyRequest)) == openjson.toJson(obj)

  test "round-trips MagicRouteUpdateManyRequest":
    let obj = newMagicRouteUpdateManyRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicRouteUpdateManyRequest)) == openjson.toJson(obj)

  test "round-trips MagicMultipleRouteModifiedResponse":
    let obj = newMagicMultipleRouteModifiedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicMultipleRouteModifiedResponse)) == openjson.toJson(obj)

  test "round-trips MagicMultipleRouteDeleteResponse":
    let obj = newMagicMultipleRouteDeleteResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicMultipleRouteDeleteResponse)) == openjson.toJson(obj)

  test "round-trips MagicApiResponseCommonFailure":
    let obj = newMagicApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips MagicRouteSingleResponse":
    let obj = newMagicRouteSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicRouteSingleResponse)) == openjson.toJson(obj)

  test "round-trips MagicRouteDeletedResponse":
    let obj = newMagicRouteDeletedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.MagicRouteDeletedResponse)) == openjson.toJson(obj)

suite "magic_static_routes endpoints":
  test "GET /accounts/{account_id}/magic/routes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicRoutes("test")

  test "POST /accounts/{account_id}/magic/routes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicRoutes("test", newMagicCreateRouteRequest())

  test "PUT /accounts/{account_id}/magic/routes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMagicRoutes("test", newMagicRouteUpdateManyRequest())

  test "DELETE /accounts/{account_id}/magic/routes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicRoutes("test", newMagicRouteDeleteManyRequest())

  test "GET /accounts/{account_id}/magic/routes/{route_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicRoutesRouteId("test", "test")

  test "PUT /accounts/{account_id}/magic/routes/{route_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdMagicRoutesRouteId("test", "test", newMagicRouteUpdateRequest())

  test "DELETE /accounts/{account_id}/magic/routes/{route_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicRoutesRouteId("test", "test")

