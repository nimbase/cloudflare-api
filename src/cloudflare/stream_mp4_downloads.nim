# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdStreamIdentifierDownloads*(client: CloudflareClient,
                                                    identifier: types.StreamIdentifier,
                                                    accountId: types.StreamIdentifier2): Future[types.StreamDownloadsResponse] {.async.} =
  ## Lists the downloads created for a video.

  let res = await client.httpGET(fmt"/accounts/{accountId}/stream/{identifier}/downloads")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamDownloadsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdStreamIdentifierDownloads*(client: CloudflareClient,
                                                     identifier: types.StreamIdentifier,
                                                     accountId: types.StreamIdentifier2): Future[types.StreamDownloadsResponse] {.async.} =
  ## Creates a download for a video when a video is ready to view. Use
  ## `/downloads/{download_type}` instead for type-specific downloads. Available
  ## types are `default` and `audio`.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/stream/{identifier}/downloads")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamDownloadsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdStreamIdentifierDownloads*(client: CloudflareClient,
                                                       identifier: types.StreamIdentifier,
                                                       accountId: types.StreamIdentifier2): Future[types.StreamDeletedResponse] {.async.} =
  ## Delete the downloads for a video. Use `/downloads/{download_type}` instead for
  ## type-specific downloads. Available types are `default` and `audio`.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/stream/{identifier}/downloads")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamDeletedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdStreamIdentifierDownloadsDownloadType*(client: CloudflareClient,
                                                                 identifier: types.StreamIdentifier,
                                                                 accountId: types.StreamIdentifier2,
                                                                 downloadType: types.StreamDownloadType): Future[types.StreamDownloadsResponse] {.async.} =
  ## Creates a download for a video of specified type. For backwards-compatibility,
  ## POST requests to /downloads will enable the default download.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/stream/{identifier}/downloads/{downloadType}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamDownloadsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdStreamIdentifierDownloadsDownloadType*(client: CloudflareClient,
                                                                   identifier: types.StreamIdentifier,
                                                                   accountId: types.StreamIdentifier2,
                                                                   downloadType: types.StreamDownloadType): Future[types.StreamDeletedResponse] {.async.} =
  ## Delete specific type of download. For backwards-compatibility, DELETE requests
  ## to /downloads will delete the default download.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/stream/{identifier}/downloads/{downloadType}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamDeletedResponse)
  else:
    raise newException(CloudflareClientError, body)
