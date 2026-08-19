# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types

type
  AccountMemberOrderOption* = enum
    orderUserFirstName = "user.first_name"
    orderUserLastName = "user.last_name"
    orderUserEmail = "user.email"
    orderStatus = "status"

  AccountMemberStatusOption* = enum
    statusAccepted = "accepted"
    statusPending = "pending"
    statusRejected = "rejected"

  AccountMemberDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdMembers*(client: CloudflareClient,
                                  accountId: types.IamAccountIdentifier,
                                  order: set[AccountMemberOrderOption] = {},
                                  status: set[AccountMemberStatusOption] = {},
                                  page: float64 = default(float64),
                                  perPage: float64 = default(float64),
                                  direction: set[AccountMemberDirectionOption] = {}): Future[types.IamCollectionMemberResponseWithPolicies] {.async.} =
  ## List all members of an account.

  var q = initOrderedTable[string, string]()
  for v in order: q["order"] = $v
  for v in status: q["status"] = $v
  q["page"] = $page
  q["per_page"] = $perPage
  for v in direction: q["direction"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/members", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamCollectionMemberResponseWithPolicies)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMembers*(client: CloudflareClient,
                                   accountId: types.IamAccountIdentifier): Future[types.IamSingleMemberResponseWithPolicies] {.async.} =
  ## Add a user to the list of members for this account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/members", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSingleMemberResponseWithPolicies)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMembersMemberId*(client: CloudflareClient,
                                          memberId: types.IamMembershipComponentsSchemasIdentifier,
                                          accountId: types.IamAccountIdentifier): Future[types.IamSingleMemberResponseWithPolicies] {.async.} =
  ## Get information about a specific member of an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/members/{memberId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSingleMemberResponseWithPolicies)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMembersMemberId*(client: CloudflareClient,
                                          memberId: types.IamMembershipComponentsSchemasIdentifier,
                                          accountId: types.IamAccountIdentifier): Future[types.IamSingleMemberResponseWithPolicies] {.async.} =
  ## Modify an account member.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/members/{memberId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSingleMemberResponseWithPolicies)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMembersMemberId*(client: CloudflareClient,
                                             memberId: types.IamMembershipComponentsSchemasIdentifier,
                                             accountId: types.IamAccountIdentifier): Future[types.IamApiResponseSingleId] {.async.} =
  ## Remove a member from an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/members/{memberId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamApiResponseSingleId)
  else:
    raise newException(CloudflareClientError, body)
