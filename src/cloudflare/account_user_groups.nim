# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types

type
  AccountUserGroupDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdIamUserGroups*(client: CloudflareClient,
                                        accountId: types.IamAccountIdentifier,
                                        id: types.IamUserGroupIdentifier = default(types.IamUserGroupIdentifier),
                                        name: string = default(string),
                                        fuzzyName: string = default(string),
                                        page: float64 = default(float64),
                                        perPage: float64 = default(float64),
                                        direction: AccountUserGroupDirectionOption = directionAsc): Future[JsonNode] {.async.} =
  ## List all the user groups for an account.

  var q = initOrderedTable[string, string]()
  q["id"] = $id
  q["name"] = $name
  q["fuzzyName"] = $fuzzyName
  q["page"] = $page
  q["per_page"] = $perPage
  q["direction"] = $direction
  let res = await client.httpGET(fmt"/accounts/{accountId}/iam/user_groups", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdIamUserGroups*(client: CloudflareClient,
                                         accountId: types.IamAccountIdentifier,
                                         body: types.IamCreateUserGroupBody): Future[JsonNode] {.async.} =
  ## Create a new user group under the specified account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/iam/user_groups", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdIamUserGroupsUserGroupId*(client: CloudflareClient,
                                                   accountId: types.IamAccountIdentifier,
                                                   userGroupId: types.IamUserGroupIdentifier): Future[JsonNode] {.async.} =
  ## Get information about a specific user group in an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/iam/user_groups/{userGroupId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdIamUserGroupsUserGroupId*(client: CloudflareClient,
                                                   accountId: types.IamAccountIdentifier,
                                                   userGroupId: types.IamUserGroupIdentifier,
                                                   body: types.IamUpdateUserGroupBody): Future[JsonNode] {.async.} =
  ## Modify an existing user group.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/iam/user_groups/{userGroupId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdIamUserGroupsUserGroupId*(client: CloudflareClient,
                                                      accountId: types.IamAccountIdentifier,
                                                      userGroupId: types.IamUserGroupIdentifier): Future[types.IamApiResponseSingleId] {.async.} =
  ## Remove a user group from an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/iam/user_groups/{userGroupId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamApiResponseSingleId)
  else:
    raise newException(CloudflareClientError, body)
