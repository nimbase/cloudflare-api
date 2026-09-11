# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdR2CatalogBucketNameNamespacesNamespaceTablesTableNameMaintenanceConfigs*(client: CloudflareClient,
                                                                                                  accountId: types.R2DataCatalogAccountId,
                                                                                                  bucketName: types.R2DataCatalogBucketName,
                                                                                                  namespace: string,
                                                                                                  tableName: string): Future[JsonNode] {.async.} =
  ## Retrieve the maintenance configuration for a specific table,
  ## including compaction settings.

  let res = await client.httpGET(fmt"/accounts/{accountId}/r2-catalog/{bucketName}/namespaces/{namespace}/tables/{tableName}/maintenance-configs")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdR2CatalogBucketNameNamespacesNamespaceTablesTableNameMaintenanceConfigs*(client: CloudflareClient,
                                                                                                   accountId: types.R2DataCatalogAccountId,
                                                                                                   bucketName: types.R2DataCatalogBucketName,
                                                                                                   namespace: string,
                                                                                                   tableName: string,
                                                                                                   body: types.R2DataCatalogTableMaintenanceUpdateRequest): Future[JsonNode] {.async.} =
  ## Update the maintenance configuration for a specific table. This allows you to
  ## enable or disable compaction and adjust target file sizes for optimization.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/r2-catalog/{bucketName}/namespaces/{namespace}/tables/{tableName}/maintenance-configs", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdR2CatalogBucketNameNamespacesNamespaceTablesTableNameMaintenanceConfigsConfigurationTypeQueue*(client: CloudflareClient,
                                                                                                                         accountId: types.R2DataCatalogAccountId,
                                                                                                                         bucketName: types.R2DataCatalogBucketName,
                                                                                                                         namespace: string,
                                                                                                                         tableName: string,
                                                                                                                         configurationType: ConfigurationType,
                                                                                                                         body: types.R2DataCatalogQueueMaintenanceRequest): Future[JsonNode] {.async.} =
  ## Queue maintenance for normal polling. This request does not start a run.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/r2-catalog/{bucketName}/namespaces/{namespace}/tables/{tableName}/maintenance-configs/{configurationType}/queue", body)
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdR2CatalogBucketNameNamespacesNamespaceTablesTableNameMaintenanceRuns*(client: CloudflareClient,
                                                                                               accountId: types.R2DataCatalogAccountId,
                                                                                               bucketName: types.R2DataCatalogBucketName,
                                                                                               namespace: string,
                                                                                               tableName: string,
                                                                                               pageSize: int64 = default(int64),
                                                                                               pageToken: string = default(string)): Future[JsonNode] {.async.} =
  ## Retrieves recent table maintenance runs for the current table.

  var q = initOrderedTable[string, string]()
  q["page_size"] = $pageSize
  q["page_token"] = $pageToken
  let res = await client.httpGET(fmt"/accounts/{accountId}/r2-catalog/{bucketName}/namespaces/{namespace}/tables/{tableName}/maintenance-runs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
