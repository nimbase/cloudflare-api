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
  GetAccountsAccountIdLogsListResponse* = object
    errors: seq[string]
    messages: seq[string]
    result: JsonNode
    success: bool

proc getAccountsAccountIdLogsList*(client: CloudflareClient,
                                   accountId: types.LogpullAccountId,
                                   start: types.LogpullTimestampRFC3339,
                                   `end`: types.LogpullTimestampRFC3339,
                                   bucket: types.LogpullBucket,
                                   prefix: types.LogpullPrefix = default(types.LogpullPrefix),
                                   limit: types.LogpullLimit = default(types.LogpullLimit)): Future[GetAccountsAccountIdLogsListResponse] {.async.} =
  ## Lists R2 objects containing logs matching the provided query parameters.

  var q = initOrderedTable[string, string]()
  q["start"] = $start
  q["end"] = $`end`
  q["bucket"] = $bucket
  q["prefix"] = $prefix
  q["limit"] = $limit
  let res = await client.httpGET(fmt"/accounts/{accountId}/logs/list", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdLogsListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdLogsRetrieve*(client: CloudflareClient,
                                       accountId: types.LogpullAccountId,
                                       start: types.LogpullTimestampRFC3339,
                                       `end`: types.LogpullTimestampRFC3339,
                                       bucket: types.LogpullBucket,
                                       prefix: types.LogpullPrefix = default(types.LogpullPrefix)): Future[AsyncResponse] {.async.} =
  ## Returns logs stored in R2 that match the provided query parameters.

  var q = initOrderedTable[string, string]()
  q["start"] = $start
  q["end"] = $`end`
  q["bucket"] = $bucket
  q["prefix"] = $prefix
  let res = await client.httpGET(fmt"/accounts/{accountId}/logs/retrieve", q)
  return res
