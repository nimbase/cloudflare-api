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

suite "resource_sharing serialization":
  test "round-trips ResourceSharingShareResponseCollection":
    let obj = newResourceSharingShareResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceSharingShareResponseCollection)) == openjson.toJson(obj)

  test "round-trips ResourceSharingShareExcludedRecipientResponseSingle":
    let obj = newResourceSharingShareExcludedRecipientResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceSharingShareExcludedRecipientResponseSingle)) == openjson.toJson(obj)

  test "round-trips ResourceSharingUpdateShareRequest":
    let obj = newResourceSharingUpdateShareRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceSharingUpdateShareRequest)) == openjson.toJson(obj)

  test "round-trips ResourceSharingShareResourceResponseCollection":
    let obj = newResourceSharingShareResourceResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceSharingShareResourceResponseCollection)) == openjson.toJson(obj)

  test "round-trips ResourceSharingShareRecipientResponseSingle":
    let obj = newResourceSharingShareRecipientResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceSharingShareRecipientResponseSingle)) == openjson.toJson(obj)

  test "round-trips ResourceSharingShareExcludedRecipientResponseCollection":
    let obj = newResourceSharingShareExcludedRecipientResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceSharingShareExcludedRecipientResponseCollection)) == openjson.toJson(obj)

  test "round-trips ResourceSharingCreateShareExcludedRecipientRequest":
    let obj = newResourceSharingCreateShareExcludedRecipientRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceSharingCreateShareExcludedRecipientRequest)) == openjson.toJson(obj)

  test "round-trips ResourceSharingShareResponseSingle":
    let obj = newResourceSharingShareResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceSharingShareResponseSingle)) == openjson.toJson(obj)

  test "round-trips ResourceSharingShareRecipientResponseCollection":
    let obj = newResourceSharingShareRecipientResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceSharingShareRecipientResponseCollection)) == openjson.toJson(obj)

  test "round-trips ResourceSharingCreateShareResourceRequest":
    let obj = newResourceSharingCreateShareResourceRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceSharingCreateShareResourceRequest)) == openjson.toJson(obj)

  test "round-trips ResourceSharingCreateShareRecipientRequest":
    let obj = newResourceSharingCreateShareRecipientRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceSharingCreateShareRecipientRequest)) == openjson.toJson(obj)

  test "round-trips ResourceSharingUpdateShareResourceRequest":
    let obj = newResourceSharingUpdateShareResourceRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceSharingUpdateShareResourceRequest)) == openjson.toJson(obj)

  test "round-trips ResourceSharingShareResourceResponseSingle":
    let obj = newResourceSharingShareResourceResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceSharingShareResourceResponseSingle)) == openjson.toJson(obj)

  test "round-trips ResourceSharingCreateShareRequest":
    let obj = newResourceSharingCreateShareRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceSharingCreateShareRequest)) == openjson.toJson(obj)

  test "round-trips ResourceSharingApiResponseCommonFailure":
    let obj = newResourceSharingApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ResourceSharingApiResponseCommonFailure)) == openjson.toJson(obj)

suite "resource_sharing endpoints":
  test "POST /accounts/{account_id}/shares":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdShares("test", newResourceSharingCreateShareRequest())

  test "GET /accounts/{account_id}/shares/{share_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSharesShareId("test", "test", true, true)

  test "PUT /accounts/{account_id}/shares/{share_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdSharesShareId("test", "test", newResourceSharingUpdateShareRequest())

  test "DELETE /accounts/{account_id}/shares/{share_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdSharesShareId("test", "test")

  test "GET /accounts/{account_id}/shares/{share_id}/excluded-recipients":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSharesShareIdExcludedRecipients("test", "test", 1, 1)

  test "POST /accounts/{account_id}/shares/{share_id}/excluded-recipients":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdSharesShareIdExcludedRecipients("test", "test", newResourceSharingCreateShareExcludedRecipientRequest())

  test "GET /accounts/{account_id}/shares/{share_id}/excluded-recipients/{excluded_recipient_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSharesShareIdExcludedRecipientsExcludedRecipientId("test", "test", "test")

  test "DELETE /accounts/{account_id}/shares/{share_id}/excluded-recipients/{excluded_recipient_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdSharesShareIdExcludedRecipientsExcludedRecipientId("test", "test", "test")

  test "GET /accounts/{account_id}/shares/{share_id}/recipients":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSharesShareIdRecipients("test", "test", true, 1, 1)

  test "POST /accounts/{account_id}/shares/{share_id}/recipients":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdSharesShareIdRecipients("test", "test", newResourceSharingCreateShareRecipientRequest())

  test "GET /accounts/{account_id}/shares/{share_id}/recipients/{recipient_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSharesShareIdRecipientsRecipientId("test", "test", "test", true)

  test "DELETE /accounts/{account_id}/shares/{share_id}/recipients/{recipient_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdSharesShareIdRecipientsRecipientId("test", "test", "test")

  test "POST /accounts/{account_id}/shares/{share_id}/resources":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdSharesShareIdResources("test", "test", newResourceSharingCreateShareResourceRequest())

  test "GET /accounts/{account_id}/shares/{share_id}/resources/{share_resource_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSharesShareIdResourcesShareResourceId("test", "test", "test")

  test "PUT /accounts/{account_id}/shares/{share_id}/resources/{share_resource_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdSharesShareIdResourcesShareResourceId("test", "test", "test", newResourceSharingUpdateShareResourceRequest())

  test "DELETE /accounts/{account_id}/shares/{share_id}/resources/{share_resource_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdSharesShareIdResourcesShareResourceId("test", "test", "test")

