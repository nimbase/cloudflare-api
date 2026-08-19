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

suite "webhooks serialization":
  test "round-trips PostureApiWebhook":
    let obj = newPostureApiWebhook()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiWebhook)) == openjson.toJson(obj)

  test "round-trips PostureApiEvaluateNewWebhookResponse":
    let obj = newPostureApiEvaluateNewWebhookResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiEvaluateNewWebhookResponse)) == openjson.toJson(obj)

  test "round-trips PostureApiUpdateWebhookRequest":
    let obj = newPostureApiUpdateWebhookRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiUpdateWebhookRequest)) == openjson.toJson(obj)

  test "round-trips PostureApiCreateWebhookJobsResponse":
    let obj = newPostureApiCreateWebhookJobsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiCreateWebhookJobsResponse)) == openjson.toJson(obj)

  test "round-trips PostureApiWebhookListResponse":
    let obj = newPostureApiWebhookListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiWebhookListResponse)) == openjson.toJson(obj)

  test "round-trips PostureApiWebhookResponse":
    let obj = newPostureApiWebhookResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiWebhookResponse)) == openjson.toJson(obj)

  test "round-trips PostureApiCreateWebhookRequest":
    let obj = newPostureApiCreateWebhookRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiCreateWebhookRequest)) == openjson.toJson(obj)

  test "round-trips RealtimekitWebhookRequest":
    let obj = newRealtimekitWebhookRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitWebhookRequest)) == openjson.toJson(obj)

  test "round-trips RealtimekitWebhookEventsSuccessResponse":
    let obj = newRealtimekitWebhookEventsSuccessResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitWebhookEventsSuccessResponse)) == openjson.toJson(obj)

  test "round-trips RealtimekitErrorResponse":
    let obj = newRealtimekitErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitErrorResponse)) == openjson.toJson(obj)

  test "round-trips RealtimekitPatchWebhookRequest":
    let obj = newRealtimekitPatchWebhookRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitPatchWebhookRequest)) == openjson.toJson(obj)

  test "round-trips RealtimekitWebhookSuccessResponse":
    let obj = newRealtimekitWebhookSuccessResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitWebhookSuccessResponse)) == openjson.toJson(obj)

  test "round-trips PostureApiCreateWebhookJobsRequest":
    let obj = newPostureApiCreateWebhookJobsRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiCreateWebhookJobsRequest)) == openjson.toJson(obj)

  test "round-trips RealtimekitWebhooksListSuccessResponse":
    let obj = newRealtimekitWebhooksListSuccessResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.RealtimekitWebhooksListSuccessResponse)) == openjson.toJson(obj)

  test "round-trips PostureApiApiResponseCommon":
    let obj = newPostureApiApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips PostureApiErrorResponse":
    let obj = newPostureApiErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiErrorResponse)) == openjson.toJson(obj)

  test "round-trips PostureApiEvaluateNewWebhookRequest":
    let obj = newPostureApiEvaluateNewWebhookRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostureApiEvaluateNewWebhookRequest)) == openjson.toJson(obj)

suite "webhooks endpoints":
  test "GET /accounts/{account_id}/data-security/posture/webhooks":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDataSecurityPostureWebhooks("test")

  test "POST /accounts/{account_id}/data-security/posture/webhooks":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDataSecurityPostureWebhooks("test", newPostureApiCreateWebhookRequest())

  test "POST /accounts/{account_id}/data-security/posture/webhooks/evaluate":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDataSecurityPostureWebhooksEvaluate("test", newPostureApiEvaluateNewWebhookRequest())

  test "POST /accounts/{account_id}/data-security/posture/webhooks/jobs":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDataSecurityPostureWebhooksJobs("test", newPostureApiCreateWebhookJobsRequest())

  test "GET /accounts/{account_id}/data-security/posture/webhooks/{webhook_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdDataSecurityPostureWebhooksWebhookId("test", "test")

  test "PUT /accounts/{account_id}/data-security/posture/webhooks/{webhook_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdDataSecurityPostureWebhooksWebhookId("test", "test", newPostureApiUpdateWebhookRequest())

  test "DELETE /accounts/{account_id}/data-security/posture/webhooks/{webhook_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdDataSecurityPostureWebhooksWebhookId("test", "test")

  test "POST /accounts/{account_id}/data-security/posture/webhooks/{webhook_id}/evaluate":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdDataSecurityPostureWebhooksWebhookIdEvaluate("test", "test")

  test "GET /accounts/{account_id}/realtime/kit/{app_id}/webhooks":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdWebhooks("test", "test")

  test "POST /accounts/{account_id}/realtime/kit/{app_id}/webhooks":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdRealtimeKitAppIdWebhooks("test", "test", newRealtimekitWebhookRequest())

  test "GET /accounts/{account_id}/realtime/kit/{app_id}/webhooks/all":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdWebhooksAll("test", "test")

  test "GET /accounts/{account_id}/realtime/kit/{app_id}/webhooks/{webhook_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdRealtimeKitAppIdWebhooksWebhookId("test", "test", "test")

  test "PUT /accounts/{account_id}/realtime/kit/{app_id}/webhooks/{webhook_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdRealtimeKitAppIdWebhooksWebhookId("test", "test", "test", newRealtimekitWebhookRequest())

  test "DELETE /accounts/{account_id}/realtime/kit/{app_id}/webhooks/{webhook_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdRealtimeKitAppIdWebhooksWebhookId("test", "test", "test")

  test "PATCH /accounts/{account_id}/realtime/kit/{app_id}/webhooks/{webhook_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdRealtimeKitAppIdWebhooksWebhookId("test", "test", "test", newRealtimekitPatchWebhookRequest())

