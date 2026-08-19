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

suite "domains serialization":
  test "round-trips WorkersApiResponseCommon":
    let obj = newWorkersApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips WorkersApiResponseCommonFailure":
    let obj = newWorkersApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips WorkersDomain":
    let obj = newWorkersDomain()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersDomain)) == openjson.toJson(obj)

  test "round-trips WorkersApiResponseCollection":
    let obj = newWorkersApiResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.WorkersApiResponseCollection)) == openjson.toJson(obj)

suite "domains endpoints":
  test "GET /accounts/{account_id}/workers/domains":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersDomains("test", "test", "test", "test", "test", "test")

  test "PUT /accounts/{account_id}/workers/domains":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdWorkersDomains("test")

  test "GET /accounts/{account_id}/workers/domains/{domain_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersDomainsDomainId("test", "test")

  test "DELETE /accounts/{account_id}/workers/domains/{domain_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdWorkersDomainsDomainId("test", "test")

