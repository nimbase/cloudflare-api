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
  VersionIncludeOption* = enum
    includeModules = "modules"


proc getAccountsAccountIdWorkersWorkersWorkerIdVersions*(client: CloudflareClient,
                                                         accountId: types.WorkersIdentifier,
                                                         workerId: string,
                                                         page: int64 = 1,
                                                         perPage: int64 = 10): Future[JsonNode] {.async.} =
  ## List all versions for a Worker.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/workers/{workerId}/versions", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdWorkersWorkersWorkerIdVersions*(client: CloudflareClient,
                                                          accountId: types.WorkersIdentifier,
                                                          workerId: string,
                                                          deploy: bool = default(bool),
                                                          body: types.WorkersVersion): Future[JsonNode] {.async.} =
  ## Create a new version.

  var q = initOrderedTable[string, string]()
  q["deploy"] = $deploy
  let res = await client.httpPOST(fmt"/accounts/{accountId}/workers/workers/{workerId}/versions", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdWorkersWorkersWorkerIdVersionsLatest*(client: CloudflareClient,
                                                                 accountId: types.WorkersIdentifier,
                                                                 workerId: string,
                                                                 deploy: bool = default(bool)): Future[JsonNode] {.async.} =
  ## Only `/versions/latest` is supported. Creates a new version by applying a JSON
  ## Merge Patch (RFC 7396) to the latest version. Patching a specific version ID is
  ## not supported. Omitted fields are inherited from the latest version.

  var q = initOrderedTable[string, string]()
  q["deploy"] = $deploy
  let res = await client.httpPATCH(fmt"/accounts/{accountId}/workers/workers/{workerId}/versions/latest", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersWorkersWorkerIdVersionsVersionId*(client: CloudflareClient,
                                                                  accountId: types.WorkersIdentifier,
                                                                  workerId: string,
                                                                  versionId: string,
                                                                  `include`: set[VersionIncludeOption] = {}): Future[JsonNode] {.async.} =
  ## Get details about a specific version.

  var q = initOrderedTable[string, string]()
  for v in `include`: q["include"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/workers/{workerId}/versions/{versionId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdWorkersWorkersWorkerIdVersionsVersionId*(client: CloudflareClient,
                                                                     accountId: types.WorkersIdentifier,
                                                                     workerId: string,
                                                                     versionId: string): Future[types.WorkersApiResponseCommon] {.async.} =
  ## Delete a version.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/workers/workers/{workerId}/versions/{versionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)
