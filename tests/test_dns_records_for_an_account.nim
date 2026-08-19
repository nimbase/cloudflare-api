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

suite "dns_records_for_an_account serialization":
  test "round-trips DnsRecordsDnsResponseAccountUsage":
    let obj = newDnsRecordsDnsResponseAccountUsage()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsRecordsDnsResponseAccountUsage)) == openjson.toJson(obj)

  test "round-trips DnsRecordsApiResponseCommonFailure":
    let obj = newDnsRecordsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DnsRecordsApiResponseCommonFailure)) == openjson.toJson(obj)

suite "dns_records_for_an_account endpoints":
  test "GET /accounts/{account_id}/dns_records/usage":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDnsRecordsUsage("test")

