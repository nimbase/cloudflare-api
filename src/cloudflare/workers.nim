# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types

type
  WorkerPatchExistingPreviewsOption* = enum
    patchExistingPreviewsTrue = "true"
    patchExistingPreviewsFalse = "false"

  WorkerOrderByOption* = enum
    orderByDeployedOn = "deployed_on"
    orderByUpdatedOn = "updated_on"
    orderByCreatedOn = "created_on"
    orderByName = "name"

  WorkerOrderOption* = enum
    orderAsc = "asc"
    orderDesc = "desc"


proc postAccountsAccountIdBuildsWorkers*(client: CloudflareClient,
                                         accountId: types.BuildsAccountId,
                                         body: types.BuildsCreateWorkerRequest): Future[JsonNode] {.async.} =
  ## Connect a Worker tag to a repository and production build settings.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/builds/workers", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBuildsWorkersExternalScriptIdBuilds*(client: CloudflareClient,
                                                              accountId: types.BuildsAccountId,
                                                              externalScriptId: types.BuildsExternalScriptId,
                                                              page: int64 = 1,
                                                              perPage: int64 = 50): Future[JsonNode] {.async.} =
  ## List paginated build records associated with a Worker tag.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/builds/workers/{externalScriptId}/builds", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBuildsWorkersExternalScriptIdTriggers*(client: CloudflareClient,
                                                                accountId: types.BuildsAccountId,
                                                                externalScriptId: types.BuildsExternalScriptId): Future[JsonNode] {.async.} =
  ## List trigger UUIDs and build settings associated with a Worker tag.

  let res = await client.httpGET(fmt"/accounts/{accountId}/builds/workers/{externalScriptId}/triggers")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBuildsWorkersScriptTag*(client: CloudflareClient,
                                                 accountId: types.BuildsAccountId,
                                                 scriptTag: types.BuildsExternalScriptId): Future[JsonNode] {.async.} =
  ## Retrieve the repository and production build settings associated with a Worker
  ## tag.

  let res = await client.httpGET(fmt"/accounts/{accountId}/builds/workers/{scriptTag}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdBuildsWorkersScriptTag*(client: CloudflareClient,
                                                    accountId: types.BuildsAccountId,
                                                    scriptTag: types.BuildsExternalScriptId): Future[JsonNode] {.async.} =
  ## Delete build settings and triggers for a Worker tag and cancel unfinished
  ## builds. The Worker is not deleted.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/builds/workers/{scriptTag}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdBuildsWorkersScriptTag*(client: CloudflareClient,
                                                   accountId: types.BuildsAccountId,
                                                   scriptTag: types.BuildsExternalScriptId,
                                                   patchExistingPreviews: WorkerPatchExistingPreviewsOption = patchExistingPreviewsFalse,
                                                   body: types.BuildsUpdateWorkerRequest): Future[JsonNode] {.async.} =
  ## Update the build configuration for a Worker script. Supports partial updates to
  ## git repository settings, production build settings, and Preview settings.

  var q = initOrderedTable[string, string]()
  q["patch_existing_previews"] = $patchExistingPreviews
  let res = await client.httpPATCH(fmt"/accounts/{accountId}/builds/workers/{scriptTag}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdBuildsWorkersScriptTagMigrateToPreviews*(client: CloudflareClient,
                                                                   accountId: types.BuildsAccountId,
                                                                   scriptTag: types.BuildsExternalScriptId,
                                                                   body: types.BuildsMigrateToPreviewsRequest): Future[JsonNode] {.async.} =
  ## Migrate a Worker's legacy non-production trigger to Previews. The legacy build
  ## settings become the Previews base config and the legacy trigger is removed.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/builds/workers/{scriptTag}/migrate_to_previews", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBuildsWorkersScriptTagPreviews*(client: CloudflareClient,
                                                         accountId: types.BuildsAccountId,
                                                         scriptTag: types.BuildsExternalScriptId,
                                                         page: int64 = 1,
                                                         perPage: int64 = 50): Future[JsonNode] {.async.} =
  ## List the Previews of a Worker with pagination.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/builds/workers/{scriptTag}/previews", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBuildsWorkersScriptTagPreviewsPreviewId*(client: CloudflareClient,
                                                                  accountId: types.BuildsAccountId,
                                                                  scriptTag: types.BuildsExternalScriptId,
                                                                  previewId: types.BuildsExternalScriptId): Future[JsonNode] {.async.} =
  ## Retrieve a single Preview of a Worker, including the build settings it currently
  ## uses.

  let res = await client.httpGET(fmt"/accounts/{accountId}/builds/workers/{scriptTag}/previews/{previewId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdBuildsWorkersScriptTagPreviewsPreviewId*(client: CloudflareClient,
                                                                    accountId: types.BuildsAccountId,
                                                                    scriptTag: types.BuildsExternalScriptId,
                                                                    previewId: types.BuildsExternalScriptId,
                                                                    body: types.BuildsUpdatePreviewRequest): Future[JsonNode] {.async.} =
  ## Update a single Preview of a Worker. Supports partial updates to the tracked
  ## branch, the automation flags, and the build settings.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/builds/workers/{scriptTag}/previews/{previewId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBuildsWorkersScriptTagPreviewsPreviewIdBuilds*(client: CloudflareClient,
                                                                        accountId: types.BuildsAccountId,
                                                                        scriptTag: types.BuildsExternalScriptId,
                                                                        previewId: types.BuildsExternalScriptId,
                                                                        page: int64 = 1,
                                                                        perPage: int64 = 50): Future[JsonNode] {.async.} =
  ## List the builds of a single Preview with pagination.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/builds/workers/{scriptTag}/previews/{previewId}/builds", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdBuildsWorkersScriptTagPreviewsPreviewIdBuilds*(client: CloudflareClient,
                                                                         accountId: types.BuildsAccountId,
                                                                         scriptTag: types.BuildsExternalScriptId,
                                                                         previewId: types.BuildsExternalScriptId,
                                                                         body: types.BuildsCreateBuildRequest): Future[JsonNode] {.async.} =
  ## Trigger a build for a single Preview.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/builds/workers/{scriptTag}/previews/{previewId}/builds", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersWorkers*(client: CloudflareClient,
                                         accountId: types.WorkersIdentifier,
                                         page: int64 = 1, perPage: int64 = 10,
                                         orderBy: WorkerOrderByOption = orderByDeployedOn,
                                         order: WorkerOrderOption = orderDesc): Future[JsonNode] {.async.} =
  ## List all Workers for an account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["order_by"] = $orderBy
  q["order"] = $order
  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/workers", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdWorkersWorkers*(client: CloudflareClient,
                                          accountId: types.WorkersIdentifier): Future[JsonNode] {.async.} =
  ## Create a new Worker.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/workers/workers", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersWorkersWorkerId*(client: CloudflareClient,
                                                 accountId: types.WorkersIdentifier,
                                                 workerId: string): Future[JsonNode] {.async.} =
  ## Get details about a specific Worker.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/workers/{workerId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdWorkersWorkersWorkerId*(client: CloudflareClient,
                                                 accountId: types.WorkersIdentifier,
                                                 workerId: string): Future[JsonNode] {.async.} =
  ## Perform a complete replacement of a Worker, where omitted properties are set to
  ## their default values. This is the exact same as the Create Worker endpoint, but
  ## operates on an existing Worker. To perform a partial update instead, use the
  ## Edit Worker endpoint.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/workers/workers/{workerId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdWorkersWorkersWorkerId*(client: CloudflareClient,
                                                    accountId: types.WorkersIdentifier,
                                                    workerId: string,
                                                    force: bool = default(bool)): Future[types.WorkersApiResponseCommon] {.async.} =
  ## Delete a Worker and all its associated resources (versions, deployments, etc.).

  var q = initOrderedTable[string, string]()
  q["force"] = $force
  let res = await client.httpDELETE(fmt"/accounts/{accountId}/workers/workers/{workerId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdWorkersWorkersWorkerId*(client: CloudflareClient,
                                                   accountId: types.WorkersIdentifier,
                                                   workerId: string): Future[JsonNode] {.async.} =
  ## Perform a partial update on a Worker, where omitted properties are left
  ## unchanged from their current values.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/workers/workers/{workerId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
