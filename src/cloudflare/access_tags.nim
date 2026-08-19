# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdAccessTagsRequest = object
    name: Option[types.AccessName13]

proc getAccountsAccountIdAccessTags*(client: CloudflareClient,
                                     accountId: types.AccessIdentifier,
                                     page: int64 = 1, perPage: int64 = 50): Future[types.AccessResponseCollection15] {.async.} =
  ## List tags

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/tags", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection15)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessTags*(client: CloudflareClient,
                                      accountId: types.AccessIdentifier,
                                      body: PostAccountsAccountIdAccessTagsRequest): Future[types.AccessSingleResponse14] {.async.} =
  ## Create a tag

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/tags", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AccessSingleResponse14)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessTagsTagName*(client: CloudflareClient,
                                            accountId: types.AccessIdentifier,
                                            tagName: types.AccessName13): Future[types.AccessSingleResponse14] {.async.} =
  ## Get a tag

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/tags/{tagName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse14)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAccessTagsTagName*(client: CloudflareClient,
                                            accountId: types.AccessIdentifier,
                                            tagName: types.AccessName13,
                                            body: types.AccessTagWithoutAppCount): Future[types.AccessSingleResponse14] {.async.} =
  ## Update a tag

  let res = await client.httpPUT(fmt"/accounts/{accountId}/access/tags/{tagName}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse14)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAccessTagsTagName*(client: CloudflareClient,
                                               accountId: types.AccessIdentifier,
                                               tagName: types.AccessName13): Future[types.AccessNameResponse] {.async.} =
  ## Delete a tag

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/access/tags/{tagName}")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.AccessNameResponse)
  else:
    raise newException(CloudflareClientError, body)
