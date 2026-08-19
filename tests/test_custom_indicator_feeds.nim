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

suite "custom_indicator_feeds serialization":
  test "round-trips CustomIndicatorFeedsUpdateFeedResponse":
    let obj = newCustomIndicatorFeedsUpdateFeedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CustomIndicatorFeedsUpdateFeedResponse)) == openjson.toJson(obj)

  test "round-trips CustomIndicatorFeedsCreateProviderResponse":
    let obj = newCustomIndicatorFeedsCreateProviderResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CustomIndicatorFeedsCreateProviderResponse)) == openjson.toJson(obj)

  test "round-trips CustomIndicatorFeedsPermissionsRequest":
    let obj = newCustomIndicatorFeedsPermissionsRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CustomIndicatorFeedsPermissionsRequest)) == openjson.toJson(obj)

  test "round-trips CustomIndicatorFeedsUpdatePublicFieldResponse":
    let obj = newCustomIndicatorFeedsUpdatePublicFieldResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CustomIndicatorFeedsUpdatePublicFieldResponse)) == openjson.toJson(obj)

  test "round-trips CustomIndicatorFeedsIndicatorFeedResponse":
    let obj = newCustomIndicatorFeedsIndicatorFeedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CustomIndicatorFeedsIndicatorFeedResponse)) == openjson.toJson(obj)

  test "round-trips CustomIndicatorFeedsPermissionsResponse":
    let obj = newCustomIndicatorFeedsPermissionsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CustomIndicatorFeedsPermissionsResponse)) == openjson.toJson(obj)

  test "round-trips CustomIndicatorFeedsUploadStatusResponse":
    let obj = newCustomIndicatorFeedsUploadStatusResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CustomIndicatorFeedsUploadStatusResponse)) == openjson.toJson(obj)

  test "round-trips CustomIndicatorFeedsEnqueueUploadResponse":
    let obj = newCustomIndicatorFeedsEnqueueUploadResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CustomIndicatorFeedsEnqueueUploadResponse)) == openjson.toJson(obj)

  test "round-trips CustomIndicatorFeedsCreateProviderRequest":
    let obj = newCustomIndicatorFeedsCreateProviderRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CustomIndicatorFeedsCreateProviderRequest)) == openjson.toJson(obj)

  test "round-trips CustomIndicatorFeedsCreateFeedResponse":
    let obj = newCustomIndicatorFeedsCreateFeedResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CustomIndicatorFeedsCreateFeedResponse)) == openjson.toJson(obj)

  test "round-trips CustomIndicatorFeedsPermissionListItemResponse":
    let obj = newCustomIndicatorFeedsPermissionListItemResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CustomIndicatorFeedsPermissionListItemResponse)) == openjson.toJson(obj)

  test "round-trips CustomIndicatorFeedsUpdatePublicFieldRequest":
    let obj = newCustomIndicatorFeedsUpdatePublicFieldRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CustomIndicatorFeedsUpdatePublicFieldRequest)) == openjson.toJson(obj)

  test "round-trips CustomIndicatorFeedsCreateFeed":
    let obj = newCustomIndicatorFeedsCreateFeed()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CustomIndicatorFeedsCreateFeed)) == openjson.toJson(obj)

  test "round-trips CustomIndicatorFeedsIndicatorFeedMetadataResponse":
    let obj = newCustomIndicatorFeedsIndicatorFeedMetadataResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CustomIndicatorFeedsIndicatorFeedMetadataResponse)) == openjson.toJson(obj)

  test "round-trips CustomIndicatorFeedsApiResponseCommonFailure":
    let obj = newCustomIndicatorFeedsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CustomIndicatorFeedsApiResponseCommonFailure)) == openjson.toJson(obj)

suite "custom_indicator_feeds endpoints":
  test "GET /accounts/{account_id}/intel/indicator-feeds":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIntelIndicatorFeeds("test")

  test "POST /accounts/{account_id}/intel/indicator-feeds":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdIntelIndicatorFeeds("test", newCustomIndicatorFeedsCreateFeed())

  test "PUT /accounts/{account_id}/intel/indicator-feeds/permissions/add":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdIntelIndicatorFeedsPermissionsAdd("test", newCustomIndicatorFeedsPermissionsRequest())

  test "PUT /accounts/{account_id}/intel/indicator-feeds/permissions/createProvider":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdIntelIndicatorFeedsPermissionsCreateProvider("test", newCustomIndicatorFeedsCreateProviderRequest())

  test "PUT /accounts/{account_id}/intel/indicator-feeds/permissions/remove":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdIntelIndicatorFeedsPermissionsRemove("test", newCustomIndicatorFeedsPermissionsRequest())

  test "GET /accounts/{account_id}/intel/indicator-feeds/permissions/view":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIntelIndicatorFeedsPermissionsView("test")

  test "GET /accounts/{account_id}/intel/indicator-feeds/{feed_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIntelIndicatorFeedsFeedId("test", 1)

  test "PUT /accounts/{account_id}/intel/indicator-feeds/{feed_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdIntelIndicatorFeedsFeedId("test", 1, newCustomIndicatorFeedsUpdatePublicFieldRequest())

  test "GET /accounts/{account_id}/intel/indicator-feeds/{feed_id}/data":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIntelIndicatorFeedsFeedIdData("test", 1)

  test "GET /accounts/{account_id}/intel/indicator-feeds/{feed_id}/download":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIntelIndicatorFeedsFeedIdDownload("test", 1)

  test "PUT /accounts/{account_id}/intel/indicator-feeds/{feed_id}/snapshot":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdIntelIndicatorFeedsFeedIdSnapshot("test", 1)

  test "GET /accounts/{account_id}/intel/indicator-feeds/{feed_id}/uploads/{upload_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdIntelIndicatorFeedsFeedIdUploadsUploadId("test", 1, 1)

