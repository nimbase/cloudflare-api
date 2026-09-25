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
  PreviewOrderByOption* = enum
    orderByDeployedOn = "deployed_on"
    orderByUpdatedOn = "updated_on"
    orderByCreatedOn = "created_on"
    orderBySlug = "slug"
    orderByName = "name"

  PreviewOrderOption* = enum
    orderAsc = "asc"
    orderDesc = "desc"


proc getAccountsAccountIdWorkersWorkersWorkerIdPreviews*(client: CloudflareClient,
                                                         accountId: types.WorkersIdentifier,
                                                         workerId: string,
                                                         page: int64 = 1,
                                                         perPage: int64 = 10,
                                                         orderBy: PreviewOrderByOption = orderByDeployedOn,
                                                         order: PreviewOrderOption = orderDesc,
                                                         slug: string = default(string),
                                                         name: string = default(string)): Future[JsonNode] {.async.} =
  ## List all Previews for a Worker.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["order_by"] = $orderBy
  q["order"] = $order
  q["slug"] = $slug
  q["name"] = $name
  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/workers/{workerId}/previews", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdWorkersWorkersWorkerIdPreviews*(client: CloudflareClient,
                                                          accountId: types.WorkersIdentifier,
                                                          workerId: string,
                                                          ignoreDefaults: bool = default(bool),
                                                          ignoreBaseConfig: bool = default(bool)): Future[JsonNode] {.async.} =
  ## Create a new Preview for a Worker.

  var q = initOrderedTable[string, string]()
  q["ignore_defaults"] = $ignoreDefaults
  q["ignore_base_config"] = $ignoreBaseConfig
  let res = await client.httpPOST(fmt"/accounts/{accountId}/workers/workers/{workerId}/previews", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersWorkersWorkerIdPreviewsPreviewId*(client: CloudflareClient,
                                                                  accountId: types.WorkersIdentifier,
                                                                  workerId: string,
                                                                  previewId: string): Future[JsonNode] {.async.} =
  ## Get details about a specific Preview.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/workers/{workerId}/previews/{previewId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdWorkersWorkersWorkerIdPreviewsPreviewId*(client: CloudflareClient,
                                                                  accountId: types.WorkersIdentifier,
                                                                  workerId: string,
                                                                  previewId: string,
                                                                  ignoreDefaults: bool = default(bool),
                                                                  ignoreBaseConfig: bool = default(bool)): Future[JsonNode] {.async.} =
  ## Perform a complete replacement of a Preview, where omitted properties are set to
  ## defaults.

  var q = initOrderedTable[string, string]()
  q["ignore_defaults"] = $ignoreDefaults
  q["ignore_base_config"] = $ignoreBaseConfig
  let res = await client.httpPUT(fmt"/accounts/{accountId}/workers/workers/{workerId}/previews/{previewId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdWorkersWorkersWorkerIdPreviewsPreviewId*(client: CloudflareClient,
                                                                     accountId: types.WorkersIdentifier,
                                                                     workerId: string,
                                                                     previewId: string,
                                                                     force: bool = default(bool)): Future[types.WorkersApiResponseCommon] {.async.} =
  ## Delete a Preview.

  var q = initOrderedTable[string, string]()
  q["force"] = $force
  let res = await client.httpDELETE(fmt"/accounts/{accountId}/workers/workers/{workerId}/previews/{previewId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdWorkersWorkersWorkerIdPreviewsPreviewId*(client: CloudflareClient,
                                                                    accountId: types.WorkersIdentifier,
                                                                    workerId: string,
                                                                    previewId: string): Future[JsonNode] {.async.} =
  ## Perform a partial update on a Preview, where omitted properties are left
  ## unchanged.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/workers/workers/{workerId}/previews/{previewId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
