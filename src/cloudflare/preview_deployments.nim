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
  PreviewDeploymentIncludeOption* = enum
    includeModules = "modules"


proc getAccountsAccountIdWorkersWorkersWorkerIdPreviewsPreviewIdDeployments*(client: CloudflareClient,
                                                                             accountId: types.WorkersIdentifier,
                                                                             workerId: string,
                                                                             previewId: string,
                                                                             page: int64 = 1,
                                                                             perPage: int64 = 10): Future[JsonNode] {.async.} =
  ## List all deployments for a Preview.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/workers/{workerId}/previews/{previewId}/deployments", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdWorkersWorkersWorkerIdPreviewsPreviewIdDeployments*(client: CloudflareClient,
                                                                              accountId: types.WorkersIdentifier,
                                                                              workerId: string,
                                                                              previewId: string,
                                                                              ignoreDefaults: bool = default(bool),
                                                                              body: types.WorkersPreviewDeploymentRequest): Future[JsonNode] {.async.} =
  ## Create a new deployment for a Preview.

  var q = initOrderedTable[string, string]()
  q["ignore_defaults"] = $ignoreDefaults
  let res = await client.httpPOST(fmt"/accounts/{accountId}/workers/workers/{workerId}/previews/{previewId}/deployments", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdWorkersWorkersWorkerIdPreviewsPreviewIdDeploymentsLatest*(client: CloudflareClient,
                                                                                     accountId: types.WorkersIdentifier,
                                                                                     workerId: string,
                                                                                     previewId: string,
                                                                                     ignoreDefaults: bool = default(bool),
                                                                                     body: types.WorkersPreviewDeploymentRequest): Future[JsonNode] {.async.} =
  ## Only `/deployments/latest` is supported. Creates a new preview deployment by
  ## applying a JSON Merge Patch (RFC 7396) to the latest deployment. Patching a
  ## specific deployment ID is not supported. Omitted fields are inherited from the
  ## latest deployment. Preview base config is used for the first deployment.

  var q = initOrderedTable[string, string]()
  q["ignore_defaults"] = $ignoreDefaults
  let res = await client.httpPATCH(fmt"/accounts/{accountId}/workers/workers/{workerId}/previews/{previewId}/deployments/latest", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersWorkersWorkerIdPreviewsPreviewIdDeploymentsDeploymentId*(client: CloudflareClient,
                                                                                         accountId: types.WorkersIdentifier,
                                                                                         workerId: string,
                                                                                         previewId: string,
                                                                                         deploymentId: string,
                                                                                         `include`: PreviewDeploymentIncludeOption = includeModules): Future[JsonNode] {.async.} =
  ## Get details about a specific preview deployment.

  var q = initOrderedTable[string, string]()
  q["include"] = $`include`
  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/workers/{workerId}/previews/{previewId}/deployments/{deploymentId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdWorkersWorkersWorkerIdPreviewsPreviewIdDeploymentsDeploymentId*(client: CloudflareClient,
                                                                                            accountId: types.WorkersIdentifier,
                                                                                            workerId: string,
                                                                                            previewId: string,
                                                                                            deploymentId: string): Future[types.WorkersApiResponseCommon] {.async.} =
  ## Delete a preview deployment.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/workers/workers/{workerId}/previews/{previewId}/deployments/{deploymentId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)
