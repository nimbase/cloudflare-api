# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdAccessBookmarks*(client: CloudflareClient,
                                          accountId: types.AccessIdentifier3): Future[types.AccessResponseCollection14] {.async.} =
  ## Lists Bookmark applications.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/bookmarks")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection14)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessBookmarksBookmarkId*(client: CloudflareClient,
                                                    bookmarkId: types.AccessUuid,
                                                    accountId: types.AccessIdentifier3): Future[types.AccessSingleResponse13] {.async.} =
  ## Fetches a single Bookmark application.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/bookmarks/{bookmarkId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse13)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessBookmarksBookmarkId*(client: CloudflareClient,
                                                     bookmarkId: types.AccessUuid,
                                                     accountId: types.AccessIdentifier3): Future[types.AccessSingleResponse13] {.async.} =
  ## Create a new Bookmark application.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/bookmarks/{bookmarkId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse13)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAccessBookmarksBookmarkId*(client: CloudflareClient,
                                                    bookmarkId: types.AccessUuid,
                                                    accountId: types.AccessIdentifier3): Future[types.AccessSingleResponse13] {.async.} =
  ## Updates a configured Bookmark application.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/access/bookmarks/{bookmarkId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse13)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAccessBookmarksBookmarkId*(client: CloudflareClient,
                                                       bookmarkId: types.AccessUuid,
                                                       accountId: types.AccessIdentifier3): Future[types.AccessIdResponse] {.async.} =
  ## Deletes a Bookmark application.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/access/bookmarks/{bookmarkId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessIdResponse)
  else:
    raise newException(CloudflareClientError, body)
