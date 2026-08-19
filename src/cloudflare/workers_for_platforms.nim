# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdWorkersDispatchNamespacesRequest = object
    name: Option[string]
  PutAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceRequest = object
    name: Option[string]
    trusted_workers: Option[types.WorkersTrustedWorkers]
  PatchAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceRequest = object
    name: Option[string]
    trusted_workers: Option[types.WorkersTrustedWorkers]
  WorkersForPlatformBindingsInheritOption* = enum
    bindingsInheritStrict = "strict"


proc getAccountsAccountIdWorkersDispatchNamespaces*(client: CloudflareClient,
                                                    accountId: types.WorkersIdentifier): Future[types.WorkersNamespaceListResponse] {.async.} =
  ## Fetch a list of Workers for Platforms namespaces.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/dispatch/namespaces")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersNamespaceListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdWorkersDispatchNamespaces*(client: CloudflareClient,
                                                     accountId: types.WorkersIdentifier,
                                                     body: PostAccountsAccountIdWorkersDispatchNamespacesRequest): Future[types.WorkersNamespaceSingleResponse] {.async.} =
  ## Create a new Workers for Platforms namespace.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/workers/dispatch/namespaces", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersNamespaceSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersDispatchNamespacesDispatchNamespace*(client: CloudflareClient,
                                                                     accountId: types.WorkersIdentifier,
                                                                     dispatchNamespace: types.WorkersDispatchNamespaceName): Future[types.WorkersNamespaceSingleResponse] {.async.} =
  ## Get a Workers for Platforms namespace.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/dispatch/namespaces/{dispatchNamespace}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersNamespaceSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdWorkersDispatchNamespacesDispatchNamespace*(client: CloudflareClient,
                                                                     accountId: types.WorkersIdentifier,
                                                                     dispatchNamespace: types.WorkersDispatchNamespaceName,
                                                                     body: PutAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceRequest): Future[types.WorkersNamespaceSingleResponse] {.async.} =
  ## Update a Workers for Platforms namespace.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/workers/dispatch/namespaces/{dispatchNamespace}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersNamespaceSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdWorkersDispatchNamespacesDispatchNamespace*(client: CloudflareClient,
                                                                        accountId: types.WorkersIdentifier,
                                                                        dispatchNamespace: types.WorkersDispatchNamespaceName): Future[types.WorkersApiResponseNullResult] {.async.} =
  ## Delete a Workers for Platforms namespace.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/workers/dispatch/namespaces/{dispatchNamespace}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersApiResponseNullResult)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdWorkersDispatchNamespacesDispatchNamespace*(client: CloudflareClient,
                                                                       accountId: types.WorkersIdentifier,
                                                                       dispatchNamespace: types.WorkersDispatchNamespaceName,
                                                                       body: PatchAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceRequest): Future[types.WorkersNamespaceSingleResponse] {.async.} =
  ## Patch a Workers for Platforms namespace. Omitted fields are left unchanged.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/workers/dispatch/namespaces/{dispatchNamespace}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersNamespaceSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScripts*(client: CloudflareClient,
                                                                            accountId: types.WorkersIdentifier,
                                                                            dispatchNamespace: types.WorkersDispatchNamespaceName,
                                                                            tags: string = default(string)): Future[JsonNode] {.async.} =
  ## Fetch a list of scripts uploaded to a Workers for Platforms namespace.

  var q = initOrderedTable[string, string]()
  q["tags"] = $tags
  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/dispatch/namespaces/{dispatchNamespace}/scripts", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScripts*(client: CloudflareClient,
                                                                               accountId: types.WorkersIdentifier,
                                                                               dispatchNamespace: types.WorkersDispatchNamespaceName,
                                                                               tags: string = default(string),
                                                                               limit: int64 = default(int64)): Future[types.WorkersNamespaceScriptDeleteBulkResponse] {.async.} =
  ## Delete multiple scripts from a Workers for Platforms namespace based on optional
  ## tag filters.

  var q = initOrderedTable[string, string]()
  q["tags"] = $tags
  q["limit"] = $limit
  let res = await client.httpDELETE(fmt"/accounts/{accountId}/workers/dispatch/namespaces/{dispatchNamespace}/scripts", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersNamespaceScriptDeleteBulkResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptName*(client: CloudflareClient,
                                                                                      accountId: types.WorkersIdentifier,
                                                                                      dispatchNamespace: types.WorkersDispatchNamespaceName,
                                                                                      scriptName: types.WorkersScriptName): Future[types.WorkersNamespaceScriptResponseSingle] {.async.} =
  ## Fetch information about a script uploaded to a Workers for Platforms namespace.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/dispatch/namespaces/{dispatchNamespace}/scripts/{scriptName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersNamespaceScriptResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptName*(client: CloudflareClient,
                                                                                      accountId: types.WorkersIdentifier,
                                                                                      dispatchNamespace: types.WorkersDispatchNamespaceName,
                                                                                      scriptName: types.WorkersScriptName,
                                                                                      bindingsInherit: set[WorkersForPlatformBindingsInheritOption] = {}): Future[JsonNode] {.async.} =
  ## Upload a worker module to a Workers for Platforms namespace. You can find more
  ## about the multipart metadata on our docs:https://developers.cloudflare.com/work
  ## ers/configuration/multipart-upload-metadata/.

  var q = initOrderedTable[string, string]()
  for v in bindingsInherit: q["bindings_inherit"] = $v
  let res = await client.httpPUT(fmt"/accounts/{accountId}/workers/dispatch/namespaces/{dispatchNamespace}/scripts/{scriptName}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptName*(client: CloudflareClient,
                                                                                         accountId: types.WorkersIdentifier,
                                                                                         dispatchNamespace: types.WorkersDispatchNamespaceName,
                                                                                         scriptName: types.WorkersScriptName,
                                                                                         force: bool = default(bool)): Future[types.WorkersApiResponseNullResult] {.async.} =
  ## Delete a worker from a Workers for Platforms namespace. This call has no
  ## response body on a successful delete.

  var q = initOrderedTable[string, string]()
  q["force"] = $force
  let res = await client.httpDELETE(fmt"/accounts/{accountId}/workers/dispatch/namespaces/{dispatchNamespace}/scripts/{scriptName}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersApiResponseNullResult)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameAssetsUploadSession*(client: CloudflareClient,
                                                                                                          accountId: types.WorkersIdentifier,
                                                                                                          dispatchNamespace: types.WorkersDispatchNamespaceName,
                                                                                                          scriptName: types.WorkersScriptName,
                                                                                                          body: types.WorkersCreateAssetsUploadSessionObject): Future[types.WorkersCreateAssetsUploadSessionResponse] {.async.} =
  ## Start uploading a collection of assets for use in a Worker version. To learn
  ## more about the direct uploads of assets, see
  ## https://developers.cloudflare.com/workers/static-assets/direct-upload/.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/workers/dispatch/namespaces/{dispatchNamespace}/scripts/{scriptName}/assets-upload-session", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersCreateAssetsUploadSessionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameBindings*(client: CloudflareClient,
                                                                                              accountId: types.WorkersIdentifier,
                                                                                              dispatchNamespace: types.WorkersDispatchNamespaceName,
                                                                                              scriptName: types.WorkersScriptName): Future[JsonNode] {.async.} =
  ## Fetch script bindings from a script uploaded to a Workers for Platforms
  ## namespace.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/dispatch/namespaces/{dispatchNamespace}/scripts/{scriptName}/bindings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameContent*(client: CloudflareClient,
                                                                                             accountId: types.WorkersIdentifier,
                                                                                             dispatchNamespace: types.WorkersDispatchNamespaceName,
                                                                                             scriptName: types.WorkersScriptName): Future[AsyncResponse] {.async.} =
  ## Fetch script content from a script uploaded to a Workers for Platforms
  ## namespace.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/dispatch/namespaces/{dispatchNamespace}/scripts/{scriptName}/content")
  return res

proc putAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameContent*(client: CloudflareClient,
                                                                                             accountId: types.WorkersIdentifier,
                                                                                             dispatchNamespace: types.WorkersDispatchNamespaceName,
                                                                                             scriptName: types.WorkersScriptName): Future[types.WorkersScriptResponseSingle] {.async.} =
  ## Put script content for a script uploaded to a Workers for Platforms namespace.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/workers/dispatch/namespaces/{dispatchNamespace}/scripts/{scriptName}/content")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersScriptResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameSecrets*(client: CloudflareClient,
                                                                                             accountId: types.WorkersIdentifier,
                                                                                             dispatchNamespace: types.WorkersDispatchNamespaceName,
                                                                                             scriptName: types.WorkersScriptName): Future[JsonNode] {.async.} =
  ## List secrets bound to a script uploaded to a Workers for Platforms namespace.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/dispatch/namespaces/{dispatchNamespace}/scripts/{scriptName}/secrets")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameSecrets*(client: CloudflareClient,
                                                                                             accountId: types.WorkersIdentifier,
                                                                                             dispatchNamespace: types.WorkersDispatchNamespaceName,
                                                                                             scriptName: types.WorkersScriptName,
                                                                                             body: types.WorkersSecret): Future[JsonNode] {.async.} =
  ## Add a secret to a script uploaded to a Workers for Platforms namespace.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/workers/dispatch/namespaces/{dispatchNamespace}/scripts/{scriptName}/secrets", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameSecretsBulk*(client: CloudflareClient,
                                                                                                   accountId: types.WorkersIdentifier,
                                                                                                   dispatchNamespace: types.WorkersDispatchNamespaceName,
                                                                                                   scriptName: types.WorkersScriptName,
                                                                                                   body: types.WorkersSecretPatchRequest): Future[JsonNode] {.async.} =
  ## Create, update, or delete multiple secrets on a script in a single operation
  ## using JSON Merge Patch (RFC 7396).
  ##
  ## Usage:
  ##
  ## - To create or update a secret, set its value to a secret object.
  ## - To delete a secret, set its value to `null`.
  ## - Secrets not included in the request are left unchanged.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/workers/dispatch/namespaces/{dispatchNamespace}/scripts/{scriptName}/secrets-bulk", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameSecretsSecretName*(client: CloudflareClient,
                                                                                                       accountId: types.WorkersIdentifier,
                                                                                                       dispatchNamespace: types.WorkersDispatchNamespaceName,
                                                                                                       scriptName: types.WorkersScriptName,
                                                                                                       secretName: types.WorkersSecretName,
                                                                                                       urlEncoded: types.WorkersSecretNameUrlEncoded = default(types.WorkersSecretNameUrlEncoded)): Future[JsonNode] {.async.} =
  ## Get a given secret binding (value omitted) on a script uploaded to a Workers for
  ## Platforms namespace.

  var q = initOrderedTable[string, string]()
  q["url_encoded"] = $urlEncoded
  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/dispatch/namespaces/{dispatchNamespace}/scripts/{scriptName}/secrets/{secretName}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameSecretsSecretName*(client: CloudflareClient,
                                                                                                          accountId: types.WorkersIdentifier,
                                                                                                          dispatchNamespace: types.WorkersDispatchNamespaceName,
                                                                                                          scriptName: types.WorkersScriptName,
                                                                                                          secretName: types.WorkersSecretName,
                                                                                                          urlEncoded: types.WorkersSecretNameUrlEncoded = default(types.WorkersSecretNameUrlEncoded)): Future[types.WorkersApiResponseNullResult] {.async.} =
  ## Remove a secret from a script uploaded to a Workers for Platforms namespace.

  var q = initOrderedTable[string, string]()
  q["url_encoded"] = $urlEncoded
  let res = await client.httpDELETE(fmt"/accounts/{accountId}/workers/dispatch/namespaces/{dispatchNamespace}/scripts/{scriptName}/secrets/{secretName}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersApiResponseNullResult)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameSettings*(client: CloudflareClient,
                                                                                              accountId: types.WorkersIdentifier,
                                                                                              dispatchNamespace: types.WorkersDispatchNamespaceName,
                                                                                              scriptName: types.WorkersScriptName): Future[JsonNode] {.async.} =
  ## Get script settings from a script uploaded to a Workers for Platforms namespace.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/dispatch/namespaces/{dispatchNamespace}/scripts/{scriptName}/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameSettings*(client: CloudflareClient,
                                                                                                accountId: types.WorkersIdentifier,
                                                                                                dispatchNamespace: types.WorkersDispatchNamespaceName,
                                                                                                scriptName: types.WorkersScriptName): Future[JsonNode] {.async.} =
  ## Patch script metadata, such as bindings.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/workers/dispatch/namespaces/{dispatchNamespace}/scripts/{scriptName}/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameTags*(client: CloudflareClient,
                                                                                          accountId: types.WorkersIdentifier,
                                                                                          dispatchNamespace: types.WorkersDispatchNamespaceName,
                                                                                          scriptName: types.WorkersScriptName): Future[JsonNode] {.async.} =
  ## Fetch tags from a script uploaded to a Workers for Platforms namespace.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/dispatch/namespaces/{dispatchNamespace}/scripts/{scriptName}/tags")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameTags*(client: CloudflareClient,
                                                                                          accountId: types.WorkersIdentifier,
                                                                                          dispatchNamespace: types.WorkersDispatchNamespaceName,
                                                                                          scriptName: types.WorkersScriptName,
                                                                                          body: types.WorkersTags): Future[JsonNode] {.async.} =
  ## Put script tags for a script uploaded to a Workers for Platforms namespace.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/workers/dispatch/namespaces/{dispatchNamespace}/scripts/{scriptName}/tags", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameTagsTag*(client: CloudflareClient,
                                                                                             accountId: types.WorkersIdentifier,
                                                                                             dispatchNamespace: types.WorkersDispatchNamespaceName,
                                                                                             scriptName: types.WorkersScriptName,
                                                                                             tag: types.WorkersTag): Future[types.WorkersApiResponseNullResult] {.async.} =
  ## Put a single tag on a script uploaded to a Workers for Platforms namespace.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/workers/dispatch/namespaces/{dispatchNamespace}/scripts/{scriptName}/tags/{tag}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersApiResponseNullResult)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdWorkersDispatchNamespacesDispatchNamespaceScriptsScriptNameTagsTag*(client: CloudflareClient,
                                                                                                accountId: types.WorkersIdentifier,
                                                                                                dispatchNamespace: types.WorkersDispatchNamespaceName,
                                                                                                scriptName: types.WorkersScriptName,
                                                                                                tag: types.WorkersTag): Future[types.WorkersApiResponseNullResult] {.async.} =
  ## Delete script tag for a script uploaded to a Workers for Platforms namespace.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/workers/dispatch/namespaces/{dispatchNamespace}/scripts/{scriptName}/tags/{tag}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersApiResponseNullResult)
  else:
    raise newException(CloudflareClientError, body)
