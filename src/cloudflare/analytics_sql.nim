# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import ./private/metaclient
import ./private/types


proc getAnalyticsSql*(client: CloudflareClient, query: string): Future[types.AnalyticsSqlSqlQueryResponse] {.async.} =
  ## Executes a SQL query against the analytics datasets available to the caller. SQL
  ## placeholders can be bound with query parameters named `param_<name>`, such as
  ## `param_status=404` for `$status`.

  var q = initOrderedTable[string, string]()
  q["query"] = $query
  let res = await client.httpGET("/analytics/sql", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AnalyticsSqlSqlQueryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAnalyticsSql*(client: CloudflareClient,
                       body: types.AnalyticsSqlSqlQueryRequest): Future[types.AnalyticsSqlSqlQueryResponse] {.async.} =
  ## Executes a SQL query against the analytics datasets available to the caller.
  ## Send either raw SQL or a JSON object containing the query and optional
  ## positional or named parameters, time range, and account or zone scope. Raw SQL
  ## placeholders can also be bound with query parameters named `param_<name>`.

  let res = await client.httpPOST("/analytics/sql", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AnalyticsSqlSqlQueryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAnalyticsSqlIntrospection*(client: CloudflareClient, accountTag: string,
                                   includeColumns: bool = false,
                                   datasetName: string = default(string)): Future[types.AnalyticsSqlIntrospectionResponse] {.async.} =
  ## Returns the analytics dataset catalogue. By default, the response contains
  ## dataset names and descriptions. Set `include_columns` to include each dataset's
  ## column names, descriptions, and data types. The caller must have Account
  ## Analytics Read permission on the account identified by `account_tag`. The
  ## account tag authorizes the request; it does not filter the catalogue, which is
  ## the same for every authorized account. Note. This endpoint does not support
  ## zone_tag.

  var q = initOrderedTable[string, string]()
  q["account_tag"] = $accountTag
  q["include_columns"] = $includeColumns
  q["dataset_name"] = $datasetName
  let res = await client.httpGET("/analytics/sql/introspection", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AnalyticsSqlIntrospectionResponse)
  else:
    raise newException(CloudflareClientError, body)
