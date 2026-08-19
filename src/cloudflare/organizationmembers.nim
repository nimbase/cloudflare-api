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
  GetOrganizationsOrganizationIdMembersResponse* = object
    errors: seq[JsonNode]
    messages: seq[types.OrganizationsApiV4Message]
    result: seq[types.OrganizationsApiMember]
    result_info: types.OrganizationsApiPageTokenResultInfo
    success: bool
  PostOrganizationsOrganizationIdMembersResponse* = object
    errors: seq[JsonNode]
    messages: seq[types.OrganizationsApiV4Message]
    result: types.OrganizationsApiMember
    success: bool
  GetOrganizationsOrganizationIdMembersMemberIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[types.OrganizationsApiV4Message]
    result: types.OrganizationsApiMember
    success: bool
  DeleteOrganizationsOrganizationIdMembersMemberIdRequest = object
    member_id: types.OrganizationsApiMemberID
  PostOrganizationsOrganizationIdMembersBatchCreateResponse* = object
    errors: seq[JsonNode]
    messages: seq[types.OrganizationsApiV4Message]
    result: seq[types.OrganizationsApiMember]
    success: bool

proc getOrganizationsOrganizationIdMembers*(client: CloudflareClient,
                                            organizationId: types.OrganizationsApiOrganizationID,
                                            status: seq[string] = default(seq[string]),
                                            userEmail: string = default(string),
                                            userEmailContains: string = default(string),
                                            userEmailStartsWith: string = default(string),
                                            userEmailEndsWith: string = default(string),
                                            pageToken: string = default(string),
                                            pageSize: int64 = default(int64)): Future[GetOrganizationsOrganizationIdMembersResponse] {.async.} =
  ## List memberships for an Organization. (Currently in Public Beta - see
  ## https://developers.cloudflare.com/fundamentals/organizations/)

  var q = initOrderedTable[string, string]()
  q["status"] = $status
  q["user.email"] = $userEmail
  q["user.email.contains"] = $userEmailContains
  q["user.email.startsWith"] = $userEmailStartsWith
  q["user.email.endsWith"] = $userEmailEndsWith
  q["page_token"] = $pageToken
  q["page_size"] = $pageSize
  let res = await client.httpGET(fmt"/organizations/{organizationId}/members", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetOrganizationsOrganizationIdMembersResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postOrganizationsOrganizationIdMembers*(client: CloudflareClient,
                                             organizationId: types.OrganizationsApiOrganizationID,
                                             body: types.OrganizationsApiCreateMemberRequest): Future[PostOrganizationsOrganizationIdMembersResponse] {.async.} =
  ## Create a membership that grants access to a specific Organization. (Currently in
  ## Public Beta - see https://developers.cloudflare.com/fundamentals/organizations/)

  let res = await client.httpPOST(fmt"/organizations/{organizationId}/members", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostOrganizationsOrganizationIdMembersResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getOrganizationsOrganizationIdMembersMemberId*(client: CloudflareClient,
                                                    organizationId: types.OrganizationsApiOrganizationID,
                                                    memberId: types.OrganizationsApiMemberID): Future[GetOrganizationsOrganizationIdMembersMemberIdResponse] {.async.} =
  ## Retrieve a single membership from an Organization. (Currently in Public Beta -
  ## see https://developers.cloudflare.com/fundamentals/organizations/)

  let res = await client.httpGET(fmt"/organizations/{organizationId}/members/{memberId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetOrganizationsOrganizationIdMembersMemberIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteOrganizationsOrganizationIdMembersMemberId*(client: CloudflareClient,
                                                       organizationId: types.OrganizationsApiOrganizationID,
                                                       memberId: types.OrganizationsApiMemberID,
                                                       body: DeleteOrganizationsOrganizationIdMembersMemberIdRequest): Future[AsyncResponse] {.async.} =
  ## Delete a membership to a particular Organization. (Currently in Public Beta -
  ## see https://developers.cloudflare.com/fundamentals/organizations/)

  let res = await client.httpDELETE(fmt"/organizations/{organizationId}/members/{memberId}", body)
  return res

proc postOrganizationsOrganizationIdMembersBatchCreate*(client: CloudflareClient,
                                                        organizationId: types.OrganizationsApiOrganizationID,
                                                        body: types.OrganizationsApiBatchCreateMembersRequest): Future[PostOrganizationsOrganizationIdMembersBatchCreateResponse] {.async.} =
  ## Batch create multiple memberships that grant access to a specific Organization.

  let res = await client.httpPOST(fmt"/organizations/{organizationId}/members:batchCreate", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostOrganizationsOrganizationIdMembersBatchCreateResponse)
  else:
    raise newException(CloudflareClientError, body)
