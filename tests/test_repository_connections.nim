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

suite "repository_connections serialization":
  test "round-trips BuildsUpsertRepoConnectionResponse":
    let obj = newBuildsUpsertRepoConnectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsUpsertRepoConnectionResponse)) == openjson.toJson(obj)

  test "round-trips BuildsUpsertRepoConnectionRequest":
    let obj = newBuildsUpsertRepoConnectionRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsUpsertRepoConnectionRequest)) == openjson.toJson(obj)

  test "round-trips BuildsErrorResponse":
    let obj = newBuildsErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsErrorResponse)) == openjson.toJson(obj)

  test "round-trips BuildsAPIResponse":
    let obj = newBuildsAPIResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BuildsAPIResponse)) == openjson.toJson(obj)

suite "repository_connections endpoints":
  test "PUT /accounts/{account_id}/builds/repos/connections":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdBuildsReposConnections("test", newBuildsUpsertRepoConnectionRequest())

  test "DELETE /accounts/{account_id}/builds/repos/connections/{repo_connection_uuid}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdBuildsReposConnectionsRepoConnectionUuid("test", "test")

