# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types

type
  GetAccountsAccountIdR2BucketsBucketNameObjectsResponse* = object
    errors: types.R2Errors
    messages: types.R2Messages
    result: seq[types.R2R2Object]
    result_info: types.R2R2ListObjectsResultInfo
    success: bool
      ## Whether the API call was successful.
  DeleteAccountsAccountIdR2BucketsBucketNameObjectsResponse* = object
    errors: types.R2Errors
    messages: types.R2Messages
    result: JsonNode
    success: bool
      ## Whether the API call was successful.

proc getAccountsAccountIdR2BucketsBucketNameObjects*(client: CloudflareClient,
                                                     accountId: types.R2AccountIdentifier,
                                                     bucketName: types.R2BucketName,
                                                     perPage: int64 = 20,
                                                     prefix: string = default(string),
                                                     delimiter: string = default(string),
                                                     cursor: string = default(string),
                                                     startAfter: string = default(string)): Future[GetAccountsAccountIdR2BucketsBucketNameObjectsResponse] {.async.} =
  ## Lists objects in an R2 bucket. Returns object metadata including key, size,
  ## etag, last modified date, HTTP metadata, and custom metadata.
  ##
  ## For most workloads, we recommend using R2's [S3-compatible
  ## API](https://developers.cloudflare.com/r2/api/s3/api/) or a [Worker with an R2b
  ## inding](https://developers.cloudflare.com/r2/api/workers/workers-api-reference/)
  ## instead.

  var q = initOrderedTable[string, string]()
  q["per_page"] = $perPage
  q["prefix"] = $prefix
  q["delimiter"] = $delimiter
  q["cursor"] = $cursor
  q["start_after"] = $startAfter
  let res = await client.httpGET(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/objects", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdR2BucketsBucketNameObjectsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdR2BucketsBucketNameObjects*(client: CloudflareClient,
                                                        accountId: types.R2AccountIdentifier,
                                                        bucketName: types.R2BucketName,
                                                        prefix: string = default(string)): Future[DeleteAccountsAccountIdR2BucketsBucketNameObjectsResponse] {.async.} =
  ## Deletes objects from an R2 bucket. Three modes are supported:
  ##
  ## 1. **Delete by list** (default): Provide a JSON array of object keys in the
  ## request body.
  ## All listed objects are deleted; per-key errors are reported in the response.
  ## 2. **Delete by prefix**: Provide a non-empty `prefix` query parameter and no
  ## request body
  ## to delete every object whose key begins with that prefix.
  ## 3. **Empty bucket**: Provide the `prefix` query parameter with an empty value
  ## (`?prefix=`)
  ## and no request body to delete all objects in the bucket.
  ##
  ## Prefix and empty-bucket requests return a job descriptor. Small jobs can finish
  ## synchronously and return `COMPLETED`; larger jobs continue in the background.
  ## Poll the
  ## returned `id` with the Get Bucket Job endpoint. Objects uploaded after a
  ## background job
  ## starts are not deleted by that job. Abort active multipart uploads before
  ## submitting the
  ## request; a synchronously completed job does not abort them. Avoid writing
  ## objects or
  ## starting multipart uploads while a bucket-emptying job is in progress.
  ##
  ## Each repeated or concurrent request creates a distinct job. The number of active
  ## jobs is
  ## limited per bucket; wait for an existing job to finish before retrying a request
  ## rejected
  ## with HTTP 429.
  ##
  ## A bucket cannot be emptied while event notifications are configured. Remove the
  ## event
  ## notification rules and retry requests rejected with HTTP 409 / error code 10034.
  ## To
  ## protect a bucket with R2 Data Catalog enabled, send the
  ## `cf-r2-data-catalog-check` header;
  ## a conflict is returned with HTTP 409 / error code 10081.
  ##
  ## For most workloads, we recommend using R2's [S3-compatible
  ## API](https://developers.cloudflare.com/r2/api/s3/api/) or a [Worker with an R2b
  ## inding](https://developers.cloudflare.com/r2/api/workers/workers-api-reference/)
  ## instead.

  var q = initOrderedTable[string, string]()
  q["prefix"] = $prefix
  let res = await client.httpDELETE(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/objects", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdR2BucketsBucketNameObjectsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdR2BucketsBucketNameObjectsObjectKey*(client: CloudflareClient,
                                                              accountId: types.R2AccountIdentifier,
                                                              bucketName: types.R2BucketName,
                                                              objectKey: string): Future[AsyncResponse] {.async.} =
  ## Retrieves an object from an R2 bucket. Returns the object body along with
  ## metadata headers.
  ##
  ## For most workloads, we recommend using R2's [S3-compatible
  ## API](https://developers.cloudflare.com/r2/api/s3/api/) or a [Worker with an R2b
  ## inding](https://developers.cloudflare.com/r2/api/workers/workers-api-reference/)
  ## instead.

  let res = await client.httpGET(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/objects/{objectKey}")
  return res

proc putAccountsAccountIdR2BucketsBucketNameObjectsObjectKey*(client: CloudflareClient,
                                                              accountId: types.R2AccountIdentifier,
                                                              bucketName: types.R2BucketName,
                                                              objectKey: string): Future[JsonNode] {.async.} =
  ## Uploads an object to an R2 bucket. The object body is provided as the request
  ## body. Returns metadata about the uploaded object.
  ##
  ## The maximum upload size for this endpoint is 300 MB. For most workloads, we
  ## recommend using R2's [S3-compatible
  ## API](https://developers.cloudflare.com/r2/api/s3/api/) or a [Worker with an R2b
  ## inding](https://developers.cloudflare.com/r2/api/workers/workers-api-reference/)
  ## instead.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/objects/{objectKey}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdR2BucketsBucketNameObjectsObjectKey*(client: CloudflareClient,
                                                                 accountId: types.R2AccountIdentifier,
                                                                 bucketName: types.R2BucketName,
                                                                 objectKey: string): Future[JsonNode] {.async.} =
  ## Deletes an object from an R2 bucket.
  ##
  ## For most workloads, we recommend using R2's [S3-compatible
  ## API](https://developers.cloudflare.com/r2/api/s3/api/) or a [Worker with an R2b
  ## inding](https://developers.cloudflare.com/r2/api/workers/workers-api-reference/)
  ## instead.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/objects/{objectKey}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
