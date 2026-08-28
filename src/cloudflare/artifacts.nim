# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdArtifactsNamespacesResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdArtifactsNamespacesNamespaceResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdArtifactsNamespacesNamespaceReposResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  PostAccountsAccountIdArtifactsNamespacesNamespaceReposRequest = object
    default_branch: Option[string]
    description: Option[string]
    name: string
    read_only: Option[bool]
  PostAccountsAccountIdArtifactsNamespacesNamespaceReposResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  DeleteAccountsAccountIdArtifactsNamespacesNamespaceReposNameResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameCommitHashResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  PostAccountsAccountIdArtifactsNamespacesNamespaceReposNameForkRequest = object
    default_branch_only: Option[bool]
    description: Option[string]
    name: string
    read_only: Option[bool]
  PostAccountsAccountIdArtifactsNamespacesNamespaceReposNameForkResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  PostAccountsAccountIdArtifactsNamespacesNamespaceReposNameImportRequest = object
    branch: Option[string]
    depth: Option[int64]
    read_only: Option[bool]
    url: string
  PostAccountsAccountIdArtifactsNamespacesNamespaceReposNameImportResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameLogResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameTokensResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameTreeHashResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  PostAccountsAccountIdArtifactsNamespacesNamespaceTokensRequest = object
    repo: string
    scope: Option[string]
    ttl: Option[int64]
  PostAccountsAccountIdArtifactsNamespacesNamespaceTokensResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  DeleteAccountsAccountIdArtifactsNamespacesNamespaceTokensIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  ArtifactSortOption* = enum
    sortCreatedAt = "created_at"
    sortUpdatedAt = "updated_at"
    sortLastPushAt = "last_push_at"
    sortName = "name"

  ArtifactDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"

  ArtifactStateOption* = enum
    stateActive = "active"
    stateExpired = "expired"
    stateRevoked = "revoked"
    stateAll = "all"


proc getAccountsAccountIdArtifactsNamespaces*(client: CloudflareClient,
                                              limit: int64 = 100,
                                              cursor: string = default(string)): Future[GetAccountsAccountIdArtifactsNamespacesResponse] {.async.} =
  ## Lists Artifacts namespaces for an account.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["cursor"] = $cursor
  let res = await client.httpGET("/accounts/{account_id}/artifacts/namespaces", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdArtifactsNamespacesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdArtifactsNamespacesNamespace*(client: CloudflareClient,
                                                       namespace: string): Future[GetAccountsAccountIdArtifactsNamespacesNamespaceResponse] {.async.} =
  ## Returns an Artifacts namespace summary.

  let res = await client.httpGET(fmt"/accounts/{account_id}/artifacts/namespaces/{namespace}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdArtifactsNamespacesNamespaceResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdArtifactsNamespacesNamespaceRepos*(client: CloudflareClient,
                                                            namespace: string,
                                                            limit: int64 = 50,
                                                            cursor: string = default(string),
                                                            search: string = default(string),
                                                            sort: ArtifactSortOption = sortCreatedAt,
                                                            direction: ArtifactDirectionOption = directionDesc): Future[GetAccountsAccountIdArtifactsNamespacesNamespaceReposResponse] {.async.} =
  ## Lists repositories in a namespace.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["cursor"] = $cursor
  q["search"] = $search
  q["sort"] = $sort
  q["direction"] = $direction
  let res = await client.httpGET(fmt"/accounts/{account_id}/artifacts/namespaces/{namespace}/repos", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdArtifactsNamespacesNamespaceReposResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdArtifactsNamespacesNamespaceRepos*(client: CloudflareClient,
                                                             namespace: string,
                                                             body: PostAccountsAccountIdArtifactsNamespacesNamespaceReposRequest): Future[PostAccountsAccountIdArtifactsNamespacesNamespaceReposResponse] {.async.} =
  ## Creates a Git-compatible Artifacts repository in a namespace.

  let res = await client.httpPOST(fmt"/accounts/{account_id}/artifacts/namespaces/{namespace}/repos", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, PostAccountsAccountIdArtifactsNamespacesNamespaceReposResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdArtifactsNamespacesNamespaceReposName*(client: CloudflareClient,
                                                                namespace: string,
                                                                name: string): Future[GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameResponse] {.async.} =
  ## Returns repository metadata.

  let res = await client.httpGET(fmt"/accounts/{account_id}/artifacts/namespaces/{namespace}/repos/{name}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdArtifactsNamespacesNamespaceReposName*(client: CloudflareClient,
                                                                   namespace: string,
                                                                   name: string): Future[DeleteAccountsAccountIdArtifactsNamespacesNamespaceReposNameResponse] {.async.} =
  ## Deletes a repository and schedules cleanup of its backing data.

  let res = await client.httpDELETE(fmt"/accounts/{account_id}/artifacts/namespaces/{namespace}/repos/{name}")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, DeleteAccountsAccountIdArtifactsNamespacesNamespaceReposNameResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdArtifactsNamespacesNamespaceReposNameBlobHash*(client: CloudflareClient,
                                                                        namespace: string,
                                                                        name: string,
                                                                        hash: string): Future[AsyncResponse] {.async.} =
  ## Returns raw bytes for an immutable Git blob object. Blob responses are cacheable
  ## forever by hash.

  let res = await client.httpGET(fmt"/accounts/{account_id}/artifacts/namespaces/{namespace}/repos/{name}/blob/{hash}")
  return res

proc getAccountsAccountIdArtifactsNamespacesNamespaceReposNameCommitHash*(client: CloudflareClient,
                                                                          namespace: string,
                                                                          name: string,
                                                                          hash: string): Future[GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameCommitHashResponse] {.async.} =
  ## Returns decoded metadata for an immutable Git commit object. Commit responses
  ## are cacheable forever by hash.

  let res = await client.httpGET(fmt"/accounts/{account_id}/artifacts/namespaces/{namespace}/repos/{name}/commit/{hash}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameCommitHashResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdArtifactsNamespacesNamespaceReposNameFile*(client: CloudflareClient,
                                                                    namespace: string,
                                                                    name: string,
                                                                    `ref`: string,
                                                                    path: string): Future[AsyncResponse] {.async.} =
  ## Returns raw bytes for a file resolved by ref and path.

  var q = initOrderedTable[string, string]()
  q["ref"] = $`ref`
  q["path"] = $path
  let res = await client.httpGET(fmt"/accounts/{account_id}/artifacts/namespaces/{namespace}/repos/{name}/file", q)
  return res

proc postAccountsAccountIdArtifactsNamespacesNamespaceReposNameFork*(client: CloudflareClient,
                                                                     namespace: string,
                                                                     name: string,
                                                                     body: PostAccountsAccountIdArtifactsNamespacesNamespaceReposNameForkRequest): Future[PostAccountsAccountIdArtifactsNamespacesNamespaceReposNameForkResponse] {.async.} =
  ## Forks a source repository into a new repository.

  let res = await client.httpPOST(fmt"/accounts/{account_id}/artifacts/namespaces/{namespace}/repos/{name}/fork", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, PostAccountsAccountIdArtifactsNamespacesNamespaceReposNameForkResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdArtifactsNamespacesNamespaceReposNameImport*(client: CloudflareClient,
                                                                       namespace: string,
                                                                       name: string,
                                                                       body: PostAccountsAccountIdArtifactsNamespacesNamespaceReposNameImportRequest): Future[PostAccountsAccountIdArtifactsNamespacesNamespaceReposNameImportResponse] {.async.} =
  ## Imports an HTTPS Git repository into an Artifacts repository.

  let res = await client.httpPOST(fmt"/accounts/{account_id}/artifacts/namespaces/{namespace}/repos/{name}/import", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, PostAccountsAccountIdArtifactsNamespacesNamespaceReposNameImportResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdArtifactsNamespacesNamespaceReposNameLog*(client: CloudflareClient,
                                                                   namespace: string,
                                                                   name: string,
                                                                   `ref`: string = default(string),
                                                                   limit: int64 = default(int64),
                                                                   offset: int64 = default(int64)): Future[GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameLogResponse] {.async.} =
  ## Returns commit metadata walking backwards from a ref, branch, tag, or HEAD.

  var q = initOrderedTable[string, string]()
  q["ref"] = $`ref`
  q["limit"] = $limit
  q["offset"] = $offset
  let res = await client.httpGET(fmt"/accounts/{account_id}/artifacts/namespaces/{namespace}/repos/{name}/log", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameLogResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdArtifactsNamespacesNamespaceReposNameRawRefPath*(client: CloudflareClient,
                                                                          namespace: string,
                                                                          name: string,
                                                                          `ref`: string,
                                                                          path: string): Future[string] {.async.} =
  ## Returns file bytes resolved by ref and path, with a sniffed content type and
  ## browser-safe response headers.

  let res = await client.httpGET(fmt"/accounts/{account_id}/artifacts/namespaces/{namespace}/repos/{name}/raw/{`ref`}/{path}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, string)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdArtifactsNamespacesNamespaceReposNameTokens*(client: CloudflareClient,
                                                                      namespace: string,
                                                                      name: string,
                                                                      state: ArtifactStateOption = stateActive,
                                                                      page: int64 = 1,
                                                                      perPage: int64 = 30): Future[GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameTokensResponse] {.async.} =
  ## Lists tokens for a repository.

  var q = initOrderedTable[string, string]()
  q["state"] = $state
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{account_id}/artifacts/namespaces/{namespace}/repos/{name}/tokens", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameTokensResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdArtifactsNamespacesNamespaceReposNameTreeHash*(client: CloudflareClient,
                                                                        namespace: string,
                                                                        name: string,
                                                                        hash: string): Future[GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameTreeHashResponse] {.async.} =
  ## Returns decoded entries for an immutable Git tree object. Tree responses are
  ## cacheable forever by hash.

  let res = await client.httpGET(fmt"/accounts/{account_id}/artifacts/namespaces/{namespace}/repos/{name}/tree/{hash}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdArtifactsNamespacesNamespaceReposNameTreeHashResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdArtifactsNamespacesNamespaceTokens*(client: CloudflareClient,
                                                              namespace: string,
                                                              body: PostAccountsAccountIdArtifactsNamespacesNamespaceTokensRequest): Future[PostAccountsAccountIdArtifactsNamespacesNamespaceTokensResponse] {.async.} =
  ## Creates a scoped Git token for a repository.

  let res = await client.httpPOST(fmt"/accounts/{account_id}/artifacts/namespaces/{namespace}/tokens", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, PostAccountsAccountIdArtifactsNamespacesNamespaceTokensResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdArtifactsNamespacesNamespaceTokensId*(client: CloudflareClient,
                                                                  namespace: string,
                                                                  id: string): Future[DeleteAccountsAccountIdArtifactsNamespacesNamespaceTokensIdResponse] {.async.} =
  ## Revokes an Artifacts repository token.

  let res = await client.httpDELETE(fmt"/accounts/{account_id}/artifacts/namespaces/{namespace}/tokens/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdArtifactsNamespacesNamespaceTokensIdResponse)
  else:
    raise newException(CloudflareClientError, body)
