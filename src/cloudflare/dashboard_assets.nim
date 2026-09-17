# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdAssetsListResponse* = object
    properties: JsonNode
    `type`: string
  PostAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdAssetsUploadResponse* = object
    properties: JsonNode
    `type`: string

proc getAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdAssetsList*(client: CloudflareClient,
                                                                                accountId: string,
                                                                                projectType: ProjectType,
                                                                                requestId: string): Future[GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdAssetsListResponse] {.async.} =
  ## List all file assets for a request. Customer can only list assets from their own
  ## account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/requests/{projectType}/{requestId}/assets/list")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdAssetsListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdAssetsUpload*(client: CloudflareClient,
                                                                                   accountId: string,
                                                                                   projectType: ProjectType,
                                                                                   requestId: string): Future[PostAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdAssetsUploadResponse] {.async.} =
  ## Upload a file asset to R2 storage and associate it with a request. Customer can
  ## only upload to their own account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/requests/{projectType}/{requestId}/assets/upload")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdAssetsUploadResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdAssetsAssetIdDownload*(client: CloudflareClient,
                                                                                           accountId: string,
                                                                                           projectType: ProjectType,
                                                                                           requestId: string,
                                                                                           assetId: string): Future[AsyncResponse] {.async.} =
  ## Download a file asset from R2 storage. Customer can only download from their own
  ## account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/requests/{projectType}/{requestId}/assets/{assetId}/download")
  return res
