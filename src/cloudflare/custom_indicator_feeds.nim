# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdIntelIndicatorFeeds*(client: CloudflareClient,
                                              accountId: types.CustomIndicatorFeedsIdentifier): Future[types.CustomIndicatorFeedsIndicatorFeedResponse] {.async.} =
  ## Retrieves details for all accessible custom threat indicator feeds.

  let res = await client.httpGET(fmt"/accounts/{accountId}/intel/indicator-feeds")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomIndicatorFeedsIndicatorFeedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdIntelIndicatorFeeds*(client: CloudflareClient,
                                               accountId: types.CustomIndicatorFeedsIdentifier,
                                               body: types.CustomIndicatorFeedsCreateFeed): Future[types.CustomIndicatorFeedsCreateFeedResponse] {.async.} =
  ## Creates a new custom threat indicator feed for sharing threat intelligence data.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/intel/indicator-feeds", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomIndicatorFeedsCreateFeedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdIntelIndicatorFeedsPermissionsAdd*(client: CloudflareClient,
                                                            accountId: types.CustomIndicatorFeedsIdentifier,
                                                            body: types.CustomIndicatorFeedsPermissionsRequest): Future[types.CustomIndicatorFeedsPermissionsResponse] {.async.} =
  ## Grants access permissions for a custom threat indicator feed to other accounts.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/intel/indicator-feeds/permissions/add", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomIndicatorFeedsPermissionsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdIntelIndicatorFeedsPermissionsCreateProvider*(client: CloudflareClient,
                                                                       accountId: types.CustomIndicatorFeedsIdentifier,
                                                                       body: types.CustomIndicatorFeedsCreateProviderRequest): Future[types.CustomIndicatorFeedsCreateProviderResponse] {.async.} =
  ## Creates a new indicator feed provider for an account. Only available to Intel
  ## accounts.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/intel/indicator-feeds/permissions/createProvider", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomIndicatorFeedsCreateProviderResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdIntelIndicatorFeedsPermissionsRemove*(client: CloudflareClient,
                                                               accountId: types.CustomIndicatorFeedsIdentifier,
                                                               body: types.CustomIndicatorFeedsPermissionsRequest): Future[types.CustomIndicatorFeedsPermissionsResponse] {.async.} =
  ## Revokes access permissions for a custom threat indicator feed.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/intel/indicator-feeds/permissions/remove", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomIndicatorFeedsPermissionsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdIntelIndicatorFeedsPermissionsView*(client: CloudflareClient,
                                                             accountId: types.CustomIndicatorFeedsIdentifier): Future[types.CustomIndicatorFeedsPermissionListItemResponse] {.async.} =
  ## Lists current access permissions for custom threat indicator feeds.

  let res = await client.httpGET(fmt"/accounts/{accountId}/intel/indicator-feeds/permissions/view")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomIndicatorFeedsPermissionListItemResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdIntelIndicatorFeedsFeedId*(client: CloudflareClient,
                                                    accountId: types.CustomIndicatorFeedsIdentifier,
                                                    feedId: types.CustomIndicatorFeedsFeedId): Future[types.CustomIndicatorFeedsIndicatorFeedMetadataResponse] {.async.} =
  ## Retrieves details for a specific custom threat indicator feed.

  let res = await client.httpGET(fmt"/accounts/{accountId}/intel/indicator-feeds/{feedId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomIndicatorFeedsIndicatorFeedMetadataResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdIntelIndicatorFeedsFeedId*(client: CloudflareClient,
                                                    accountId: types.CustomIndicatorFeedsIdentifier,
                                                    feedId: types.CustomIndicatorFeedsFeedId,
                                                    body: types.CustomIndicatorFeedsUpdatePublicFieldRequest): Future[types.CustomIndicatorFeedsUpdatePublicFieldResponse] {.async.} =
  ## Revises details for a specific custom threat indicator feed.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/intel/indicator-feeds/{feedId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomIndicatorFeedsUpdatePublicFieldResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdIntelIndicatorFeedsFeedIdData*(client: CloudflareClient,
                                                        accountId: types.CustomIndicatorFeedsIdentifier,
                                                        feedId: types.CustomIndicatorFeedsFeedId): Future[AsyncResponse] {.async.} =
  ## Retrieves the raw data entries in a custom threat indicator feed.

  let res = await client.httpGET(fmt"/accounts/{accountId}/intel/indicator-feeds/{feedId}/data")
  return res

proc getAccountsAccountIdIntelIndicatorFeedsFeedIdDownload*(client: CloudflareClient,
                                                            accountId: types.CustomIndicatorFeedsIdentifier,
                                                            feedId: types.CustomIndicatorFeedsFeedId): Future[types.CustomIndicatorFeedsUpdateFeedResponse] {.async.} =
  ## Downloads the content of a custom threat indicator feed.

  let res = await client.httpGET(fmt"/accounts/{accountId}/intel/indicator-feeds/{feedId}/download")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomIndicatorFeedsUpdateFeedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdIntelIndicatorFeedsFeedIdSnapshot*(client: CloudflareClient,
                                                            accountId: types.CustomIndicatorFeedsIdentifier,
                                                            feedId: types.CustomIndicatorFeedsFeedId): Future[types.CustomIndicatorFeedsUpdateFeedResponse] {.async.} =
  ## Revises the raw data entries in a custom threat indicator feed.
  ##
  ## Accepts both plain and gzipped STIX2/CRDF bodies. Gzip is
  ## detected by RFC 1952 magic bytes (`0x1f 0x8b`) and/or a `.gz`
  ## filename suffix (case-insensitive) — either signal alone is
  ## sufficient to trigger the gzip path; if the body is not valid
  ## gzip, the upload fails fast. Customers are encouraged to gzip
  ## larger uploads — the api-gateway 500 MB body cap applies to
  ## the on-the-wire (compressed) size, so gzip lets a single
  ## upload carry several GiB of decompressed STIX.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/intel/indicator-feeds/{feedId}/snapshot")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomIndicatorFeedsUpdateFeedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdIntelIndicatorFeedsFeedIdUploadsUploadId*(client: CloudflareClient,
                                                                   accountId: types.CustomIndicatorFeedsIdentifier,
                                                                   feedId: types.CustomIndicatorFeedsFeedId,
                                                                   uploadId: int64): Future[types.CustomIndicatorFeedsUploadStatusResponse] {.async.} =
  ## Polls an asynchronously accepted upload. Continue polling after the
  ## recommended `poll_after_seconds` delay until status is `Unified` or
  ## `Error`. `Unified` is returned only after the durable loader finishes.

  let res = await client.httpGET(fmt"/accounts/{accountId}/intel/indicator-feeds/{feedId}/uploads/{uploadId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomIndicatorFeedsUploadStatusResponse)
  else:
    raise newException(CloudflareClientError, body)
