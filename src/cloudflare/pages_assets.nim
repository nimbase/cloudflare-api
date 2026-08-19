# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import ./private/metaclient
import ./private/types


proc postPagesAssetsCheckMissing*(client: CloudflareClient,
                                  body: types.PagesPagesAssetsCheckMissingRequest): Future[types.PagesPagesAssetsCheckMissingResponse] {.async.} =
  ## Check which of the provided file hashes are missing from the Pages
  ## asset store. Returns a list of missing hashes that need to be uploaded.
  ## Used as part of the Pages Direct Upload workflow.
  ##
  ## Authenticate with the JWT obtained from the upload-token endpoint:
  ## GET /accounts/{account_id}/pages/projects/{project_name}/upload-token

  let res = await client.httpPOST("/pages/assets/check-missing", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PagesPagesAssetsCheckMissingResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postPagesAssetsUpload*(client: CloudflareClient,
                            body: types.PagesPagesAssetsUploadRequest): Future[types.PagesApiResponseCommon] {.async.} =
  ## Upload one or more files to the Pages asset store. Each file is
  ## identified by its content hash and is uploaded using the same JSON shape
  ## as the Cloudflare KV bulk write API. Used as part of the Pages Direct
  ## Upload workflow.
  ##
  ## Authenticate with the JWT obtained from the upload-token endpoint:
  ## GET /accounts/{account_id}/pages/projects/{project_name}/upload-token

  let res = await client.httpPOST("/pages/assets/upload", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PagesApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc postPagesAssetsUpsertHashes*(client: CloudflareClient,
                                  body: types.PagesPagesAssetsUpsertHashesRequest): Future[types.PagesApiResponseCommon] {.async.} =
  ## Register the provided file hashes as recently uploaded to the Pages
  ## asset store. Used as part of the Pages Direct Upload workflow so future
  ## deployments can avoid re-uploading files that are already present.
  ##
  ## Authenticate with the JWT obtained from the upload-token endpoint:
  ## GET /accounts/{account_id}/pages/projects/{project_name}/upload-token

  let res = await client.httpPOST("/pages/assets/upsert-hashes", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PagesApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)
