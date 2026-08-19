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

suite "destinations serialization":
  test "round-trips GetAccountsAccountIdWorkersObservabilityDestinationsResponse":
    let obj = cloudflare.GetAccountsAccountIdWorkersObservabilityDestinationsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdWorkersObservabilityDestinationsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdWorkersObservabilityDestinationsResponse":
    let obj = cloudflare.PostAccountsAccountIdWorkersObservabilityDestinationsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdWorkersObservabilityDestinationsResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdWorkersObservabilityDestinationsSlugResponse":
    let obj = cloudflare.DeleteAccountsAccountIdWorkersObservabilityDestinationsSlugResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdWorkersObservabilityDestinationsSlugResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdWorkersObservabilityDestinationsSlugResponse":
    let obj = cloudflare.PatchAccountsAccountIdWorkersObservabilityDestinationsSlugResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdWorkersObservabilityDestinationsSlugResponse)) == openjson.toJson(obj)

suite "destinations endpoints":
  test "GET /accounts/{account_id}/workers/observability/destinations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdWorkersObservabilityDestinations(1.0, 1.0, {}, {})

  test "DELETE /accounts/{account_id}/workers/observability/destinations/{slug}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdWorkersObservabilityDestinationsSlug("test")

