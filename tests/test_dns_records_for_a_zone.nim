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

suite "dns_records_for_a_zone serialization":
  test "round-trips DnsRecordsApiResponseCommonFailure":
    let obj = newDnsRecordsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsRecordsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DnsRecordsDnsRecordPatch":
    let obj = newDnsRecordsDnsRecordPatch()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsRecordsDnsRecordPatch)) == openjson.toJson(obj)

  test "round-trips DnsRecordsDnsResponseReviewScan":
    let obj = newDnsRecordsDnsResponseReviewScan()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsRecordsDnsResponseReviewScan)) == openjson.toJson(obj)

  test "round-trips DnsRecordsDnsResponseZoneUsage":
    let obj = newDnsRecordsDnsResponseZoneUsage()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsRecordsDnsResponseZoneUsage)) == openjson.toJson(obj)

  test "round-trips DnsRecordsDnsRecordPost":
    let obj = newDnsRecordsDnsRecordPost()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsRecordsDnsRecordPost)) == openjson.toJson(obj)

  test "round-trips DnsRecordsDnsResponseBatch":
    let obj = newDnsRecordsDnsResponseBatch()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsRecordsDnsResponseBatch)) == openjson.toJson(obj)

  test "round-trips DnsRecordsDnsRequestReviewScanObject":
    let obj = newDnsRecordsDnsRequestReviewScanObject()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsRecordsDnsRequestReviewScanObject)) == openjson.toJson(obj)

  test "round-trips DnsRecordsDnsResponseSingle":
    let obj = newDnsRecordsDnsResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsRecordsDnsResponseSingle)) == openjson.toJson(obj)

  test "round-trips DnsRecordsDnsRequestBatchObject":
    let obj = newDnsRecordsDnsRequestBatchObject()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsRecordsDnsRequestBatchObject)) == openjson.toJson(obj)

  test "round-trips DnsRecordsDnsResponseTriggerScan":
    let obj = newDnsRecordsDnsResponseTriggerScan()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsRecordsDnsResponseTriggerScan)) == openjson.toJson(obj)

  test "round-trips DnsRecordsDnsResponseCollection":
    let obj = newDnsRecordsDnsResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsRecordsDnsResponseCollection)) == openjson.toJson(obj)

  test "round-trips DnsRecordsDnsResponseImportScan":
    let obj = newDnsRecordsDnsResponseImportScan()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsRecordsDnsResponseImportScan)) == openjson.toJson(obj)

  test "round-trips DeleteZonesZoneIdDnsRecordsDnsRecordIdResponse":
    let obj = cloudflare.DeleteZonesZoneIdDnsRecordsDnsRecordIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteZonesZoneIdDnsRecordsDnsRecordIdResponse)) == openjson.toJson(obj)

suite "dns_records_for_a_zone endpoints":
  test "POST /zones/{zone_id}/dns_records":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdDnsRecords("test", true, newDnsRecordsDnsRecordPost())

  test "POST /zones/{zone_id}/dns_records/batch":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdDnsRecordsBatch("test", true, newDnsRecordsDnsRequestBatchObject())

  test "GET /zones/{zone_id}/dns_records/export":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdDnsRecordsExport("test")

  test "POST /zones/{zone_id}/dns_records/import":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdDnsRecordsImport("test")

  test "POST /zones/{zone_id}/dns_records/scan":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdDnsRecordsScan("test")

  test "GET /zones/{zone_id}/dns_records/scan/review":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdDnsRecordsScanReview("test")

  test "POST /zones/{zone_id}/dns_records/scan/review":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdDnsRecordsScanReview("test", newDnsRecordsDnsRequestReviewScanObject())

  test "POST /zones/{zone_id}/dns_records/scan/trigger":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdDnsRecordsScanTrigger("test")

  test "GET /zones/{zone_id}/dns_records/usage":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdDnsRecordsUsage("test")

  test "GET /zones/{zone_id}/dns_records/{dns_record_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdDnsRecordsDnsRecordId("test", "test", true)

  test "PUT /zones/{zone_id}/dns_records/{dns_record_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putZonesZoneIdDnsRecordsDnsRecordId("test", "test", true, newDnsRecordsDnsRecordPost())

  test "DELETE /zones/{zone_id}/dns_records/{dns_record_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdDnsRecordsDnsRecordId("test", "test")

  test "PATCH /zones/{zone_id}/dns_records/{dns_record_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdDnsRecordsDnsRecordId("test", "test", true, newDnsRecordsDnsRecordPatch())

