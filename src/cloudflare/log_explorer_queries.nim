# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdLogsExplorerQuerySql*(client: CloudflareClient,
                                               accountId: string, query: string): Future[types.LexQueryResponse] {.async.} =
  ## Run a SQL query against account-level datasets. The SQL query is passed as the
  ## `query` query parameter. Because the query appears in the URL, it is subject to
  ## gateway and proxy URL-length limits and may be recorded in access logs. This
  ## endpoint is deprecated in favour of the POST variant which sends the query in
  ## the request body.

  var q = initOrderedTable[string, string]()
  q["query"] = $query
  let res = await client.httpGET(fmt"/accounts/{accountId}/logs/explorer/query/sql", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LexQueryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdLogsExplorerQuerySql*(client: CloudflareClient,
                                                accountId: string): Future[types.LexQueryResponse] {.async.} =
  ## Run a SQL query against account-level datasets.
  ##
  ## Timestamp fields are RFC3339 strings. Filter with:
  ## WHERE {timestamp_field} >= now() - INTERVAL '30' DAY
  ## WHERE {timestamp_field} >= '2026-04-01T00:00:00Z'
  ## WHERE {timestamp_field} BETWEEN '2026-04-01T00:00:00Z' AND
  ## '2026-04-30T23:59:59Z'
  ##
  ## List configured account datasets to see enabled account-level datasets.
  ## Zone-level datasets will not appear here.
  ## List available account datasets to inspect their schemas and timestamp fields.
  ##
  ## For more information about the datasets, and the meaning of each field, check
  ## out https://developers.cloudflare.com/logs/logpush/logpush-job/datasets/

  let res = await client.httpPOST(fmt"/accounts/{accountId}/logs/explorer/query/sql")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LexQueryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdLogsExplorerQuerySql*(client: CloudflareClient,
                                         zoneId: string, query: string): Future[types.LexQueryResponse] {.async.} =
  ## Run a SQL query against zone-level datasets. The SQL query is passed as the
  ## `query` query parameter. Because the query appears in the URL, it is subject to
  ## gateway and proxy URL-length limits and may be recorded in access logs. This
  ## endpoint is deprecated in favour of the POST variant which sends the query in
  ## the request body.

  var q = initOrderedTable[string, string]()
  q["query"] = $query
  let res = await client.httpGET(fmt"/zones/{zoneId}/logs/explorer/query/sql", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LexQueryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdLogsExplorerQuerySql*(client: CloudflareClient,
                                          zoneId: string): Future[types.LexQueryResponse] {.async.} =
  ## Run a SQL query against zone-level datasets.
  ##
  ## Timestamp fields are RFC3339 strings. Filter with:
  ## WHERE {timestamp_field} >= now() - INTERVAL '30' DAY
  ## WHERE {timestamp_field} >= '2026-04-01T00:00:00Z'
  ## WHERE {timestamp_field} BETWEEN '2026-04-01T00:00:00Z' AND
  ## '2026-04-30T23:59:59Z'
  ##
  ## List configured zone datasets to see enabled zone-level datasets.
  ## List available zone datasets to inspect their schemas and timestamp fields.
  ##
  ## For more information about the datasets, and the meaning of each field, check
  ## out https://developers.cloudflare.com/logs/logpush/logpush-job/datasets/

  let res = await client.httpPOST(fmt"/zones/{zoneId}/logs/explorer/query/sql")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LexQueryResponse)
  else:
    raise newException(CloudflareClientError, body)
