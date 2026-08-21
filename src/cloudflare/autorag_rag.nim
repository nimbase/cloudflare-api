# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetAccountsAccountIdAutoragRagsIdFilesResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  PatchAccountsAccountIdAutoragRagsIdSyncResponse* = object
    result: JsonNode
    success: bool
  AutoragRagStatusOption* = enum
    statusCompleted = "completed"
    statusQueued = "queued"
    statusRunning = "running"
    statusError = "error"


proc getAccountsAccountIdAutoragRagsIdFiles*(client: CloudflareClient,
                                             id: string, accountId: string,
                                             page: int64 = 1,
                                             perPage: int64 = 20,
                                             search: string = default(string),
                                             status: AutoragRagStatusOption): Future[GetAccountsAccountIdAutoragRagsIdFilesResponse] {.async.} =
  ## Lists files indexed by an AutoRAG.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["search"] = $search
  q["status"] = $status
  let res = await client.httpGET(fmt"/accounts/{accountId}/autorag/rags/{id}/files", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAutoragRagsIdFilesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdAutoragRagsIdSync*(client: CloudflareClient,
                                              id: string, accountId: string): Future[PatchAccountsAccountIdAutoragRagsIdSyncResponse] {.async.} =
  ## Starts synchronization for an AutoRAG.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/autorag/rags/{id}/sync")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdAutoragRagsIdSyncResponse)
  else:
    raise newException(CloudflareClientError, body)
