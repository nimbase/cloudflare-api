# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountTagAnalyticsSql*(client: CloudflareClient,
                                        accountTag: string, query: string): Future[JsonNode] {.async.} =
  ## Executes a SQL query scoped to the account in the request path. API Gateway
  ## preserves the account path, and SQL API requires it to match the signed JWT
  ## account, so an accountTag predicate or JSON scope is not required. Explicit
  ## account scope must match the path account. Any zone restrictions must belong to
  ## that account. Query parameters, time ranges, output formats, authorization, and
  ## responses follow the legacy query endpoint.

  var q = initOrderedTable[string, string]()
  q["query"] = $query
  let res = await client.httpGET(fmt"/accounts/{accountTag}/analytics/sql", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountTagAnalyticsSql*(client: CloudflareClient,
                                         accountTag: string,
                                         body: types.AnalyticsSqlSqlQueryRequest): Future[JsonNode] {.async.} =
  ## Executes a SQL query scoped to the account in the request path. API Gateway
  ## preserves the account path, and SQL API requires it to match the signed JWT
  ## account, so an accountTag predicate or JSON scope is not required. Explicit
  ## account scope must match the path account. Any zone restrictions must belong to
  ## that account. Query parameters, time ranges, output formats, authorization, and
  ## responses follow the legacy query endpoint.

  let res = await client.httpPOST(fmt"/accounts/{accountTag}/analytics/sql", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountTagAnalyticsSqlIntrospection*(client: CloudflareClient,
                                                     accountTag: string,
                                                     includeColumns: bool = false,
                                                     includeCustomAttributes: bool = false,
                                                     includeAttributes: bool = false,
                                                     includeWae: bool = true,
                                                     includeLex: bool = true,
                                                     datasetName: string = default(string)): Future[types.AnalyticsSqlIntrospectionResponse] {.async.} =
  ## Returns the dataset catalogue for the account in the request path. API Gateway
  ## preserves the account path, and SQL API requires it to match the signed JWT
  ## account; account_tag is not required as a query parameter. If supplied, it must
  ## match the path account. Dataset and column discovery options are identical to
  ## the legacy introspection endpoint.

  var q = initOrderedTable[string, string]()
  q["include_columns"] = $includeColumns
  q["include_custom_attributes"] = $includeCustomAttributes
  q["include_attributes"] = $includeAttributes
  q["include_wae"] = $includeWae
  q["include_lex"] = $includeLex
  q["dataset_name"] = $datasetName
  let res = await client.httpGET(fmt"/accounts/{accountTag}/analytics/sql/introspection", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AnalyticsSqlIntrospectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAnalyticsSql*(client: CloudflareClient, query: string): Future[JsonNode] {.async.} =
  ## Executes a SQL query against the analytics datasets available to the caller. SQL
  ## placeholders can be bound with query parameters named `param_<name>`, such as
  ## `param_status=404` for `$status`. A trailing `FORMAT JSON`, `FORMAT
  ## JSONEachRow`, `FORMAT TabSeparated`, or `FORMAT TSV` is supported for all
  ## datasets. Without FORMAT, each backend retains its existing default JSON
  ## response.

  var q = initOrderedTable[string, string]()
  q["query"] = $query
  let res = await client.httpGET("/analytics/sql", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAnalyticsSql*(client: CloudflareClient,
                       body: types.AnalyticsSqlSqlQueryRequest): Future[JsonNode] {.async.} =
  ## Executes a SQL query against the analytics datasets available to the caller.
  ## Send either raw SQL or a JSON object containing the query and optional
  ## positional or named parameters, time range, and account or zone scope. Raw SQL
  ## placeholders can also be bound with query parameters named `param_<name>`. A
  ## trailing `FORMAT JSON`, `FORMAT JSONEachRow`, `FORMAT TabSeparated`, or `FORMAT
  ## TSV` is supported for all datasets. Without FORMAT, each backend retains its
  ## existing default JSON response.

  let res = await client.httpPOST("/analytics/sql", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAnalyticsSqlIntrospection*(client: CloudflareClient, accountTag: string,
                                   includeColumns: bool = false,
                                   includeCustomAttributes: bool = false,
                                   includeAttributes: bool = false,
                                   includeWae: bool = true,
                                   includeLex: bool = true,
                                   datasetName: string = default(string)): Future[types.AnalyticsSqlIntrospectionResponse] {.async.} =
  ## Returns the analytics dataset catalogue. By default, the response contains
  ## dataset names, titles, categories, descriptions, kinds, and hidden flags. Set
  ## `include_columns` to include each dataset's column names, descriptions, data
  ## types, and hidden flags. The caller must have Account Analytics Read permission
  ## on the account identified by `account_tag`. Dataset names, descriptions, and
  ## columns are the same for every authorized account. When
  ## `include_custom_attributes` or `include_attributes` is set, the response also
  ## includes attribute names and types discovered from that account's own data,
  ## which legitimately differs per caller. `attributes` is a replacement for
  ## `custom_attributes` that will eventually be removed; until then, set either flag
  ## independently to receive the corresponding field. `hidden` marks catalogue
  ## entries a client should de-emphasise. It has no effect on access: hidden
  ## datasets and columns are returned here and remain fully queryable.
  ##
  ## The catalogue lists the datasets this deployment is able to describe, which is
  ## not a fixed list. Some datasets are described by the service that owns them and
  ## are listed only where that service is available, so the same account may see a
  ## different catalogue in different environments, and datasets may appear or
  ## disappear without a change to this API. Clients should query the catalogue
  ## rather than hard-coding it, and should not treat a dataset's absence as proof
  ## that it does not exist.
  ##
  ## Workers Analytics Engine datasets are named by the account that writes them, so
  ## they are discovered from that account's own data rather than from a fixed list.
  ## They appear as `events.analyticsEngine.<dataset_name>` and differ per account. A
  ## dataset is listed for as long as any of its data is retained, so it does not
  ## disappear from the catalogue merely because writes have stopped. An account with
  ## a very large number of datasets may receive a truncated list. Set
  ## `include_wae=false` to omit them.
  ##
  ## Log Explorer datasets are listed only where the account has them, so they differ
  ## per account and are not part of the static catalogue. Set `include_lex=false` to
  ## omit them.

  var q = initOrderedTable[string, string]()
  q["account_tag"] = $accountTag
  q["include_columns"] = $includeColumns
  q["include_custom_attributes"] = $includeCustomAttributes
  q["include_attributes"] = $includeAttributes
  q["include_wae"] = $includeWae
  q["include_lex"] = $includeLex
  q["dataset_name"] = $datasetName
  let res = await client.httpGET("/analytics/sql/introspection", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AnalyticsSqlIntrospectionResponse)
  else:
    raise newException(CloudflareClientError, body)
