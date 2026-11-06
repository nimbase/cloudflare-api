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
  GetOrganizationsResponse* = object
    errors: seq[JsonNode]
    messages: seq[types.OrganizationsApiV4Message]
    result: seq[types.OrganizationsApiOrganization]
    result_info: types.OrganizationsApiPageTokenResultInfo
    success: bool
  PostOrganizationsResponse* = object
    errors: seq[JsonNode]
    messages: seq[types.OrganizationsApiV4Message]
    result: types.OrganizationsApiOrganization
    success: bool
  GetOrganizationsOrganizationIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[types.OrganizationsApiV4Message]
    result: types.OrganizationsApiOrganization
    success: bool
  PutOrganizationsOrganizationIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[types.OrganizationsApiV4Message]
    result: types.OrganizationsApiOrganization
    success: bool
  DeleteOrganizationsOrganizationIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[types.OrganizationsApiV4Message]
    result: types.OrganizationsApiDeleteOrganizationResult
    success: bool
  GetOrganizationsOrganizationIdAccountsResponse* = object
    errors: seq[JsonNode]
    messages: seq[types.OrganizationsApiV4Message]
    result: seq[JsonNode]
    result_info: types.OrganizationsApiAccountListResultInfo
    success: bool
  PutOrganizationsOrganizationIdInvitesMemberCodeResponse* = object
    errors: seq[JsonNode]
    messages: seq[types.OrganizationsApiV4Message]
    result: types.OrganizationsApiOrganizationInviteMember
    success: bool
  OrganizationOrderByOption* = enum
    orderByName = "name"

  OrganizationDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"

  OrganizationStatusOption* = enum
    statusActive = "active"
    statusDeleted = "deleted"


proc getOrganizations*(client: CloudflareClient, id: seq[string] = @[],
                       name: string = default(string),
                       nameStartsWith: string = default(string),
                       nameEndsWith: string = default(string),
                       nameContains: string = default(string),
                       containingAccount: string = default(string),
                       containingUser: string = default(string),
                       containingOrganization: string = default(string),
                       parentId: JsonNode = default(JsonNode),
                       memberEmail: string = default(string),
                       orderBy: OrganizationOrderByOption = orderByName,
                       direction: OrganizationDirectionOption = directionAsc,
                       pageToken: string = default(string),
                       pageSize: int64 = default(int64)): Future[GetOrganizationsResponse] {.async.} =
  ## Retrieve a list of organizations a particular user has access to. At most one of
  ## `containing.account`, `containing.user`, or `containing.organization` may be
  ## provided.

  var q = initOrderedTable[string, string]()
  for v in id: q["id"] = $v
  q["name"] = $name
  q["name.startsWith"] = $nameStartsWith
  q["name.endsWith"] = $nameEndsWith
  q["name.contains"] = $nameContains
  q["containing.account"] = $containingAccount
  q["containing.user"] = $containingUser
  q["containing.organization"] = $containingOrganization
  q["parent.id"] = $parentId
  q["member.email"] = $memberEmail
  q["order_by"] = $orderBy
  q["direction"] = $direction
  q["page_token"] = $pageToken
  q["page_size"] = $pageSize
  let res = await client.httpGET("/organizations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetOrganizationsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postOrganizations*(client: CloudflareClient,
                        body: types.OrganizationsApiCreateOrganizationRequest): Future[PostOrganizationsResponse] {.async.} =
  ## Create a new organization for a user. Sub-organization creation availability
  ## depends on
  ## the organization's capabilities. The optional `profile` object accepts partial
  ## profile
  ## details; its individual fields are not required. Organization names are limited
  ## to 65
  ## UTF-8 bytes. Each profile field is limited to 1,000 UTF-8 bytes, and a non-empty
  ## business
  ## email must be valid. At least one of business name, address, phone, or email
  ## must be
  ## non-empty to persist a profile.

  let res = await client.httpPOST("/organizations", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostOrganizationsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getOrganizationsOrganizationId*(client: CloudflareClient,
                                     organizationId: types.OrganizationsApiOrganizationID): Future[GetOrganizationsOrganizationIdResponse] {.async.} =
  ## Retrieve the details of a certain organization.

  let res = await client.httpGET(fmt"/organizations/{organizationId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetOrganizationsOrganizationIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putOrganizationsOrganizationId*(client: CloudflareClient,
                                     organizationId: types.OrganizationsApiOrganizationID,
                                     body: types.OrganizationsApiModifyOrganizationRequest): Future[PutOrganizationsOrganizationIdResponse] {.async.} =
  ## Update an organization's name. Supplying `parent_id` verifies the current
  ## parent; this
  ## endpoint cannot move an organization. Organization names are limited to 65 UTF-8
  ## bytes.

  let res = await client.httpPUT(fmt"/organizations/{organizationId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutOrganizationsOrganizationIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteOrganizationsOrganizationId*(client: CloudflareClient,
                                        organizationId: types.OrganizationsApiOrganizationID): Future[DeleteOrganizationsOrganizationIdResponse] {.async.} =
  ## Delete an organization. It must not contain active sub-organizations or
  ## accounts. A root
  ## organization must also have no active managed users. Sub-organization deletion
  ## availability
  ## depends on the organization's capabilities.
  ##
  ## **Access Control:** Root deletion is restricted to enterprise organizations.

  let res = await client.httpDELETE(fmt"/organizations/{organizationId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteOrganizationsOrganizationIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getOrganizationsOrganizationIdAccounts*(client: CloudflareClient,
                                             organizationId: types.OrganizationsApiOrganizationID,
                                             accountPubname: string = default(string),
                                             accountPubnameStartsWith: string = default(string),
                                             accountPubnameEndsWith: string = default(string),
                                             accountPubnameContains: string = default(string),
                                             name: string = default(string),
                                             nameStartsWith: string = default(string),
                                             nameEndsWith: string = default(string),
                                             nameContains: string = default(string),
                                             status: OrganizationStatusOption = statusActive,
                                             orderBy: OrganizationOrderByOption = orderByName,
                                             direction: OrganizationDirectionOption = directionAsc,
                                             includeTags: bool = default(bool),
                                             includeTotal: bool = true,
                                             page: int64 = default(int64),
                                             perPage: int64 = default(int64),
                                             pageToken: string = default(string),
                                             pageSize: int64 = default(int64)): Future[GetOrganizationsOrganizationIdAccountsResponse] {.async.} =
  ## Retrieve the accounts immediately attached to a specific organization. Accounts
  ## attached to sub-organizations are not included. Use `page_token` and `page_size`
  ## for cursor
  ## pagination, or provide `page` and `per_page` together for legacy offset
  ## pagination. Cursor
  ## pagination takes precedence when requested. The default response uses Account
  ## fields;
  ## `Accept: application/json; legacy=true` requests the LegacyAccount
  ## representation.

  var q = initOrderedTable[string, string]()
  q["account_pubname"] = $accountPubname
  q["account_pubname.startsWith"] = $accountPubnameStartsWith
  q["account_pubname.endsWith"] = $accountPubnameEndsWith
  q["account_pubname.contains"] = $accountPubnameContains
  q["name"] = $name
  q["name.startsWith"] = $nameStartsWith
  q["name.endsWith"] = $nameEndsWith
  q["name.contains"] = $nameContains
  q["status"] = $status
  q["order_by"] = $orderBy
  q["direction"] = $direction
  q["include_tags"] = $includeTags
  q["include_total"] = $includeTotal
  q["page"] = $page
  q["per_page"] = $perPage
  q["page_token"] = $pageToken
  q["page_size"] = $pageSize
  let res = await client.httpGET(fmt"/organizations/{organizationId}/accounts", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetOrganizationsOrganizationIdAccountsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putOrganizationsOrganizationIdInvitesMemberCode*(client: CloudflareClient,
                                                      organizationId: types.OrganizationsApiOrganizationID,
                                                      memberCode: string,
                                                      body: types.OrganizationsApiHandleOrganizationInviteRequest): Future[PutOrganizationsOrganizationIdInvitesMemberCodeResponse] {.async.} =
  ## Accept or reject an invitation to a specific organization.
  ##
  ## The credential must belong to the invited user. No additional API token
  ## permission is
  ## required.

  let res = await client.httpPUT(fmt"/organizations/{organizationId}/invites/{memberCode}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutOrganizationsOrganizationIdInvitesMemberCodeResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getOrganizationsOrganizationIdProfile*(client: CloudflareClient,
                                            organizationId: types.OrganizationsApiOrganizationID): Future[types.OrganizationsApiProfileResponse] {.async.} =
  ## Retrieves the business profile (name, email, phone, address, and external
  ## metadata)
  ## associated with this organization's customer record. Profiles can be shared
  ## across
  ## accounts and organizations. Only available to members of the organization.

  let res = await client.httpGET(fmt"/organizations/{organizationId}/profile")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.OrganizationsApiProfileResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putOrganizationsOrganizationIdProfile*(client: CloudflareClient,
                                            organizationId: types.OrganizationsApiOrganizationID,
                                            body: types.OrganizationsApiModifyProfileRequest): Future[AsyncResponse] {.async.} =
  ## Partially updates the business profile (name, email, phone, address, and
  ## external metadata)
  ## associated with this organization's customer record, creating the profile if it
  ## does not
  ## exist. Changes apply to every account and organization sharing that profile.
  ## Omitted,
  ## empty, or null fields are left unchanged. Each profile field is limited to 1,000
  ## UTF-8
  ## bytes. Only available to members of the organization.

  let res = await client.httpPUT(fmt"/organizations/{organizationId}/profile", body)
  return res
