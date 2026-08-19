# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdR2CatalogBucketNameNamespaces*(client: CloudflareClient,
                                                        accountId: types.R2DataCatalogAccountId,
                                                        bucketName: types.R2DataCatalogBucketName,
                                                        pageToken: string = default(string),
                                                        pageSize: int64 = 100,
                                                        parent: string = default(string),
                                                        returnUuids: bool = false,
                                                        returnDetails: bool = false): Future[JsonNode] {.async.} =
  ## Returns a list of namespaces in the specified R2 catalog.
  ## Supports hierarchical filtering and pagination for efficient traversal
  ## of large namespace hierarchies.

  var q = initOrderedTable[string, string]()
  q["page_token"] = $pageToken
  q["page_size"] = $pageSize
  q["parent"] = $parent
  q["return_uuids"] = $returnUuids
  q["return_details"] = $returnDetails
  let res = await client.httpGET(fmt"/accounts/{accountId}/r2-catalog/{bucketName}/namespaces", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
