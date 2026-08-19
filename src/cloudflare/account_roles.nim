# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdRoles*(client: CloudflareClient,
                                accountId: types.IamAccountIdentifier,
                                page: float64 = default(float64),
                                perPage: float64 = default(float64)): Future[types.IamCollectionRoleResponse] {.async.} =
  ## Get all available roles for an account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/roles", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamCollectionRoleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRolesRoleId*(client: CloudflareClient,
                                      roleId: types.IamRoleComponentsSchemasIdentifier,
                                      accountId: types.IamAccountIdentifier): Future[types.IamSingleRoleResponse] {.async.} =
  ## Get information about a specific role for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/roles/{roleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSingleRoleResponse)
  else:
    raise newException(CloudflareClientError, body)
