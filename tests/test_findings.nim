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

suite "findings serialization":
  test "round-trips PostureApiFindingInstanceBulkActionRequest":
    let obj = newPostureApiFindingInstanceBulkActionRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiFindingInstanceBulkActionRequest)) == openjson.toJson(obj)

  test "round-trips PostureApiFindingResponse":
    let obj = newPostureApiFindingResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiFindingResponse)) == openjson.toJson(obj)

  test "round-trips PostureApiFindingInstanceResponse":
    let obj = newPostureApiFindingInstanceResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiFindingInstanceResponse)) == openjson.toJson(obj)

  test "round-trips PostureApiTuneFindingSeverityRequest":
    let obj = newPostureApiTuneFindingSeverityRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiTuneFindingSeverityRequest)) == openjson.toJson(obj)

  test "round-trips PostureApiPaginatedFindingList":
    let obj = newPostureApiPaginatedFindingList()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiPaginatedFindingList)) == openjson.toJson(obj)

  test "round-trips PostureApiFindingBulkActionRequest":
    let obj = newPostureApiFindingBulkActionRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiFindingBulkActionRequest)) == openjson.toJson(obj)

  test "round-trips PostureApiPaginatedFindingInstanceList":
    let obj = newPostureApiPaginatedFindingInstanceList()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiPaginatedFindingInstanceList)) == openjson.toJson(obj)

  test "round-trips PostureApiErrorResponse":
    let obj = newPostureApiErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiErrorResponse)) == openjson.toJson(obj)

suite "findings endpoints":
  test "POST /accounts/{account_id}/data-security/posture/findings/ignore":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDataSecurityPostureFindingsIgnore("test", newPostureApiFindingBulkActionRequest())

  test "POST /accounts/{account_id}/data-security/posture/findings/unignore":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDataSecurityPostureFindingsUnignore("test", newPostureApiFindingBulkActionRequest())

  test "GET /accounts/{account_id}/data-security/posture/findings/{finding_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDataSecurityPostureFindingsFindingId("test", "test")

  test "POST /accounts/{account_id}/data-security/posture/findings/{finding_id}/instances/archive":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDataSecurityPostureFindingsFindingIdInstancesArchive("test", "test", newPostureApiFindingInstanceBulkActionRequest())

  test "POST /accounts/{account_id}/data-security/posture/findings/{finding_id}/instances/unarchive":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDataSecurityPostureFindingsFindingIdInstancesUnarchive("test", "test", newPostureApiFindingInstanceBulkActionRequest())

  test "GET /accounts/{account_id}/data-security/posture/findings/{finding_id}/instances/{instance_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDataSecurityPostureFindingsFindingIdInstancesInstanceId("test", "test", "test")

  test "POST /accounts/{account_id}/data-security/posture/findings/{finding_id}/reset_finding_severity":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDataSecurityPostureFindingsFindingIdResetFindingSeverity("test", "test")

  test "POST /accounts/{account_id}/data-security/posture/findings/{finding_id}/tune_finding_severity":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDataSecurityPostureFindingsFindingIdTuneFindingSeverity("test", "test", newPostureApiTuneFindingSeverityRequest())

