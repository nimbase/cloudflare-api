# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdR2CatalogBucketNameMaintenanceConfigs*(client: CloudflareClient,
                                                                accountId: types.R2DataCatalogAccountId,
                                                                bucketName: types.R2DataCatalogBucketName): Future[JsonNode] {.async.} =
  ## Retrieve the maintenance configuration for a specific catalog,
  ## including compaction settings and credential status.

  let res = await client.httpGET(fmt"/accounts/{accountId}/r2-catalog/{bucketName}/maintenance-configs")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdR2CatalogBucketNameMaintenanceConfigs*(client: CloudflareClient,
                                                                 accountId: types.R2DataCatalogAccountId,
                                                                 bucketName: types.R2DataCatalogBucketName,
                                                                 body: types.R2DataCatalogCatalogMaintenanceUpdateRequest): Future[JsonNode] {.async.} =
  ## Update the maintenance configuration for a catalog. This allows you to
  ## enable or disable compaction and adjust target file sizes for optimization.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/r2-catalog/{bucketName}/maintenance-configs", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
