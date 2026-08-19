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
    result: types.OrganizationsApiDeleteOrganizationResponse
    success: bool
  GetOrganizationsOrganizationIdAccountsResponse* = object
    errors: seq[JsonNode]
    messages: seq[types.OrganizationsApiV4Message]
    result: seq[types.OrganizationsApiAccount]
    result_info: types.OrganizationsApiPageTokenResultInfo
    success: bool
  OrganizationOrderByOption* = enum
    orderByAccountName = "account_name"

  OrganizationDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getOrganizations*(client: CloudflareClient, id: seq[string] = @[],
                       name: string = default(string),
                       nameStartsWith: string = default(string),
                       nameEndsWith: string = default(string),
                       nameContains: string = default(string),
                       containingAccount: string = default(string),
                       containingUser: string = default(string),
                       containingOrganization: string = default(string),
                       parentId: JsonNode = default(JsonNode),
                       pageToken: string = default(string),
                       pageSize: int64 = default(int64)): Future[GetOrganizationsResponse] {.async.} =
  ## Retrieve a list of organizations a particular user has access to. (Currently in
  ## Public Beta - see https://developers.cloudflare.com/fundamentals/organizations/)

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
                        body: types.OrganizationsApiOrganization): Future[PostOrganizationsResponse] {.async.} =
  ## Create a new organization for a user. (Currently in Public Beta - see
  ## https://developers.cloudflare.com/fundamentals/organizations/)

  let res = await client.httpPOST("/organizations", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostOrganizationsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getOrganizationsOrganizationId*(client: CloudflareClient,
                                     organizationId: types.OrganizationsApiOrganizationID): Future[GetOrganizationsOrganizationIdResponse] {.async.} =
  ## Retrieve the details of a certain organization. (Currently in Public Beta - see
  ## https://developers.cloudflare.com/fundamentals/organizations/)

  let res = await client.httpGET(fmt"/organizations/{organizationId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetOrganizationsOrganizationIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putOrganizationsOrganizationId*(client: CloudflareClient,
                                     organizationId: types.OrganizationsApiOrganizationID,
                                     body: types.OrganizationsApiOrganization): Future[PutOrganizationsOrganizationIdResponse] {.async.} =
  ## Modify organization. (Currently in Public Beta - see
  ## https://developers.cloudflare.com/fundamentals/organizations/)

  let res = await client.httpPUT(fmt"/organizations/{organizationId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutOrganizationsOrganizationIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteOrganizationsOrganizationId*(client: CloudflareClient,
                                        organizationId: types.OrganizationsApiOrganizationID): Future[DeleteOrganizationsOrganizationIdResponse] {.async.} =
  ## Delete an organization. The organization MUST be empty before deleting.
  ## It must not contain any sub-organizations, accounts, members or users.
  ## (Currently in Public Beta - see
  ## https://developers.cloudflare.com/fundamentals/organizations/)
  ##
  ## **Access Control:** Restricted to enterprise organizations.

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
                                             orderBy: set[OrganizationOrderByOption] = {},
                                             direction: set[OrganizationDirectionOption] = {},
                                             pageToken: string = default(string),
                                             pageSize: int64 = default(int64)): Future[GetOrganizationsOrganizationIdAccountsResponse] {.async.} =
  ## Retrieve a list of accounts that belong to a specific organization. (Currently
  ## in Public Beta - see
  ## https://developers.cloudflare.com/fundamentals/organizations/)

  var q = initOrderedTable[string, string]()
  q["account_pubname"] = $accountPubname
  q["account_pubname.startsWith"] = $accountPubnameStartsWith
  q["account_pubname.endsWith"] = $accountPubnameEndsWith
  q["account_pubname.contains"] = $accountPubnameContains
  q["name"] = $name
  q["name.startsWith"] = $nameStartsWith
  q["name.endsWith"] = $nameEndsWith
  q["name.contains"] = $nameContains
  for v in orderBy: q["order_by"] = $v
  for v in direction: q["direction"] = $v
  q["page_token"] = $pageToken
  q["page_size"] = $pageSize
  let res = await client.httpGET(fmt"/organizations/{organizationId}/accounts", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetOrganizationsOrganizationIdAccountsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getOrganizationsOrganizationIdProfile*(client: CloudflareClient,
                                            organizationId: types.OrganizationsApiOrganizationID): Future[types.OrganizationsApiProfileResponse] {.async.} =
  ## Get an organizations profile if it exists. (Currently in Public Beta - see
  ## https://developers.cloudflare.com/fundamentals/organizations/)

  let res = await client.httpGET(fmt"/organizations/{organizationId}/profile")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.OrganizationsApiProfileResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putOrganizationsOrganizationIdProfile*(client: CloudflareClient,
                                            organizationId: types.OrganizationsApiOrganizationID,
                                            body: types.OrganizationsApiProfile): Future[AsyncResponse] {.async.} =
  ## Modify organization profile. (Currently in Public Beta - see
  ## https://developers.cloudflare.com/fundamentals/organizations/)

  let res = await client.httpPUT(fmt"/organizations/{organizationId}/profile", body)
  return res
