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
  test "module imports cleanly":
    check true

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

  test "POST /accounts/{account_id}/artifacts/namespaces/{namespace}/repos":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdArtifactsNamespacesNamespaceRepos("test")

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

  test "POST /accounts/{account_id}/artifacts/namespaces/{namespace}/repos/{name}/fork":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdArtifactsNamespacesNamespaceReposNameFork("test", "test")

  test "POST /accounts/{account_id}/artifacts/namespaces/{namespace}/repos/{name}/import":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdArtifactsNamespacesNamespaceReposNameImport("test", "test")

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

  test "POST /accounts/{account_id}/artifacts/namespaces/{namespace}/tokens":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdArtifactsNamespacesNamespaceTokens("test")

  test "DELETE /accounts/{account_id}/artifacts/namespaces/{namespace}/tokens/{id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdArtifactsNamespacesNamespaceTokensId("test", "test")

