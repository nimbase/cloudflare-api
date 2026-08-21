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
  DeleteUserOrganizationsOrganizationIdResponse* = object
    id: types.IamCommonComponentsSchemasIdentifier
  UserSOrganizationOrderOption* = enum
    orderId = "id"
    orderName = "name"
    orderStatus = "status"

  UserSOrganizationDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"

  UserSOrganizationMatchOption* = enum
    matchAny = "any"
    matchAll = "all"

  UserSOrganizationStatusOption* = enum
    statusMember = "member"
    statusInvited = "invited"


proc getUserOrganizations*(client: CloudflareClient,
                           name: types.IamSchemasName = default(types.IamSchemasName),
                           page: float64 = default(float64),
                           perPage: float64 = default(float64),
                           order: UserSOrganizationOrderOption,
                           direction: UserSOrganizationDirectionOption,
                           match: UserSOrganizationMatchOption = matchAll,
                           status: UserSOrganizationStatusOption): Future[types.IamCollectionOrganizationResponse] {.async.} =
  ## Lists organizations the user is associated with.

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  q["page"] = $page
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  q["match"] = $match
  q["status"] = $status
  let res = await client.httpGET("/user/organizations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamCollectionOrganizationResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getUserOrganizationsOrganizationId*(client: CloudflareClient,
                                         organizationId: types.IamCommonComponentsSchemasIdentifier): Future[types.IamSingleOrganizationResponse] {.async.} =
  ## Gets a specific organization the user is associated with.

  let res = await client.httpGET(fmt"/user/organizations/{organizationId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSingleOrganizationResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteUserOrganizationsOrganizationId*(client: CloudflareClient,
                                            organizationId: types.IamCommonComponentsSchemasIdentifier): Future[DeleteUserOrganizationsOrganizationIdResponse] {.async.} =
  ## Removes association to an organization.

  let res = await client.httpDELETE(fmt"/user/organizations/{organizationId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteUserOrganizationsOrganizationIdResponse)
  else:
    raise newException(CloudflareClientError, body)
