# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdScimV2Users*(client: CloudflareClient,
                                      accountId: types.IamAccountIdentifier,
                                      startIndex: int64 = 1,
                                      count: int64 = default(int64),
                                      filter: string = default(string)): Future[AsyncResponse] {.async.} =
  ## Lists account members as SCIM User resources. Supports optional filtering by
  ## `userName` (email) using the SCIM filter syntax (e.g. `userName eq
  ## "user@example.com"`). Pagination is controlled via `startIndex` and `count`
  ## query parameters per RFC 7644 Section 3.4.2.4.

  var q = initOrderedTable[string, string]()
  q["startIndex"] = $startIndex
  q["count"] = $count
  q["filter"] = $filter
  let res = await client.httpGET(fmt"/accounts/{accountId}/scim/v2/Users", q)
  return res

proc postAccountsAccountIdScimV2Users*(client: CloudflareClient,
                                       accountId: types.IamAccountIdentifier): Future[AsyncResponse] {.async.} =
  ## Provisions a new account member via SCIM. The `userName` field must be a valid
  ## email address and must match the primary email in `emails`. The account must be
  ## an Enterprise account with SCIM entitlements enabled.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/scim/v2/Users")
  return res

proc getAccountsAccountIdScimV2UsersUserId*(client: CloudflareClient,
                                            accountId: types.IamAccountIdentifier,
                                            userId: types.IamScimUserIdentifier): Future[AsyncResponse] {.async.} =
  ## Retrieves a single account member as a SCIM User resource by user tag.

  let res = await client.httpGET(fmt"/accounts/{accountId}/scim/v2/Users/{userId}")
  return res

proc putAccountsAccountIdScimV2UsersUserId*(client: CloudflareClient,
                                            accountId: types.IamAccountIdentifier,
                                            userId: types.IamScimUserIdentifier): Future[AsyncResponse] {.async.} =
  ## Replaces a SCIM User resource (RFC 7644 Section 3.5.1). Fully replaces the
  ## mutable attributes of the user. Supports updating `userName`, `name`, `emails`,
  ## and `active`.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/scim/v2/Users/{userId}")
  return res

proc deleteAccountsAccountIdScimV2UsersUserId*(client: CloudflareClient,
                                               accountId: types.IamAccountIdentifier,
                                               userId: types.IamScimUserIdentifier): Future[AsyncResponse] {.async.} =
  ## Deprovisions a SCIM User by removing their membership from this account (RFC
  ## 7644 Section 3.6). This does not delete the global Cloudflare user.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/scim/v2/Users/{userId}")
  return res

proc patchAccountsAccountIdScimV2UsersUserId*(client: CloudflareClient,
                                              accountId: types.IamAccountIdentifier,
                                              userId: types.IamScimUserIdentifier): Future[AsyncResponse] {.async.} =
  ## Partially updates a SCIM User via PATCH operations (RFC 7644 Section 3.5.2).
  ## Supports updating `userName`, `name.givenName`, `name.familyName`, and `active`.
  ## Setting `active: false` deprovisions the user (removes them from the account).
  ## For IdP compatibility, `emails[type eq "work"].value` is also accepted as an
  ## alias for `userName`.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/scim/v2/Users/{userId}")
  return res
