# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdStream*(client: CloudflareClient,
                                 accountId: types.StreamAccountIdentifier,
                                 status: types.StreamMediaState = default(types.StreamMediaState),
                                 creator: types.StreamCreator = default(types.StreamCreator),
                                 `type`: types.StreamType = default(types.StreamType),
                                 asc: types.StreamAsc = default(types.StreamAsc),
                                 videoName: types.StreamVideoName = default(types.StreamVideoName),
                                 search: types.StreamSearch = default(types.StreamSearch),
                                 start: types.StreamStart = default(types.StreamStart),
                                 `end`: types.StreamEnd = default(types.StreamEnd),
                                 includeCounts: types.StreamIncludeCounts = default(types.StreamIncludeCounts),
                                 id: string = default(string),
                                 name: string = default(string),
                                 liveInputId: string = default(string),
                                 before: string = default(string),
                                 after: string = default(string),
                                 limit: int64 = default(int64)): Future[types.StreamVideoResponseCollection] {.async.} =
  ## Lists up to 1000 videos from a single request. For a specific range, refer to
  ## the optional parameters.

  var q = initOrderedTable[string, string]()
  q["status"] = $status
  q["creator"] = $creator
  q["type"] = $`type`
  q["asc"] = $asc
  q["video_name"] = $videoName
  q["search"] = $search
  q["start"] = $start
  q["end"] = $`end`
  q["include_counts"] = $includeCounts
  q["id"] = $id
  q["name"] = $name
  q["live_input_id"] = $liveInputId
  q["before"] = $before
  q["after"] = $after
  q["limit"] = $limit
  let res = await client.httpGET(fmt"/accounts/{accountId}/stream", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamVideoResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdStream*(client: CloudflareClient,
                                  accountId: types.StreamAccountIdentifier,
                                  directUser: types.StreamDirectUser = default(types.StreamDirectUser)): Future[AsyncResponse] {.async.} =
  ## Initiates a video upload using the TUS protocol. On success, the server responds
  ## with a status code 201 (created) and includes a `location` header to indicate
  ## where the content should be uploaded. Refer to https://tus.io for protocol
  ## details.

  var q = initOrderedTable[string, string]()
  q["direct_user"] = $directUser
  let res = await client.httpPOST(fmt"/accounts/{accountId}/stream", q)
  return res

proc postAccountsAccountIdStreamCopy*(client: CloudflareClient,
                                      accountId: types.StreamAccountIdentifier,
                                      body: types.StreamVideoCopyRequest): Future[types.StreamVideoResponseSingle] {.async.} =
  ## Uploads a video to Stream from a provided URL.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/stream/copy", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamVideoResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdStreamDirectUpload*(client: CloudflareClient,
                                              accountId: types.StreamAccountIdentifier,
                                              body: types.StreamDirectUploadRequest): Future[types.StreamDirectUploadResponse] {.async.} =
  ## Creates a direct upload that allows video uploads without an API key.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/stream/direct_upload", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamDirectUploadResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdStreamStorageUsage*(client: CloudflareClient,
                                             accountId: types.StreamAccountIdentifier,
                                             creator: types.StreamCreator = default(types.StreamCreator)): Future[types.StreamStorageUseResponse] {.async.} =
  ## Returns information about an account's storage use.

  var q = initOrderedTable[string, string]()
  q["creator"] = $creator
  let res = await client.httpGET(fmt"/accounts/{accountId}/stream/storage-usage", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamStorageUseResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdStreamIdentifier*(client: CloudflareClient,
                                           identifier: types.StreamIdentifier,
                                           accountId: types.StreamAccountIdentifier): Future[types.StreamVideoResponseSingle] {.async.} =
  ## Fetches details for a single video.

  let res = await client.httpGET(fmt"/accounts/{accountId}/stream/{identifier}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamVideoResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdStreamIdentifier*(client: CloudflareClient,
                                            identifier: types.StreamIdentifier,
                                            accountId: types.StreamAccountIdentifier,
                                            body: types.StreamVideoUpdate): Future[types.StreamVideoResponseSingle] {.async.} =
  ## Edit details for a single video.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/stream/{identifier}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamVideoResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdStreamIdentifier*(client: CloudflareClient,
                                              identifier: types.StreamIdentifier,
                                              accountId: types.StreamAccountIdentifier): Future[AsyncResponse] {.async.} =
  ## Deletes a video and its copies from Cloudflare Stream.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/stream/{identifier}")
  return res

proc getAccountsAccountIdStreamIdentifierEmbed*(client: CloudflareClient,
                                                identifier: types.StreamIdentifier,
                                                accountId: types.StreamAccountIdentifier): Future[AsyncResponse] {.async.} =
  ## Fetches an HTML code snippet to embed a video in a web page delivered through
  ## Cloudflare. On success, returns an HTML fragment for use on web pages to display
  ## a video. On failure, returns a JSON response body.

  let res = await client.httpGET(fmt"/accounts/{accountId}/stream/{identifier}/embed")
  return res

proc postAccountsAccountIdStreamIdentifierToken*(client: CloudflareClient,
                                                 identifier: types.StreamIdentifier,
                                                 accountId: types.StreamAccountIdentifier,
                                                 body: types.StreamSignedTokenRequest): Future[types.StreamSignedTokenResponse] {.async.} =
  ## Creates a signed URL token for a video. If a body is not provided in the
  ## request, a token is created with default values.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/stream/{identifier}/token", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamSignedTokenResponse)
  else:
    raise newException(CloudflareClientError, body)
