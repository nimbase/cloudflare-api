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
  PostAccountsAccountIdD1DatabaseRequest = object
    jurisdiction: Option[types.D1Jurisdiction]
    name: types.D1DatabaseName
    primary_location_hint: Option[types.D1PrimaryLocationHint]
    read_replication: Option[types.D1ReadReplicationDetailsForRequest]
  PostAccountsAccountIdD1DatabaseDatabaseIdExportRequest = object
    current_bookmark: Option[string]
    dump_options: Option[JsonNode]
    output_format: string

proc getAccountsAccountIdD1Database*(client: CloudflareClient,
                                     accountId: types.D1AccountIdentifier,
                                     name: string = default(string),
                                     page: float64 = default(float64),
                                     perPage: float64 = default(float64)): Future[JsonNode] {.async.} =
  ## Returns a list of D1 databases.

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/d1/database", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdD1Database*(client: CloudflareClient,
                                      accountId: types.D1AccountIdentifier,
                                      body: PostAccountsAccountIdD1DatabaseRequest): Future[JsonNode] {.async.} =
  ## Returns the created D1 database.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/d1/database", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdD1DatabaseDatabaseId*(client: CloudflareClient,
                                               accountId: types.D1AccountIdentifier,
                                               databaseId: JsonNode,
                                               fields: seq[string] = default(seq[string])): Future[JsonNode] {.async.} =
  ## Returns the specified D1 database.

  var q = initOrderedTable[string, string]()
  q["fields"] = $fields
  let res = await client.httpGET(fmt"/accounts/{accountId}/d1/database/{databaseId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdD1DatabaseDatabaseId*(client: CloudflareClient,
                                               accountId: types.D1AccountIdentifier,
                                               databaseId: types.D1DatabaseIdentifier,
                                               body: types.D1DatabaseUpdateRequestBody): Future[JsonNode] {.async.} =
  ## Updates the specified D1 database.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/d1/database/{databaseId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdD1DatabaseDatabaseId*(client: CloudflareClient,
                                                  accountId: types.D1AccountIdentifier,
                                                  databaseId: types.D1DatabaseIdentifier): Future[JsonNode] {.async.} =
  ## Deletes the specified D1 database.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/d1/database/{databaseId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdD1DatabaseDatabaseId*(client: CloudflareClient,
                                                 accountId: types.D1AccountIdentifier,
                                                 databaseId: types.D1DatabaseIdentifier,
                                                 body: types.D1DatabaseUpdatePartialRequestBody): Future[JsonNode] {.async.} =
  ## Updates partially the specified D1 database.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/d1/database/{databaseId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdD1DatabaseDatabaseIdExport*(client: CloudflareClient,
                                                      accountId: types.D1AccountIdentifier,
                                                      databaseId: types.D1DatabaseIdentifier,
                                                      body: PostAccountsAccountIdD1DatabaseDatabaseIdExportRequest): Future[JsonNode] {.async.} =
  ## Returns a URL where the SQL contents of your D1 can be downloaded. Note: this
  ## process may take
  ## some time for larger DBs, during which your D1 will be unavailable to serve
  ## queries. To avoid
  ## blocking your DB unnecessarily, an in-progress export must be continually polled
  ## or will automatically cancel.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/d1/database/{databaseId}/export", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdD1DatabaseDatabaseIdImport*(client: CloudflareClient,
                                                      accountId: types.D1AccountIdentifier,
                                                      databaseId: types.D1DatabaseIdentifier): Future[JsonNode] {.async.} =
  ## Generates a temporary URL for uploading an SQL file to, then instructing the D1
  ## to import it
  ## and polling it for status updates. Imports block the D1 for their duration.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/d1/database/{databaseId}/import", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdD1DatabaseDatabaseIdQuery*(client: CloudflareClient,
                                                     accountId: types.D1AccountIdentifier,
                                                     databaseId: types.D1DatabaseIdentifier,
                                                     body: types.D1BatchQuery): Future[JsonNode] {.async.} =
  ## Returns the query result as an object.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/d1/database/{databaseId}/query", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdD1DatabaseDatabaseIdRaw*(client: CloudflareClient,
                                                   accountId: types.D1AccountIdentifier,
                                                   databaseId: types.D1DatabaseIdentifier,
                                                   body: types.D1BatchQuery): Future[JsonNode] {.async.} =
  ## Returns the query result rows as arrays rather than objects. This is a
  ## performance-optimized version of the /query endpoint.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/d1/database/{databaseId}/raw", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdD1DatabaseDatabaseIdTimeTravelBookmark*(client: CloudflareClient,
                                                                 accountId: types.D1AccountIdentifier,
                                                                 databaseId: types.D1DatabaseIdentifier,
                                                                 timestamp: types.D1TimeTravelTimestamp = default(types.D1TimeTravelTimestamp)): Future[JsonNode] {.async.} =
  ## Retrieves the current bookmark, or the nearest bookmark at or before a provided
  ## timestamp.
  ## Bookmarks can be used with the restore endpoint to revert the database to a
  ## previous point in time.

  var q = initOrderedTable[string, string]()
  q["timestamp"] = $timestamp
  let res = await client.httpGET(fmt"/accounts/{accountId}/d1/database/{databaseId}/time_travel/bookmark", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdD1DatabaseDatabaseIdTimeTravelRestore*(client: CloudflareClient,
                                                                 accountId: types.D1AccountIdentifier,
                                                                 databaseId: types.D1DatabaseIdentifier,
                                                                 bookmark: types.D1TimeTravelBookmark = default(types.D1TimeTravelBookmark),
                                                                 timestamp: types.D1TimeTravelTimestamp = default(types.D1TimeTravelTimestamp)): Future[JsonNode] {.async.} =
  ## Restores a D1 database to a previous point in time either via a bookmark or a
  ## timestamp.

  var q = initOrderedTable[string, string]()
  q["bookmark"] = $bookmark
  q["timestamp"] = $timestamp
  let res = await client.httpPOST(fmt"/accounts/{accountId}/d1/database/{databaseId}/time_travel/restore", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
