# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdScimV2Groups*(client: CloudflareClient,
                                       accountId: types.IamAccountIdentifier,
                                       startIndex: int64 = 1,
                                       count: int64 = default(int64),
                                       filter: string = default(string)): Future[AsyncResponse] {.async.} =
  ## Lists SCIM Group resources for the account. Returns both system groups (backed
  ## by Cloudflare permission groups, prefixed `cloudflare-v1-`) and custom user
  ## groups. Supports filtering by `displayName` using SCIM filter syntax.

  var q = initOrderedTable[string, string]()
  q["startIndex"] = $startIndex
  q["count"] = $count
  q["filter"] = $filter
  let res = await client.httpGET(fmt"/accounts/{accountId}/scim/v2/Groups", q)
  return res

proc postAccountsAccountIdScimV2Groups*(client: CloudflareClient,
                                        accountId: types.IamAccountIdentifier): Future[AsyncResponse] {.async.} =
  ## Creates a new SCIM Group (user group) for the account. The `displayName` must
  ## not be empty and must not begin with `CF` (reserved for system groups).

  let res = await client.httpPOST(fmt"/accounts/{accountId}/scim/v2/Groups")
  return res

proc getAccountsAccountIdScimV2GroupsGroupId*(client: CloudflareClient,
                                              accountId: types.IamAccountIdentifier,
                                              groupId: types.IamScimGroupIdentifier): Future[AsyncResponse] {.async.} =
  ## Retrieves a single SCIM Group resource by group ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/scim/v2/Groups/{groupId}")
  return res

proc deleteAccountsAccountIdScimV2GroupsGroupId*(client: CloudflareClient,
                                                 accountId: types.IamAccountIdentifier,
                                                 groupId: types.IamScimGroupIdentifier): Future[AsyncResponse] {.async.} =
  ## Deletes a SCIM Group (custom user groups only). System groups backed by
  ## Cloudflare permission groups cannot be deleted via SCIM. Returns 204 No Content
  ## on success.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/scim/v2/Groups/{groupId}")
  return res

proc patchAccountsAccountIdScimV2GroupsGroupId*(client: CloudflareClient,
                                                accountId: types.IamAccountIdentifier,
                                                groupId: types.IamScimGroupIdentifier): Future[AsyncResponse] {.async.} =
  ## Partially updates a SCIM Group via PATCH operations (RFC 7644 Section 3.5.2).
  ## Supports add, remove, and replace operations on `members`, `displayName`, and
  ## `externalId`. For system groups (prefixed `cloudflare-v1-`), only member
  ## management operations are supported.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/scim/v2/Groups/{groupId}")
  return res
