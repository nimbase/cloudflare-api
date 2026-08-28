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

suite "artifacts serialization":
  test "round-trips GetAccountsAccountIdArtifactsNamespacesResponse":
    let obj = cloudflare.GetAccountsAccountIdArtifactsNamespacesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdArtifactsNamespacesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdArtifactsNamespacesNamespaceResponse":
    let obj = cloudflare.GetAccountsAccountIdArtifactsNamespacesNamespaceResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdArtifactsNamespacesNamespaceResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdArtifactsNamespacesNamespaceReposResponse":
    let obj = cloudflare.GetAccountsAccountIdArtifactsNamespacesNamespaceReposResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdArtifactsNamespacesNamespaceReposResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdArtifactsNamespacesNamespaceReposResponse":
    let obj = cloudflare.PostAccountsAccountIdArtifactsNamespacesNamespaceReposResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdArtifactsNamespacesNamespaceReposResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameResponse":
    let obj = cloudflare.GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdArtifactsNamespacesNamespaceReposNameResponse":
    let obj = cloudflare.DeleteAccountsAccountIdArtifactsNamespacesNamespaceReposNameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdArtifactsNamespacesNamespaceReposNameResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameCommitHashResponse":
    let obj = cloudflare.GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameCommitHashResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameCommitHashResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdArtifactsNamespacesNamespaceReposNameForkResponse":
    let obj = cloudflare.PostAccountsAccountIdArtifactsNamespacesNamespaceReposNameForkResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdArtifactsNamespacesNamespaceReposNameForkResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdArtifactsNamespacesNamespaceReposNameImportResponse":
    let obj = cloudflare.PostAccountsAccountIdArtifactsNamespacesNamespaceReposNameImportResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdArtifactsNamespacesNamespaceReposNameImportResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameLogResponse":
    let obj = cloudflare.GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameLogResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameLogResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameTokensResponse":
    let obj = cloudflare.GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameTokensResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameTokensResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameTreeHashResponse":
    let obj = cloudflare.GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameTreeHashResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameTreeHashResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdArtifactsNamespacesNamespaceTokensResponse":
    let obj = cloudflare.PostAccountsAccountIdArtifactsNamespacesNamespaceTokensResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdArtifactsNamespacesNamespaceTokensResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdArtifactsNamespacesNamespaceTokensIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdArtifactsNamespacesNamespaceTokensIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdArtifactsNamespacesNamespaceTokensIdResponse)) == openjson.toJson(obj)

suite "artifacts endpoints":
  test "GET /accounts/{account_id}/artifacts/namespaces":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdArtifactsNamespaces(1, "test")

  test "GET /accounts/{account_id}/artifacts/namespaces/{namespace}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdArtifactsNamespacesNamespace("test")

  test "GET /accounts/{account_id}/artifacts/namespaces/{namespace}/repos":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdArtifactsNamespacesNamespaceRepos("test", 1, "test", "test", {}, {})

  test "GET /accounts/{account_id}/artifacts/namespaces/{namespace}/repos/{name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdArtifactsNamespacesNamespaceReposName("test", "test")

  test "DELETE /accounts/{account_id}/artifacts/namespaces/{namespace}/repos/{name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdArtifactsNamespacesNamespaceReposName("test", "test")

  test "GET /accounts/{account_id}/artifacts/namespaces/{namespace}/repos/{name}/blob/{hash}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdArtifactsNamespacesNamespaceReposNameBlobHash("test", "test", "test")

  test "GET /accounts/{account_id}/artifacts/namespaces/{namespace}/repos/{name}/commit/{hash}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdArtifactsNamespacesNamespaceReposNameCommitHash("test", "test", "test")

  test "GET /accounts/{account_id}/artifacts/namespaces/{namespace}/repos/{name}/file":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdArtifactsNamespacesNamespaceReposNameFile("test", "test", "test", "test")

  test "GET /accounts/{account_id}/artifacts/namespaces/{namespace}/repos/{name}/log":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdArtifactsNamespacesNamespaceReposNameLog("test", "test", "test", 1, 1)

  test "GET /accounts/{account_id}/artifacts/namespaces/{namespace}/repos/{name}/raw/{ref}/{path}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdArtifactsNamespacesNamespaceReposNameRawRefPath("test", "test", "test", "test")

  test "GET /accounts/{account_id}/artifacts/namespaces/{namespace}/repos/{name}/tokens":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdArtifactsNamespacesNamespaceReposNameTokens("test", "test", {}, 1, 1)

  test "GET /accounts/{account_id}/artifacts/namespaces/{namespace}/repos/{name}/tree/{hash}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdArtifactsNamespacesNamespaceReposNameTreeHash("test", "test", "test")

  test "DELETE /accounts/{account_id}/artifacts/namespaces/{namespace}/tokens/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdArtifactsNamespacesNamespaceTokensId("test", "test")

