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
  PostAccountsAccountIdMoveRequest = object
    destination_organization_id: string
  PostAccountsAccountIdMoveResponse* = object
    errors: seq[JsonNode]
    messages: seq[types.OrganizationsApiV4Message]
    result: types.OrganizationsApiMoveAccountResult
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
                  direction: AccountDirectionOption = directionAsc): Future[types.IamResponseCollectionAccounts] {.async.} =
  ## List all accounts you have ownership or verified access to.

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  q["page"] = $page
  q["per_page"] = $perPage
  q["direction"] = $direction
  let res = await client.httpGET("/accounts", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamResponseCollectionAccounts)
  else:
    raise newException(CloudflareClientError, body)

proc postAccounts*(client: CloudflareClient, body: types.IamCreateAccount): Future[types.IamResponseSingleAccount] {.async.} =
  ## Create an Account. To create the Account within an Organization, provide
  ## `unit.id` and omit `standalone`. To create a standalone Free Account, provide
  ## `standalone: true` and omit `unit`. Providing both fields is invalid. If you
  ## omit both fields, Cloudflare can determine the destination only when the User is
  ## an administrator of exactly one Organization. Cloudflare creates the Account in
  ## that Organization; otherwise, the request returns an error. Account names are
  ## limited to 65 UTF-8 bytes.

  let res = await client.httpPOST("/accounts", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamResponseSingleAccount)
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
  ## Update an existing account. Account names are limited to 65 UTF-8 bytes.

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
  ## Move an account into a destination organization, either assigning a standalone
  ## account
  ## to an organization or moving it between organizations in the same hierarchy.
  ## Availability
  ## depends on the organization's capabilities.

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
  ## Retrieves the business profile (name, email, phone, address, and external
  ## metadata)
  ## associated with this account's customer record. Profiles can be shared across
  ## accounts and
  ## organizations. Only available to members of an organization that contains the
  ## account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/profile")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdProfileResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdProfile*(client: CloudflareClient, accountId: string,
                                  body: types.OrganizationsApiModifyProfileRequest): Future[AsyncResponse] {.async.} =
  ## Partially updates the business profile (name, email, phone, address, and
  ## external metadata)
  ## associated with this account's parent organization customer record, creating the
  ## profile if
  ## it does not exist. Changes apply to every account and organization sharing that
  ## profile.
  ## Omitted, empty, or null fields are left unchanged. Each profile field is limited
  ## to 1,000
  ## UTF-8 bytes. Only available to members of an organization that contains the
  ## account.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/profile", body)
  return res
