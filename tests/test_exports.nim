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

suite "exports serialization":
  test "round-trips PostureApiContentExportRequest":
    let obj = newPostureApiContentExportRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiContentExportRequest)) == openjson.toJson(obj)

  test "round-trips PostureApiExportJobResponse":
    let obj = newPostureApiExportJobResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiExportJobResponse)) == openjson.toJson(obj)

  test "round-trips PostureApiRemediationJobsExportFilterRequest":
    let obj = newPostureApiRemediationJobsExportFilterRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiRemediationJobsExportFilterRequest)) == openjson.toJson(obj)

  test "round-trips PostureApiPaginatedExportJobList":
    let obj = newPostureApiPaginatedExportJobList()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiPaginatedExportJobList)) == openjson.toJson(obj)

  test "round-trips PostureApiFindingExportFilterRequest":
    let obj = newPostureApiFindingExportFilterRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiFindingExportFilterRequest)) == openjson.toJson(obj)

  test "round-trips PostureApiFindingInstanceExportFilterRequest":
    let obj = newPostureApiFindingInstanceExportFilterRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiFindingInstanceExportFilterRequest)) == openjson.toJson(obj)

suite "exports endpoints":
  test "POST /accounts/{account_id}/data-security/posture/content/export":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDataSecurityPostureContentExport("test", newPostureApiContentExportRequest())

  test "GET /accounts/{account_id}/data-security/posture/exports/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDataSecurityPostureExportsId("test", "test")

  test "POST /accounts/{account_id}/data-security/posture/findings/export":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDataSecurityPostureFindingsExport("test", newPostureApiFindingExportFilterRequest())

  test "POST /accounts/{account_id}/data-security/posture/findings/{storage_namespace_id}/instances/export":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDataSecurityPostureFindingsStorageNamespaceIdInstancesExport("test", "test", newPostureApiFindingInstanceExportFilterRequest())

  test "POST /accounts/{account_id}/data-security/posture/remediations/jobs/export":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDataSecurityPostureRemediationsJobsExport("test", newPostureApiRemediationJobsExportFilterRequest())

