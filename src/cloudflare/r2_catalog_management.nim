# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdR2Catalog*(client: CloudflareClient,
                                    accountId: types.R2DataCatalogAccountId): Future[JsonNode] {.async.} =
  ## Returns a list of R2 buckets that have been enabled as Apache Iceberg catalogs
  ## for the specified account. Each catalog represents an R2 bucket configured
  ## to store Iceberg metadata and data files.

  let res = await client.httpGET(fmt"/accounts/{accountId}/r2-catalog")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdR2CatalogBucketName*(client: CloudflareClient,
                                              accountId: types.R2DataCatalogAccountId,
                                              bucketName: types.R2DataCatalogBucketName): Future[JsonNode] {.async.} =
  ## Retrieve detailed information about a specific R2 catalog by bucket name.
  ## Returns catalog status, maintenance configuration, and credential status.

  let res = await client.httpGET(fmt"/accounts/{accountId}/r2-catalog/{bucketName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdR2CatalogBucketNameDelete*(client: CloudflareClient,
                                                     accountId: types.R2DataCatalogAccountId,
                                                     bucketName: types.R2DataCatalogBucketName,
                                                     force: bool = false): Future[AsyncResponse] {.async.} =
  ## Removes the catalog from the control plane without deleting R2 bucket objects.
  ## Set force=true to remove catalog namespaces, tables, views, and maintenance
  ## metadata. Force deletion is limited to a configured catalog object count.

  var q = initOrderedTable[string, string]()
  q["force"] = $force
  let res = await client.httpPOST(fmt"/accounts/{accountId}/r2-catalog/{bucketName}/delete", q)
  return res

proc postAccountsAccountIdR2CatalogBucketNameDisable*(client: CloudflareClient,
                                                      accountId: types.R2DataCatalogAccountId,
                                                      bucketName: types.R2DataCatalogBucketName): Future[AsyncResponse] {.async.} =
  ## Disable an R2 bucket as a catalog. This operation deactivates the catalog
  ## but preserves existing metadata and data files. The catalog can be
  ## re-enabled later.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/r2-catalog/{bucketName}/disable")
  return res

proc postAccountsAccountIdR2CatalogBucketNameEnable*(client: CloudflareClient,
                                                     accountId: types.R2DataCatalogAccountId,
                                                     bucketName: types.R2DataCatalogBucketName): Future[JsonNode] {.async.} =
  ## Enable an R2 bucket as an Apache Iceberg catalog. This operation creates
  ## the necessary catalog infrastructure and activates the bucket for storing
  ## Iceberg metadata and data files.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/r2-catalog/{bucketName}/enable")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
