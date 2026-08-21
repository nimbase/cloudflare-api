# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types

type
  WorkerVersionBindingsInheritOption* = enum
    bindingsInheritStrict = "strict"


proc getAccountsAccountIdWorkersScriptsScriptNameVersions*(client: CloudflareClient,
                                                           accountId: types.WorkersIdentifier,
                                                           scriptName: types.WorkersScriptName2,
                                                           deployable: bool = false,
                                                           page: int64 = 1,
                                                           perPage: int64 = default(int64)): Future[types.WorkersVersionsListResponse] {.async.} =
  ## List of Worker Versions. The first version in the list is the latest version.

  var q = initOrderedTable[string, string]()
  q["deployable"] = $deployable
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/versions", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersVersionsListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdWorkersScriptsScriptNameVersions*(client: CloudflareClient,
                                                            accountId: types.WorkersIdentifier,
                                                            scriptName: types.WorkersScriptName2,
                                                            bindingsInherit: WorkerVersionBindingsInheritOption): Future[types.WorkersVersionsUploadResponse] {.async.} =
  ## Upload a Worker Version without deploying to Cloudflare's network. You can find
  ## more about the multipart metadata on our docs:https://developers.cloudflare.com
  ## /workers/configuration/multipart-upload-metadata/.

  var q = initOrderedTable[string, string]()
  q["bindings_inherit"] = $bindingsInherit
  let res = await client.httpPOST(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/versions", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersVersionsUploadResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersScriptsScriptNameVersionsVersionId*(client: CloudflareClient,
                                                                    accountId: types.WorkersIdentifier,
                                                                    scriptName: types.WorkersScriptName2,
                                                                    versionId: types.WorkersVersionIdentifier): Future[types.WorkersVersionsSingleResponse] {.async.} =
  ## Retrieves detailed information about a specific version of a Workers script.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/versions/{versionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersVersionsSingleResponse)
  else:
    raise newException(CloudflareClientError, body)
