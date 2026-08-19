# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc postAccountsAccountIdR2CatalogBucketNameCredential*(client: CloudflareClient,
                                                         accountId: types.R2DataCatalogAccountId,
                                                         bucketName: types.R2DataCatalogBucketName,
                                                         body: types.R2DataCatalogCatalogCredentialRequest): Future[JsonNode] {.async.} =
  ## Store authentication credentials for a catalog. These credentials are used
  ## to authenticate with R2 storage when performing catalog operations.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/r2-catalog/{bucketName}/credential", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
