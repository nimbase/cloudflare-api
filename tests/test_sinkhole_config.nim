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

suite "sinkhole_config serialization":
  test "round-trips IntelSinkholesSinkholeCreateParams":
    let obj = newIntelSinkholesSinkholeCreateParams()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IntelSinkholesSinkholeCreateParams)) == openjson.toJson(obj)

  test "round-trips IntelSinkholesIngressCollectionResponse":
    let obj = newIntelSinkholesIngressCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IntelSinkholesIngressCollectionResponse)) == openjson.toJson(obj)

  test "round-trips IntelSinkholesSinkholeSingleResponse":
    let obj = newIntelSinkholesSinkholeSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IntelSinkholesSinkholeSingleResponse)) == openjson.toJson(obj)

  test "round-trips IntelSinkholesSinkholeCollectionResponse":
    let obj = newIntelSinkholesSinkholeCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IntelSinkholesSinkholeCollectionResponse)) == openjson.toJson(obj)

  test "round-trips IntelSinkholesApiResponseCommonFailure2":
    let obj = newIntelSinkholesApiResponseCommonFailure2()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IntelSinkholesApiResponseCommonFailure2)) == openjson.toJson(obj)

  test "round-trips IntelSinkholesIngressCreateParams":
    let obj = newIntelSinkholesIngressCreateParams()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IntelSinkholesIngressCreateParams)) == openjson.toJson(obj)

  test "round-trips IntelSinkholesIngressSingleResponse":
    let obj = newIntelSinkholesIngressSingleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IntelSinkholesIngressSingleResponse)) == openjson.toJson(obj)

  test "round-trips IntelSinkholesApiResponseSingleEmpty":
    let obj = newIntelSinkholesApiResponseSingleEmpty()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IntelSinkholesApiResponseSingleEmpty)) == openjson.toJson(obj)

suite "sinkhole_config endpoints":
  test "GET /accounts/{account_id}/intel/sinkholes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIntelSinkholes("test")

  test "POST /accounts/{account_id}/intel/sinkholes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdIntelSinkholes("test", newIntelSinkholesSinkholeCreateParams())

  test "GET /accounts/{account_id}/intel/sinkholes/{sinkhole_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIntelSinkholesSinkholeId("test", "test")

  test "PUT /accounts/{account_id}/intel/sinkholes/{sinkhole_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdIntelSinkholesSinkholeId("test", "test", newIntelSinkholesSinkholeCreateParams())

  test "DELETE /accounts/{account_id}/intel/sinkholes/{sinkhole_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdIntelSinkholesSinkholeId("test", "test")

  test "GET /accounts/{account_id}/intel/sinkholes/{sinkhole_id}/ingresses":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIntelSinkholesSinkholeIdIngresses("test", "test")

  test "POST /zones/{zone_id}/intel/sinkholes/{sinkhole_id}/ingresses":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdIntelSinkholesSinkholeIdIngresses("test", "test", newIntelSinkholesIngressCreateParams())

  test "GET /zones/{zone_id}/intel/sinkholes/{sinkhole_id}/ingresses/{ingress_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdIntelSinkholesSinkholeIdIngressesIngressId("test", "test", "test")

  test "PUT /zones/{zone_id}/intel/sinkholes/{sinkhole_id}/ingresses/{ingress_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdIntelSinkholesSinkholeIdIngressesIngressId("test", "test", "test", newIntelSinkholesIngressCreateParams())

  test "DELETE /zones/{zone_id}/intel/sinkholes/{sinkhole_id}/ingresses/{ingress_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdIntelSinkholesSinkholeIdIngressesIngressId("test", "test", "test")

