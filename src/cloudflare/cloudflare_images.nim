# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types

type
  CloudflareImageSortOrderOption* = enum
    sortOrderAsc = "asc"
    sortOrderDesc = "desc"


proc getAccountsAccountIdImagesV1*(client: CloudflareClient,
                                   accountId: types.ImagesAccountIdentifier,
                                   page: float64 = default(float64),
                                   perPage: float64 = default(float64),
                                   creator: string = default(string)): Future[types.ImagesImagesListResponse] {.async.} =
  ## List up to 100 images with one request. Use the optional parameters below to get
  ## a specific range of images.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["creator"] = $creator
  let res = await client.httpGET(fmt"/accounts/{accountId}/images/v1", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesImagesListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdImagesV1*(client: CloudflareClient,
                                    accountId: types.ImagesAccountIdentifier): Future[types.ImagesImageResponseSingle] {.async.} =
  ## Upload an image to CF Images. Images up to 10 Megabytes can be uploaded using a
  ## single HTTP POST (multipart/form-data) request by sending an image file or
  ## passing a URL accessible to the API.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/images/v1")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesImageResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdImagesV1DirectUpload*(client: CloudflareClient,
                                                accountId: types.ImagesAccountIdentifier,
                                                body: types.ImagesImageDirectUploadRequestV1): Future[types.ImagesImageDirectUploadResponseV1] {.async.} =
  ## Direct uploads allow users to upload images without API keys. A common use
  ## case are web apps, client-side applications, or mobile devices where users
  ## upload content directly to Cloudflare Images. This method creates a one-time
  ## upload URL. Use the V2 endpoint for additional features such as custom IDs and
  ## metadata.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/images/v1/direct_upload", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesImageDirectUploadResponseV1)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdImagesV1Stats*(client: CloudflareClient,
                                        accountId: types.ImagesAccountIdentifier): Future[types.ImagesImagesStatsResponse] {.async.} =
  ## Fetch image statistics details for Cloudflare Images. The returned statistics
  ## detail storage usage, including the current image count vs this account's
  ## allowance.

  let res = await client.httpGET(fmt"/accounts/{accountId}/images/v1/stats")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesImagesStatsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdImagesV1ImageId*(client: CloudflareClient,
                                          imageId: types.ImagesImageIdentifier,
                                          accountId: types.ImagesAccountIdentifier): Future[types.ImagesImageResponseSingle] {.async.} =
  ## Fetch details for a CF Images image.

  let res = await client.httpGET(fmt"/accounts/{accountId}/images/v1/{imageId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesImageResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdImagesV1ImageId*(client: CloudflareClient,
                                             imageId: types.ImagesImageIdentifier,
                                             accountId: types.ImagesAccountIdentifier): Future[types.ImagesDeletedResponse] {.async.} =
  ## Delete an image on Cloudflare Images. On success, all copies of the image are
  ## deleted and purged from cache.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/images/v1/{imageId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesDeletedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdImagesV1ImageId*(client: CloudflareClient,
                                            imageId: types.ImagesImageIdentifier,
                                            accountId: types.ImagesAccountIdentifier,
                                            body: types.ImagesImagePatchRequest): Future[types.ImagesImageResponseSingle] {.async.} =
  ## Update a CF Images image's metadata, creator, or access control. On access
  ## control change, all copies of the image are purged from cache.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/images/v1/{imageId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesImageResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdImagesV1ImageIdBlob*(client: CloudflareClient,
                                              imageId: types.ImagesImageIdentifier,
                                              accountId: types.ImagesAccountIdentifier): Future[AsyncResponse] {.async.} =
  ## Download an image from CF Images. For most images this will be the originally
  ## uploaded file. For larger images it can be a near-lossless version of the
  ## original.

  let res = await client.httpGET(fmt"/accounts/{accountId}/images/v1/{imageId}/blob")
  return res

proc getAccountsAccountIdImagesV2*(client: CloudflareClient,
                                   accountId: types.ImagesAccountIdentifier,
                                   continuationToken: types.ImagesImagesListContinuationToken = default(types.ImagesImagesListContinuationToken),
                                   perPage: float64 = default(float64),
                                   sortOrder: string = "desc",
                                   creator: string = default(string),
                                   metaFieldOperator: string = default(string)): Future[types.ImagesImagesListResponseV2] {.async.} =
  ## List up to 10000 images from CF Images, with up to 1000 results per page. Use
  ## the optional parameters below to get a specific range of images.
  ## Pagination is supported via continuation_token.
  ##
  ## **Metadata Filtering (Optional):**
  ##
  ## You can optionally filter images by custom metadata fields using the
  ## `meta.<field>[<operator>]=<value>` syntax.
  ##
  ## **Supported Operators:**
  ## - `eq` / `eq:string` / `eq:number` / `eq:boolean` - Exact match
  ## - `gt` / `gt:number` - Greater than (number only)
  ## - `gte` / `gte:number` - Greater than or equal (number only)
  ## - `lt` / `lt:number` - Less than (number only)
  ## - `lte` / `lte:number` - Less than or equal (number only)
  ## - `in` / `in:string` / `in:number` - Match any value in list (pipe-separated)
  ##
  ## **Metadata Filter Constraints:**
  ## - Maximum 5 metadata filters per request
  ## - Maximum 5 levels of nesting (e.g., `meta.first.second.third.fourth.fifth`)
  ## - Maximum 10 elements for list operators (`in`)
  ## - Supports string, number, and boolean value types
  ## - Range operators (`gt`, `gte`, `lt`, `lte`) only accept numeric values
  ##
  ## **Filter Consistency:**
  ## Filters are combined with AND logic. The system does not validate whether filter
  ## combinations are logically consistent. For example,
  ## `meta.priority[eq:number]=5&meta.priority[lte:number]=3` will return zero
  ## results because no value can satisfy both conditions simultaneously. It is the
  ## caller's responsibility to ensure filter combinations make sense.
  ##
  ## **Examples:**
  ## ```
  ## # List all images
  ## /images/v2
  ##
  ## # Filter by metadata [eq]
  ## /images/v2?meta.status[eq:string]=active
  ##
  ## # Filter by metadata [in]
  ## /images/v2?meta.status[in]=pending|deleted|flagged
  ##
  ## # Filter by metadata [in:number]
  ## /images/v2?meta.ratings[in:number]=4|5
  ##
  ## # Filter by metadata range [gte:number]
  ## /images/v2?meta.priority[gte:number]=1
  ##
  ## # Filter by bounded range
  ## /images/v2?meta.priority[gte:number]=1&meta.priority[lte:number]=5
  ##
  ## # Filter by nested metadata
  ## /images/v2?meta.region.name[eq]=eu-west
  ##
  ## # Combine metadata filters with creator
  ## /images/v2?meta.status[eq]=active&creator=user123
  ##
  ## # Multiple metadata filters (AND logic)
  ## /images/v2?meta.status[eq]=active&meta.priority[eq:number]=5
  ## ```

  var q = initOrderedTable[string, string]()
  q["continuation_token"] = $continuationToken
  q["per_page"] = $perPage
  for v in sortOrder: q["sort_order"] = $v
  q["creator"] = $creator
  q["meta.<field>[<operator>]"] = $metaFieldOperator
  let res = await client.httpGET(fmt"/accounts/{accountId}/images/v2", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesImagesListResponseV2)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdImagesV2DirectUpload*(client: CloudflareClient,
                                                accountId: types.ImagesAccountIdentifier): Future[types.ImagesImageDirectUploadResponseV2] {.async.} =
  ## Direct uploads allow users to upload images without API keys. A common use case
  ## are web apps, client-side applications, or mobile devices where users upload
  ## content directly to Cloudflare Images. This method creates a draft record for a
  ## future image. It returns an upload URL and an image identifier. To verify if the
  ## image itself has been uploaded, send an image details request
  ## (accounts/:account_identifier/images/v1/:identifier), and check that the `draft:
  ## true` property is not present.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/images/v2/direct_upload")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesImageDirectUploadResponseV2)
  else:
    raise newException(CloudflareClientError, body)
