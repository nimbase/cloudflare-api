# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdAccessLogsJitRequests*(client: CloudflareClient,
                                                accountId: types.AccessIdentifier,
                                                page: int64 = 1,
                                                perPage: int64 = 25,
                                                status: types.AccessJitRequestStatus = default(types.AccessJitRequestStatus),
                                                search: string = default(string),
                                                since: string = default(string),
                                                until: string = default(string)): Future[types.AccessResponseCollection12] {.async.} =
  ## Lists account-wide Access JIT request logs reconstructed from request lifecycle
  ## events.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["status"] = $status
  q["search"] = $search
  q["since"] = $since
  q["until"] = $until
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/logs/jit_requests", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection12)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessLogsJitRequestsKnockRequestId*(client: CloudflareClient,
                                                              accountId: types.AccessIdentifier,
                                                              knockRequestId: string): Future[types.AccessResponseSingle] {.async.} =
  ## Gets an account-scoped Access JIT request summary and its lifecycle events in
  ## chronological order.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/logs/jit_requests/{knockRequestId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
