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

suite "permissions serialization":
  test "round-trips PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissionsResponse":
    let obj = cloudflare.PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissionsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissionsResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissionsGrantIdResponse":
    let obj = cloudflare.PutAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissionsGrantIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissionsGrantIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissionsGrantIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissionsGrantIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissionsGrantIdResponse)) == openjson.toJson(obj)

suite "permissions endpoints":
  test "GET /accounts/{account_id}/cloudforce-one/events/dataset/{dataset_id}/permissions":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissions("test", "test")

  test "DELETE /accounts/{account_id}/cloudforce-one/events/dataset/{dataset_id}/permissions/{grant_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissionsGrantId("test", "test", "test")

