# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdIamPermissionGroups*(client: CloudflareClient,
                                              accountId: types.IamAccountIdentifier,
                                              id: string = default(string),
                                              name: string = default(string),
                                              label: string = default(string),
                                              page: float64 = default(float64),
                                              perPage: float64 = default(float64)): Future[types.IamCollectionPermissionGroupsResponse] {.async.} =
  ## List all the permissions groups for an account.

  var q = initOrderedTable[string, string]()
  q["id"] = $id
  q["name"] = $name
  q["label"] = $label
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/iam/permission_groups", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamCollectionPermissionGroupsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdIamPermissionGroupsPermissionGroupId*(client: CloudflareClient,
                                                               accountId: types.IamAccountIdentifier,
                                                               permissionGroupId: types.IamPermissionGroupIdentifier): Future[types.IamSinglePermissionGroupsResponse] {.async.} =
  ## Get information about a specific permission group in an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/iam/permission_groups/{permissionGroupId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSinglePermissionGroupsResponse)
  else:
    raise newException(CloudflareClientError, body)
