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
                                                        prefix: string = default(string)): Future[JsonNode] {.async.} =
  ## Deletes the listed objects from an R2 bucket. Provide a JSON array of 1 to 1000
  ## object
  ## keys in the request body.
  ##
  ## If any key cannot be deleted (for example, because it does not exist or is
  ## locked), the
  ## remaining keys are still deleted, but the response is HTTP 200 with `success:
  ## false`,
  ## `result: null` and one entry in `errors` per failed key. The entries in `errors`
  ## do not
  ## identify which key failed.
  ##
  ## To delete every object under a prefix, or to empty a bucket, create a
  ## `prefixDelete` job
  ## with the Create Bucket Job endpoint instead. The `prefix` query parameter on
  ## this endpoint
  ## is deprecated; it creates the same job, but responses to it carry a
  ## `Deprecation` header
  ## and a message pointing to Create Bucket Job.
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
    result = fromJson(body, JsonNode)
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
