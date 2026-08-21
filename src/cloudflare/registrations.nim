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
  GetAccountsAccountIdDevicesRegistrationsResponse* = object
    errors: seq[types.TeamsDevicesV4ResponseMessage]
    messages: seq[types.TeamsDevicesV4ResponseMessage]
    result: seq[types.TeamsDevicesRegistration]
    result_info: types.TeamsDevicesCursorResultInfo
    success: bool
      ## Whether the API call was successful.
  PostAccountsAccountIdDevicesRegistrationsRevokeResponse* = object
    errors: seq[types.TeamsDevicesV4ResponseMessage]
    messages: seq[types.TeamsDevicesV4ResponseMessage]
    result: types.TeamsDevicesEmptyBody
    result_info: types.TeamsDevicesCursorResultInfo
    success: bool
      ## Whether the API call was successful.
  PostAccountsAccountIdDevicesRegistrationsUnrevokeResponse* = object
    errors: seq[types.TeamsDevicesV4ResponseMessage]
    messages: seq[types.TeamsDevicesV4ResponseMessage]
    result: types.TeamsDevicesEmptyBody
    result_info: types.TeamsDevicesCursorResultInfo
    success: bool
      ## Whether the API call was successful.
  GetAccountsAccountIdDevicesRegistrationsRegistrationIdResponse* = object
    errors: seq[types.TeamsDevicesV4ResponseMessage]
    messages: seq[types.TeamsDevicesV4ResponseMessage]
    result: types.TeamsDevicesRegistration
    success: bool
      ## Whether the API call was successful.
  DeleteAccountsAccountIdDevicesRegistrationsRegistrationIdResponse* = object
    errors: seq[types.TeamsDevicesV4ResponseMessage]
    messages: seq[types.TeamsDevicesV4ResponseMessage]
    result: types.TeamsDevicesEmptyBody
    success: bool
      ## Whether the API call was successful.
  RegistrationStatusOption* = enum
    statusActive = "active"
    statusAll = "all"
    statusRevoked = "revoked"

  RegistrationSortByOption* = enum
    sortById = "id"
    sortByUserName = "user.name"
    sortByUserEmail = "user.email"
    sortByLastSeenAt = "last_seen_at"
    sortByCreatedAt = "created_at"

  RegistrationSortOrderOption* = enum
    sortOrderAsc = "asc"
    sortOrderDesc = "desc"


proc getAccountsAccountIdDevicesRegistrations*(client: CloudflareClient,
                                               accountId: string,
                                               userId: seq[string] = @[],
                                               seenAfter: string = default(string),
                                               seenBefore: string = default(string),
                                               status: RegistrationStatusOption,
                                               perPage: int64 = default(int64),
                                               search: string = default(string),
                                               sortBy: RegistrationSortByOption,
                                               sortOrder: RegistrationSortOrderOption,
                                               cursor: string = default(string),
                                               id: seq[string] = @[],
                                               deviceId: string = default(string),
                                               policyId: string = default(string),
                                               `include`: string = default(string)): Future[GetAccountsAccountIdDevicesRegistrationsResponse] {.async.} =
  ## Lists WARP registrations.

  var q = initOrderedTable[string, string]()
  for v in userId: q["user.id"] = $v
  q["seen_after"] = $seenAfter
  q["seen_before"] = $seenBefore
  q["status"] = $status
  q["per_page"] = $perPage
  q["search"] = $search
  q["sort_by"] = $sortBy
  q["sort_order"] = $sortOrder
  q["cursor"] = $cursor
  for v in id: q["id"] = $v
  q["device.id"] = $deviceId
  q["policy.id"] = $policyId
  q["include"] = $`include`
  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/registrations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdDevicesRegistrationsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDevicesRegistrationsRevoke*(client: CloudflareClient,
                                                      accountId: string,
                                                      id: seq[string] = @[]): Future[PostAccountsAccountIdDevicesRegistrationsRevokeResponse] {.async.} =
  ## Revokes a list of WARP registrations.

  var q = initOrderedTable[string, string]()
  for v in id: q["id"] = $v
  let res = await client.httpPOST(fmt"/accounts/{accountId}/devices/registrations/revoke", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdDevicesRegistrationsRevokeResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDevicesRegistrationsUnrevoke*(client: CloudflareClient,
                                                        accountId: string,
                                                        id: seq[string] = @[]): Future[PostAccountsAccountIdDevicesRegistrationsUnrevokeResponse] {.async.} =
  ## Unrevokes a list of WARP registrations.

  var q = initOrderedTable[string, string]()
  for v in id: q["id"] = $v
  let res = await client.httpPOST(fmt"/accounts/{accountId}/devices/registrations/unrevoke", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdDevicesRegistrationsUnrevokeResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDevicesRegistrationsRegistrationId*(client: CloudflareClient,
                                                             registrationId: string,
                                                             accountId: string,
                                                             `include`: string = default(string)): Future[GetAccountsAccountIdDevicesRegistrationsRegistrationIdResponse] {.async.} =
  ## Fetches a single WARP registration.

  var q = initOrderedTable[string, string]()
  q["include"] = $`include`
  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/registrations/{registrationId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdDevicesRegistrationsRegistrationIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDevicesRegistrationsRegistrationId*(client: CloudflareClient,
                                                                registrationId: string,
                                                                accountId: string): Future[DeleteAccountsAccountIdDevicesRegistrationsRegistrationIdResponse] {.async.} =
  ## Deletes a WARP registration.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/devices/registrations/{registrationId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdDevicesRegistrationsRegistrationIdResponse)
  else:
    raise newException(CloudflareClientError, body)
