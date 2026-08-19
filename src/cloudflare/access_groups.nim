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
  PostAccountsAccountIdAccessGroupsRequest = object
    exclude: Option[types.AccessExclude]
    `include`: types.AccessInclude
    is_default: Option[types.AccessIsDefault]
    name: types.AccessName6
    require: Option[types.AccessRequire]
  PutAccountsAccountIdAccessGroupsGroupIdRequest = object
    exclude: Option[types.AccessExclude]
    `include`: types.AccessInclude
    is_default: Option[types.AccessIsDefault]
    name: types.AccessName6
    require: Option[types.AccessRequire]

proc getAccountsAccountIdAccessGroups*(client: CloudflareClient,
                                       accountId: types.AccessIdentifier,
                                       name: string = default(string),
                                       search: string = default(string),
                                       page: int64 = 1, perPage: int64 = 1000): Future[types.AccessResponseCollection2] {.async.} =
  ## Lists all Access groups.

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  q["search"] = $search
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/groups", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection2)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessGroups*(client: CloudflareClient,
                                        accountId: types.AccessIdentifier,
                                        body: PostAccountsAccountIdAccessGroupsRequest): Future[types.AccessSingleResponse4] {.async.} =
  ## Creates a new Access group.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/groups", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AccessSingleResponse4)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessGroupsGroupId*(client: CloudflareClient,
                                              groupId: types.AccessUuid,
                                              accountId: types.AccessIdentifier): Future[types.AccessSingleResponse4] {.async.} =
  ## Fetches a single Access group.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/groups/{groupId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse4)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAccessGroupsGroupId*(client: CloudflareClient,
                                              groupId: types.AccessUuid,
                                              accountId: types.AccessIdentifier,
                                              body: PutAccountsAccountIdAccessGroupsGroupIdRequest): Future[types.AccessSingleResponse4] {.async.} =
  ## Updates a configured Access group.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/access/groups/{groupId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse4)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAccessGroupsGroupId*(client: CloudflareClient,
                                                 groupId: types.AccessUuid,
                                                 accountId: types.AccessIdentifier): Future[types.AccessIdResponse] {.async.} =
  ## Deletes an Access group.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/access/groups/{groupId}")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.AccessIdResponse)
  else:
    raise newException(CloudflareClientError, body)
