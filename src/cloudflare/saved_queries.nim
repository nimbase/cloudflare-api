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
  GetAccountsAccountIdWorkersObservabilityQueriesResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: seq[types.WorkersObservabilityQuery]
    success: bool
  PostAccountsAccountIdWorkersObservabilityQueriesRequest = object
    description: Option[string]
    name: string
    parameters: JsonNode
  PostAccountsAccountIdWorkersObservabilityQueriesResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: types.WorkersObservabilityQuery
    success: bool
  GetAccountsAccountIdWorkersObservabilityQueriesQueryIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: types.WorkersObservabilityQuery
    success: bool
  DeleteAccountsAccountIdWorkersObservabilityQueriesQueryIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: types.WorkersObservabilityQuery
    success: bool
  PatchAccountsAccountIdWorkersObservabilityQueriesQueryIdRequest = object
    description: Option[string]
    name: string
    parameters: JsonNode
  PatchAccountsAccountIdWorkersObservabilityQueriesQueryIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: types.WorkersObservabilityQuery
    success: bool
  SavedQuerieOrderOption* = enum
    orderAsc = "asc"
    orderDesc = "desc"

  SavedQuerieOrderByOption* = enum
    orderByCreated = "created"
    orderByUpdated = "updated"


proc getAccountsAccountIdWorkersObservabilityQueries*(client: CloudflareClient,
                                                      page: float64 = default(float64),
                                                      perPage: float64 = default(float64),
                                                      order: string = "desc",
                                                      orderBy: string = "updated"): Future[GetAccountsAccountIdWorkersObservabilityQueriesResponse] {.async.} =
  ## List saved queries.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["perPage"] = $perPage
  for v in order: q["order"] = $v
  for v in orderBy: q["orderBy"] = $v
  let res = await client.httpGET("/accounts/{account_id}/workers/observability/queries", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkersObservabilityQueriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdWorkersObservabilityQueries*(client: CloudflareClient,
                                                       body: PostAccountsAccountIdWorkersObservabilityQueriesRequest): Future[PostAccountsAccountIdWorkersObservabilityQueriesResponse] {.async.} =
  ## Persist query for later use.

  let res = await client.httpPOST("/accounts/{account_id}/workers/observability/queries", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdWorkersObservabilityQueriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersObservabilityQueriesQueryId*(client: CloudflareClient,
                                                             queryId: string): Future[GetAccountsAccountIdWorkersObservabilityQueriesQueryIdResponse] {.async.} =
  ## Retrieve a saved query.

  let res = await client.httpGET(fmt"/accounts/{account_id}/workers/observability/queries/{queryId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkersObservabilityQueriesQueryIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdWorkersObservabilityQueriesQueryId*(client: CloudflareClient,
                                                                queryId: string): Future[DeleteAccountsAccountIdWorkersObservabilityQueriesQueryIdResponse] {.async.} =
  ## Delete a saved query.

  let res = await client.httpDELETE(fmt"/accounts/{account_id}/workers/observability/queries/{queryId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdWorkersObservabilityQueriesQueryIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdWorkersObservabilityQueriesQueryId*(client: CloudflareClient,
                                                               queryId: string,
                                                               body: PatchAccountsAccountIdWorkersObservabilityQueriesQueryIdRequest): Future[PatchAccountsAccountIdWorkersObservabilityQueriesQueryIdResponse] {.async.} =
  ## Update saved query.

  let res = await client.httpPATCH(fmt"/accounts/{account_id}/workers/observability/queries/{queryId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdWorkersObservabilityQueriesQueryIdResponse)
  else:
    raise newException(CloudflareClientError, body)
