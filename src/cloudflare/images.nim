# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdV1ImagesResponse* = object
    result: JsonNode
    success: bool
  PostAccountsAccountIdV1ImagesResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdV1ImagesImageIdResponse* = object
    result: JsonNode
    success: bool
  PutAccountsAccountIdV1ImagesImageIdResponse* = object
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdV1ImagesImageIdResponse* = object
    result: JsonNode
    success: bool
  PatchAccountsAccountIdV1ImagesImageIdRequest = object
    creator: Option[string]
    metadata: Option[JsonNode]
    require_signed_u_r_ls: Option[bool]
  PatchAccountsAccountIdV1ImagesImageIdResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdV2ImagesResponse* = object
    result: JsonNode
    success: bool
  PostAccountsAccountIdV2ImagesDirectUploadResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdZonesZoneIdV1ImagesFlowsResponse* = object
    result: JsonNode
    success: bool
  PutAccountsAccountIdZonesZoneIdV1ImagesFlowsRequest = object
    etag: Option[string]
    flows: seq[JsonNode]
    version: float64
  PutAccountsAccountIdZonesZoneIdV1ImagesFlowsResponse* = object
    result: JsonNode
    success: bool
  ImageSortOrderOption* = enum
    sortOrderAsc = "asc"
    sortOrderDesc = "desc"


proc getAccountsAccountIdV1Images*(client: CloudflareClient, accountId: string,
                                   perPage: int64 = 1000,
                                   continuationToken: string = default(string),
                                   creator: string = default(string),
                                   sortOrder: ImageSortOrderOption = sortOrderDesc): Future[GetAccountsAccountIdV1ImagesResponse] {.async.} =
  ## List images for an account.

  var q = initOrderedTable[string, string]()
  q["per_page"] = $perPage
  q["continuation_token"] = $continuationToken
  q["creator"] = $creator
  q["sort_order"] = $sortOrder
  let res = await client.httpGET(fmt"/accounts/{accountId}/v1/images", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdV1ImagesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdV1Images*(client: CloudflareClient, accountId: string): Future[PostAccountsAccountIdV1ImagesResponse] {.async.} =
  ## Upload a new image.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/v1/images")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdV1ImagesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdV1ImagesImageId*(client: CloudflareClient,
                                          accountId: string, imageId: string): Future[GetAccountsAccountIdV1ImagesImageIdResponse] {.async.} =
  ## Get image metadata.

  let res = await client.httpGET(fmt"/accounts/{accountId}/v1/images/{imageId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdV1ImagesImageIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdV1ImagesImageId*(client: CloudflareClient,
                                          accountId: string, imageId: string): Future[PutAccountsAccountIdV1ImagesImageIdResponse] {.async.} =
  ## Upload an image to a specific image ID.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/v1/images/{imageId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdV1ImagesImageIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdV1ImagesImageId*(client: CloudflareClient,
                                             accountId: string, imageId: string): Future[DeleteAccountsAccountIdV1ImagesImageIdResponse] {.async.} =
  ## Delete an image.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/v1/images/{imageId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdV1ImagesImageIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdV1ImagesImageId*(client: CloudflareClient,
                                            accountId: string, imageId: string,
                                            body: PatchAccountsAccountIdV1ImagesImageIdRequest): Future[PatchAccountsAccountIdV1ImagesImageIdResponse] {.async.} =
  ## Update an image's metadata.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/v1/images/{imageId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdV1ImagesImageIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdV1ImagesImageIdBlob*(client: CloudflareClient,
                                              accountId: string, imageId: string): Future[AsyncResponse] {.async.} =
  ## Get image as a blob.

  let res = await client.httpGET(fmt"/accounts/{accountId}/v1/images/{imageId}/blob")
  return res

proc getAccountsAccountIdV2Images*(client: CloudflareClient, accountId: string,
                                   perPage: int64 = 1000,
                                   continuationToken: string = default(string),
                                   creator: string = default(string),
                                   sortOrder: ImageSortOrderOption = sortOrderDesc): Future[GetAccountsAccountIdV2ImagesResponse] {.async.} =
  ## List images for an account.

  var q = initOrderedTable[string, string]()
  q["per_page"] = $perPage
  q["continuation_token"] = $continuationToken
  q["creator"] = $creator
  q["sort_order"] = $sortOrder
  let res = await client.httpGET(fmt"/accounts/{accountId}/v2/images", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdV2ImagesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdV2ImagesDirectUpload*(client: CloudflareClient,
                                                accountId: string): Future[PostAccountsAccountIdV2ImagesDirectUploadResponse] {.async.} =
  ## Create an authenticated direct upload URL for an image.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/v2/images/direct_upload")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdV2ImagesDirectUploadResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdZonesZoneIdV1ImagesFlows*(client: CloudflareClient,
                                                   accountId: string,
                                                   zoneId: string): Future[GetAccountsAccountIdZonesZoneIdV1ImagesFlowsResponse] {.async.} =
  ## Get the current transformation flows configuration for a zone.

  let res = await client.httpGET(fmt"/accounts/{accountId}/zones/{zoneId}/v1/images/flows")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdZonesZoneIdV1ImagesFlowsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdZonesZoneIdV1ImagesFlows*(client: CloudflareClient,
                                                   accountId: string,
                                                   zoneId: string,
                                                   body: PutAccountsAccountIdZonesZoneIdV1ImagesFlowsRequest): Future[PutAccountsAccountIdZonesZoneIdV1ImagesFlowsResponse] {.async.} =
  ## Replace the entire transformation flows configuration for a zone.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/zones/{zoneId}/v1/images/flows", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdZonesZoneIdV1ImagesFlowsResponse)
  else:
    raise newException(CloudflareClientError, body)
