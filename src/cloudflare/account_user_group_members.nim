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
  AccountUserGroupMemberDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdIamUserGroupsUserGroupIdMembers*(client: CloudflareClient,
                                                          accountId: types.IamAccountIdentifier,
                                                          userGroupId: types.IamUserGroupIdentifier,
                                                          page: float64 = default(float64),
                                                          perPage: float64 = default(float64),
                                                          fuzzyEmail: string = default(string),
                                                          direction: AccountUserGroupMemberDirectionOption = directionAsc): Future[JsonNode] {.async.} =
  ## List all the members attached to a user group.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["fuzzyEmail"] = $fuzzyEmail
  q["direction"] = $direction
  let res = await client.httpGET(fmt"/accounts/{accountId}/iam/user_groups/{userGroupId}/members", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdIamUserGroupsUserGroupIdMembers*(client: CloudflareClient,
                                                           accountId: types.IamAccountIdentifier,
                                                           userGroupId: types.IamUserGroupIdentifier): Future[JsonNode] {.async.} =
  ## Add members to a User Group.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/iam/user_groups/{userGroupId}/members", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdIamUserGroupsUserGroupIdMembers*(client: CloudflareClient,
                                                          accountId: types.IamAccountIdentifier,
                                                          userGroupId: types.IamUserGroupIdentifier): Future[JsonNode] {.async.} =
  ## Replace the set of members attached to a User Group.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/iam/user_groups/{userGroupId}/members", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdIamUserGroupsUserGroupIdMembersMemberId*(client: CloudflareClient,
                                                                  accountId: types.IamAccountIdentifier,
                                                                  userGroupId: types.IamUserGroupIdentifier,
                                                                  memberId: types.IamUserGroupMemberIdentifier): Future[JsonNode] {.async.} =
  ## Get details of a specific member in a user group.

  let res = await client.httpGET(fmt"/accounts/{accountId}/iam/user_groups/{userGroupId}/members/{memberId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdIamUserGroupsUserGroupIdMembersMemberId*(client: CloudflareClient,
                                                                     accountId: types.IamAccountIdentifier,
                                                                     userGroupId: types.IamUserGroupIdentifier,
                                                                     memberId: types.IamUserGroupMemberIdentifier): Future[JsonNode] {.async.} =
  ## Remove a member from User Group

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/iam/user_groups/{userGroupId}/members/{memberId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
