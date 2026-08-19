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
  PutMembershipsMembershipIdRequest = object
    status: string
  UserSAccountMembershipOrderOption* = enum
    orderId = "id"
    orderAccountName = "account.name"
    orderStatus = "status"

  UserSAccountMembershipDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"

  UserSAccountMembershipStatusOption* = enum
    statusAccepted = "accepted"
    statusPending = "pending"
    statusRejected = "rejected"


proc getMemberships*(client: CloudflareClient,
                     accountName: types.IamPropertiesName = default(types.IamPropertiesName),
                     page: float64 = default(float64),
                     perPage: float64 = default(float64),
                     order: set[UserSAccountMembershipOrderOption] = {},
                     direction: set[UserSAccountMembershipDirectionOption] = {},
                     name: types.IamPropertiesName = default(types.IamPropertiesName),
                     status: set[UserSAccountMembershipStatusOption] = {}): Future[JsonNode] {.async.} =
  ## List memberships of accounts the user can access.

  var q = initOrderedTable[string, string]()
  q["account.name"] = $accountName
  q["page"] = $page
  q["per_page"] = $perPage
  for v in order: q["order"] = $v
  for v in direction: q["direction"] = $v
  q["name"] = $name
  for v in status: q["status"] = $v
  let res = await client.httpGET("/memberships", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getMembershipsMembershipId*(client: CloudflareClient,
                                 membershipId: types.IamMembershipComponentsSchemasIdentifier): Future[types.IamSingleMembershipResponseWithPolicies] {.async.} =
  ## Get a specific membership.

  let res = await client.httpGET(fmt"/memberships/{membershipId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSingleMembershipResponseWithPolicies)
  else:
    raise newException(CloudflareClientError, body)

proc putMembershipsMembershipId*(client: CloudflareClient,
                                 membershipId: types.IamMembershipComponentsSchemasIdentifier,
                                 body: PutMembershipsMembershipIdRequest): Future[types.IamSingleMembershipResponseWithPolicies] {.async.} =
  ## Accept or reject this account invitation.

  let res = await client.httpPUT(fmt"/memberships/{membershipId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSingleMembershipResponseWithPolicies)
  else:
    raise newException(CloudflareClientError, body)

proc deleteMembershipsMembershipId*(client: CloudflareClient,
                                    membershipId: types.IamMembershipComponentsSchemasIdentifier): Future[JsonNode] {.async.} =
  ## Remove the associated member from an account.

  let res = await client.httpDELETE(fmt"/memberships/{membershipId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
