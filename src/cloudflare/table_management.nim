# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdR2CatalogBucketNameNamespacesNamespaceTables*(client: CloudflareClient,
                                                                       accountId: types.R2DataCatalogAccountId,
                                                                       bucketName: types.R2DataCatalogBucketName,
                                                                       namespace: string,
                                                                       pageToken: string = default(string),
                                                                       pageSize: int64 = 100,
                                                                       returnUuids: bool = false,
                                                                       returnDetails: bool = false): Future[JsonNode] {.async.} =
  ## Returns a list of tables in the specified namespace within an R2 catalog.
  ## Supports pagination for efficient traversal of large table collections.

  var q = initOrderedTable[string, string]()
  q["page_token"] = $pageToken
  q["page_size"] = $pageSize
  q["return_uuids"] = $returnUuids
  q["return_details"] = $returnDetails
  let res = await client.httpGET(fmt"/accounts/{accountId}/r2-catalog/{bucketName}/namespaces/{namespace}/tables", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdR2CatalogBucketNameNamespacesNamespaceTablesTableName*(client: CloudflareClient,
                                                                                accountId: types.R2DataCatalogAccountId,
                                                                                bucketName: types.R2DataCatalogBucketName,
                                                                                namespace: string,
                                                                                tableName: string): Future[JsonNode] {.async.} =
  ## Returns full Apache Iceberg metadata for a single table: schema,
  ## partition specs, sort orders, properties, and recent snapshot history.
  ## Designed for catalog introspection UIs that need per-table details
  ## without holding R2 credentials.
  ##
  ## The `metadata.snapshots`, `metadata.snapshot-log`, and
  ## `metadata.metadata-log` arrays are pruned to the most recent 10
  ## entries by `timestamp-ms`. Use `total_snapshots` and
  ## `returned_snapshots` to surface the truncation to end users.

  let res = await client.httpGET(fmt"/accounts/{accountId}/r2-catalog/{bucketName}/namespaces/{namespace}/tables/{tableName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
