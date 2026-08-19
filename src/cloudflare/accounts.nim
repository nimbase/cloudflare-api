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
  PostAccountsMoveRequest = object
    account_ids: seq[string]
    destination_organization_id: string
  PostAccountsMoveResponse* = object
    errors: seq[JsonNode]
    messages: seq[types.OrganizationsApiV4Message]
    result: types.OrganizationsApiBatchAccountMoveResponse
    success: bool
  PostAccountsAccountIdMoveRequest = object
    destination_organization_id: string
  PostAccountsAccountIdMoveResponse* = object
    errors: seq[JsonNode]
    messages: seq[types.OrganizationsApiV4Message]
    result: types.OrganizationsApiMoveAccountResponse
    success: bool
  GetAccountsAccountIdOrganizationsResponse* = object
    errors: seq[JsonNode]
    messages: seq[types.OrganizationsApiV4Message]
    result: seq[types.OrganizationsApiOrganization]
    success: bool
  GetAccountsAccountIdProfileResponse* = object
    errors: seq[JsonNode]
    messages: seq[types.OrganizationsApiV4Message]
    result: types.OrganizationsApiProfile
    success: bool
  AccountDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccounts*(client: CloudflareClient, name: string = default(string),
                  page: float64 = default(float64),
                  perPage: float64 = default(float64),
                  direction: set[AccountDirectionOption] = {}): Future[types.IamResponseCollectionAccounts] {.async.} =
  ## List all accounts you have ownership or verified access to.

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  q["page"] = $page
  q["per_page"] = $perPage
  for v in direction: q["direction"] = $v
  let res = await client.httpGET("/accounts", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamResponseCollectionAccounts)
  else:
    raise newException(CloudflareClientError, body)

proc postAccounts*(client: CloudflareClient, body: types.IamCreateAccount): Future[types.IamResponseSingleAccount] {.async.} =
  ## Create an account (only available for tenant admins at this time)

  let res = await client.httpPOST("/accounts", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamResponseSingleAccount)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsMove*(client: CloudflareClient, body: PostAccountsMoveRequest): Future[PostAccountsMoveResponse] {.async.} =
  ## Batch move a collection of accounts to a specific organization. ⚠️ Not
  ## implemented.

  let res = await client.httpPOST("/accounts/move", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsMoveResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountId*(client: CloudflareClient,
                           accountId: types.IamAccountIdentifier): Future[types.IamResponseSingleAccount] {.async.} =
  ## Get information about a specific account that you are a member of.

  let res = await client.httpGET(fmt"/accounts/{accountId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamResponseSingleAccount)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountId*(client: CloudflareClient,
                           accountId: types.IamAccountIdentifier,
                           body: types.IamComponentsSchemasAccount): Future[types.IamResponseSingleAccount] {.async.} =
  ## Update an existing account.

  let res = await client.httpPUT(fmt"/accounts/{accountId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamResponseSingleAccount)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountId*(client: CloudflareClient, accountId: string): Future[types.IamApiResponseSingleId] {.async.} =
  ## Delete a specific account (only available for tenant admins at this time). This
  ## is a permanent operation that will delete any zones or other resources under the
  ## account

  let res = await client.httpDELETE(fmt"/accounts/{accountId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamApiResponseSingleId)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMove*(client: CloudflareClient, accountId: string,
                                body: PostAccountsAccountIdMoveRequest): Future[PostAccountsAccountIdMoveResponse] {.async.} =
  ## Move an account within an organization hierarchy or an account outside an
  ## organization. (Currently in Public Beta - see
  ## https://developers.cloudflare.com/fundamentals/organizations/)

  let res = await client.httpPOST(fmt"/accounts/{accountId}/move", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdMoveResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdOrganizations*(client: CloudflareClient,
                                        accountId: string): Future[GetAccountsAccountIdOrganizationsResponse] {.async.} =
  ## Retrieve a list of the organizations that "contain" this account or are
  ## managing it.
  ##
  ## The returned list will be in order from "root" to "leaf", where the "leaf"
  ## will be the organization that _immediately_ contains the specified
  ## account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/organizations")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdOrganizationsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdProfile*(client: CloudflareClient, accountId: string): Future[GetAccountsAccountIdProfileResponse] {.async.} =
  ## Retrieves the profile information for a specific Cloudflare account, including
  ## organization details, settings, and metadata. This endpoint is commonly used to
  ## verify account access and retrieve account-level configuration.

  let res = await client.httpGET(fmt"/accounts/{accountId}/profile")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdProfileResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdProfile*(client: CloudflareClient, accountId: string,
                                  body: types.OrganizationsApiProfile): Future[AsyncResponse] {.async.} =
  ## Updates the profile information for a Cloudflare account. Allows modification of
  ## account-level settings and organizational details. Requires Account Settings
  ## Write permission.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/profile", body)
  return res
