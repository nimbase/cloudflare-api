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

suite "finding_types serialization":
  test "round-trips PostureApiPaginatedFindingTypeList":
    let obj = newPostureApiPaginatedFindingTypeList()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiPaginatedFindingTypeList)) == openjson.toJson(obj)

  test "round-trips PostureApiFindingTypeResponse":
    let obj = newPostureApiFindingTypeResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiFindingTypeResponse)) == openjson.toJson(obj)

  test "round-trips PostureApiPaginatedRemediationTypeList":
    let obj = newPostureApiPaginatedRemediationTypeList()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiPaginatedRemediationTypeList)) == openjson.toJson(obj)

suite "finding_types endpoints":
  test "GET /accounts/{account_id}/data-security/posture/finding_types":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDataSecurityPostureFindingTypes("test", 1, 1, @["test"], "test")

  test "GET /accounts/{account_id}/data-security/posture/finding_types/{finding_type_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDataSecurityPostureFindingTypesFindingTypeId("test", "test")

  test "GET /accounts/{account_id}/data-security/posture/finding_types/{finding_type_id}/remediation_types":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDataSecurityPostureFindingTypesFindingTypeIdRemediationTypes("test", "test", "test", "test", 1, 1)

