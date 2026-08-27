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

suite "applications serialization":
  test "round-trips AlexandriaCreateApplicationRequest":
    let obj = newAlexandriaCreateApplicationRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AlexandriaCreateApplicationRequest)) == openjson.toJson(obj)

  test "round-trips CcContainersDeleteApplicationResponseBody":
    let obj = newCcContainersDeleteApplicationResponseBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcContainersDeleteApplicationResponseBody)) == openjson.toJson(obj)

  test "round-trips OnePaginatedApplicationListList":
    let obj = newOnePaginatedApplicationListList()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OnePaginatedApplicationListList)) == openjson.toJson(obj)

  test "round-trips OnePaginatedAuthMethodDetailList":
    let obj = newOnePaginatedAuthMethodDetailList()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OnePaginatedAuthMethodDetailList)) == openjson.toJson(obj)

  test "round-trips AlexandriaDeleteApplicationConflictResponse":
    let obj = newAlexandriaDeleteApplicationConflictResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AlexandriaDeleteApplicationConflictResponse)) == openjson.toJson(obj)

  test "round-trips OneApplicationDetailResponse":
    let obj = newOneApplicationDetailResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OneApplicationDetailResponse)) == openjson.toJson(obj)

  test "round-trips AlexandriaGetApplicationResponse":
    let obj = newAlexandriaGetApplicationResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AlexandriaGetApplicationResponse)) == openjson.toJson(obj)

  test "round-trips AlexandriaDeleteApplicationResponse":
    let obj = newAlexandriaDeleteApplicationResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AlexandriaDeleteApplicationResponse)) == openjson.toJson(obj)

  test "round-trips CcApplicationVersion":
    let obj = newCcApplicationVersion()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcApplicationVersion)) == openjson.toJson(obj)

  test "round-trips AlexandriaApiResponseCommonFailure":
    let obj = newAlexandriaApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AlexandriaApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips CcV4BaseResponse":
    let obj = newCcV4BaseResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcV4BaseResponse)) == openjson.toJson(obj)

  test "round-trips CcContainersApplicationResponse":
    let obj = newCcContainersApplicationResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcContainersApplicationResponse)) == openjson.toJson(obj)

  test "round-trips OnePaginatedSetupFlowList":
    let obj = newOnePaginatedSetupFlowList()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.OnePaginatedSetupFlowList)) == openjson.toJson(obj)

  test "round-trips CcV4BaseErrorResponse":
    let obj = newCcV4BaseErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcV4BaseErrorResponse)) == openjson.toJson(obj)

  test "round-trips AlexandriaGetApplicationsResponse":
    let obj = newAlexandriaGetApplicationsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AlexandriaGetApplicationsResponse)) == openjson.toJson(obj)

  test "round-trips CcContainersCreateApplicationRequest":
    let obj = newCcContainersCreateApplicationRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcContainersCreateApplicationRequest)) == openjson.toJson(obj)

  test "round-trips AlexandriaUpdateApplicationRequest":
    let obj = newAlexandriaUpdateApplicationRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AlexandriaUpdateApplicationRequest)) == openjson.toJson(obj)

  test "round-trips CcContainersModifyApplicationRequestBody":
    let obj = newCcContainersModifyApplicationRequestBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CcContainersModifyApplicationRequestBody)) == openjson.toJson(obj)

suite "applications endpoints":
  test "GET /accounts/{account_id}/containers/applications":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdContainersApplications("test", "test")

  test "POST /accounts/{account_id}/containers/applications":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdContainersApplications(newCcContainersCreateApplicationRequest())

  test "GET /accounts/{account_id}/containers/applications/{application_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdContainersApplicationsApplicationId("test")

  test "DELETE /accounts/{account_id}/containers/applications/{application_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdContainersApplicationsApplicationId("test")

  test "PATCH /accounts/{account_id}/containers/applications/{application_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdContainersApplicationsApplicationId("test", newCcContainersModifyApplicationRequestBody())

  test "GET /accounts/{account_id}/containers/applications/{application_id}/versions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdContainersApplicationsApplicationIdVersions("test")

  test "GET /accounts/{account_id}/one/applications":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdOneApplications("test", "test", 1, 1)

  test "GET /accounts/{account_id}/resource-library/applications":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdResourceLibraryApplications("test", "test", 1, 1, "test", "test", "test")

  test "POST /accounts/{account_id}/resource-library/applications":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdResourceLibraryApplications("test", newAlexandriaCreateApplicationRequest())

  test "GET /accounts/{account_id}/resource-library/applications/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdResourceLibraryApplicationsId("test", 1)

  test "DELETE /accounts/{account_id}/resource-library/applications/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdResourceLibraryApplicationsId("test", 1)

  test "PATCH /accounts/{account_id}/resource-library/applications/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdResourceLibraryApplicationsId("test", 1, newAlexandriaUpdateApplicationRequest())

