# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdAiSearchNamespacesResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  PostAccountsAccountIdAiSearchNamespacesRequest = object
    description: Option[string]
    name: string
    public_endpoint_params: Option[JsonNode]
  PostAccountsAccountIdAiSearchNamespacesResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiSearchNamespacesNameResponse* = object
    result: JsonNode
    success: bool
  PutAccountsAccountIdAiSearchNamespacesNameRequest = object
    description: Option[string]
    public_endpoint_params: Option[JsonNode]
  PutAccountsAccountIdAiSearchNamespacesNameResponse* = object
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdAiSearchNamespacesNameResponse* = object
    result: JsonNode
    success: bool
  PatchAccountsAccountIdAiSearchNamespacesNameInstancesIdRequest = object
    new_namespace: string
  PatchAccountsAccountIdAiSearchNamespacesNameInstancesIdResponse* = object
    result: JsonNode
    success: bool

proc getAccountsAccountIdAiSearchNamespaces*(client: CloudflareClient,
                                             accountId: string, page: int64 = 1,
                                             perPage: int64 = 20,
                                             search: string = default(string)): Future[GetAccountsAccountIdAiSearchNamespacesResponse] {.async.} =
  ## List namespaces in the account, including their descriptions and creation times.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["search"] = $search
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/namespaces", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchNamespacesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiSearchNamespaces*(client: CloudflareClient,
                                              accountId: string,
                                              body: PostAccountsAccountIdAiSearchNamespacesRequest): Future[PostAccountsAccountIdAiSearchNamespacesResponse] {.async.} =
  ## Create a namespace for organizing AI Search instances.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-search/namespaces", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, PostAccountsAccountIdAiSearchNamespacesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiSearchNamespacesName*(client: CloudflareClient,
                                                 accountId: string, name: string): Future[GetAccountsAccountIdAiSearchNamespacesNameResponse] {.async.} =
  ## Retrieve a namespace and its description.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-search/namespaces/{name}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiSearchNamespacesNameResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAiSearchNamespacesName*(client: CloudflareClient,
                                                 accountId: string, name: string,
                                                 body: PutAccountsAccountIdAiSearchNamespacesNameRequest): Future[PutAccountsAccountIdAiSearchNamespacesNameResponse] {.async.} =
  ## Update the description and/or the public endpoint configuration of an existing
  ## namespace. The default namespace's description cannot be modified, but its
  ## public endpoint can.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/ai-search/namespaces/{name}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdAiSearchNamespacesNameResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAiSearchNamespacesName*(client: CloudflareClient,
                                                    accountId: string,
                                                    name: string): Future[DeleteAccountsAccountIdAiSearchNamespacesNameResponse] {.async.} =
  ## Permanently delete a namespace. The namespace must be empty (no instances), and
  ## the default namespace cannot be deleted.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/ai-search/namespaces/{name}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAiSearchNamespacesNameResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdAiSearchNamespacesNameInstancesId*(client: CloudflareClient,
                                                              accountId: string,
                                                              name: string,
                                                              id: string,
                                                              body: PatchAccountsAccountIdAiSearchNamespacesNameInstancesIdRequest): Future[PatchAccountsAccountIdAiSearchNamespacesNameInstancesIdResponse] {.async.} =
  ## Moves an instance from its current namespace to the specified target namespace.
  ## Use 'default' with --destination-namespace to move the instance back to the
  ## default namespace. Fails with 400 if the target namespace already has an
  ## instance with the same id (ids must be unique within a namespace — the same id
  ## can exist in different namespaces).

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/ai-search/namespaces/{name}/instances/{id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdAiSearchNamespacesNameInstancesIdResponse)
  else:
    raise newException(CloudflareClientError, body)
