# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdAnalyticsEngineSql*(client: CloudflareClient,
                                             query: string): Future[types.AnalyticsEngineJsonFormatResponse] {.async.} =
  ## Executes a SQL query against Workers Analytics Engine data. Pass the SQL query
  ## as a query parameter. The response uses newline-delimited JSON (NDJSON) by
  ## default, or a single JSON object when the query includes a FORMAT JSON clause.
  ## Use the POST method for longer queries that may exceed URL length limits.

  var q = initOrderedTable[string, string]()
  q["query"] = $query
  let res = await client.httpGET("/accounts/{account_id}/analytics_engine/sql", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AnalyticsEngineJsonFormatResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAnalyticsEngineSql*(client: CloudflareClient): Future[types.AnalyticsEngineJsonFormatResponse] {.async.} =
  ## Executes a SQL query against Workers Analytics Engine data. Pass the SQL query
  ## in the request body as plain text. The response uses newline-delimited JSON
  ## (NDJSON) by default, or a single JSON object when the query includes a FORMAT
  ## JSON clause. Prefer this method for longer queries that may exceed URL length
  ## limits.

  let res = await client.httpPOST("/accounts/{account_id}/analytics_engine/sql")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AnalyticsEngineJsonFormatResponse)
  else:
    raise newException(CloudflareClientError, body)
