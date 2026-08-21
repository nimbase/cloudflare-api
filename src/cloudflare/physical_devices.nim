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
  GetAccountsAccountIdDevicesPhysicalDevicesResponse* = object
    errors: seq[types.TeamsDevicesV4ResponseMessage]
    messages: seq[types.TeamsDevicesV4ResponseMessage]
    result: seq[types.TeamsDevicesPhysicalDevice]
    result_info: types.TeamsDevicesCursorResultInfo
    success: bool
      ## Whether the API call was successful.
  GetAccountsAccountIdDevicesPhysicalDevicesDeviceIdResponse* = object
    errors: seq[types.TeamsDevicesV4ResponseMessage]
    messages: seq[types.TeamsDevicesV4ResponseMessage]
    result: types.TeamsDevicesPhysicalDevice
    success: bool
      ## Whether the API call was successful.
  DeleteAccountsAccountIdDevicesPhysicalDevicesDeviceIdResponse* = object
    errors: seq[types.TeamsDevicesV4ResponseMessage]
    messages: seq[types.TeamsDevicesV4ResponseMessage]
    result: types.TeamsDevicesEmptyBody
    success: bool
      ## Whether the API call was successful.
  PostAccountsAccountIdDevicesPhysicalDevicesDeviceIdRevokeResponse* = object
    errors: seq[types.TeamsDevicesV4ResponseMessage]
    messages: seq[types.TeamsDevicesV4ResponseMessage]
    result: types.TeamsDevicesEmptyBody
    success: bool
      ## Whether the API call was successful.
  DeleteAccountsAccountIdDevicesRegistrationsResponse* = object
    errors: seq[types.TeamsDevicesV4ResponseMessage]
    messages: seq[types.TeamsDevicesV4ResponseMessage]
    result: types.TeamsDevicesEmptyBody
    result_info: types.TeamsDevicesCursorResultInfo
    success: bool
      ## Whether the API call was successful.
  PhysicalDeviceSortByOption* = enum
    sortByName = "name"
    sortById = "id"
    sortByClientVersion = "client_version"
    sortByLastSeenUserEmail = "last_seen_user.email"
    sortByLastSeenAt = "last_seen_at"
    sortByActiveRegistrations = "active_registrations"
    sortByCreatedAt = "created_at"

  PhysicalDeviceSortOrderOption* = enum
    sortOrderAsc = "asc"
    sortOrderDesc = "desc"

  PhysicalDeviceActiveRegistrationsOption* = enum
    activeRegistrationsInclude = "include"
    activeRegistrationsOnly = "only"
    activeRegistrationsExclude = "exclude"


proc getAccountsAccountIdDevicesPhysicalDevices*(client: CloudflareClient,
                                                 accountId: string,
                                                 cursor: string = default(string),
                                                 sortBy: PhysicalDeviceSortByOption,
                                                 sortOrder: PhysicalDeviceSortOrderOption,
                                                 lastSeenUserEmail: string = default(string),
                                                 seenAfter: string = default(string),
                                                 seenBefore: string = default(string),
                                                 perPage: int64 = default(int64),
                                                 search: string = default(string),
                                                 activeRegistrations: PhysicalDeviceActiveRegistrationsOption,
                                                 id: seq[string] = @[],
                                                 lastSeenRegistrationPolicyId: string = default(string),
                                                 `include`: string = default(string)): Future[GetAccountsAccountIdDevicesPhysicalDevicesResponse] {.async.} =
  ## Lists WARP devices.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["sort_by"] = $sortBy
  q["sort_order"] = $sortOrder
  q["last_seen_user.email"] = $lastSeenUserEmail
  q["seen_after"] = $seenAfter
  q["seen_before"] = $seenBefore
  q["per_page"] = $perPage
  q["search"] = $search
  q["active_registrations"] = $activeRegistrations
  for v in id: q["id"] = $v
  q["last_seen_registration.policy.id"] = $lastSeenRegistrationPolicyId
  q["include"] = $`include`
  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/physical-devices", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdDevicesPhysicalDevicesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDevicesPhysicalDevicesDeviceId*(client: CloudflareClient,
                                                         deviceId: string,
                                                         accountId: string,
                                                         `include`: string = default(string)): Future[GetAccountsAccountIdDevicesPhysicalDevicesDeviceIdResponse] {.async.} =
  ## Fetches a single WARP device.

  var q = initOrderedTable[string, string]()
  q["include"] = $`include`
  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/physical-devices/{deviceId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdDevicesPhysicalDevicesDeviceIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDevicesPhysicalDevicesDeviceId*(client: CloudflareClient,
                                                            deviceId: string,
                                                            accountId: string): Future[DeleteAccountsAccountIdDevicesPhysicalDevicesDeviceIdResponse] {.async.} =
  ## Deletes a WARP device.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/devices/physical-devices/{deviceId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdDevicesPhysicalDevicesDeviceIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDevicesPhysicalDevicesDeviceIdRevoke*(client: CloudflareClient,
                                                                accountId: string,
                                                                deviceId: string): Future[PostAccountsAccountIdDevicesPhysicalDevicesDeviceIdRevokeResponse] {.async.} =
  ## Revokes all WARP registrations associated with the specified device.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/devices/physical-devices/{deviceId}/revoke")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdDevicesPhysicalDevicesDeviceIdRevokeResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDevicesRegistrations*(client: CloudflareClient,
                                                  accountId: string,
                                                  id: seq[string] = @[]): Future[DeleteAccountsAccountIdDevicesRegistrationsResponse] {.async.} =
  ## Deletes a list of WARP registrations.

  var q = initOrderedTable[string, string]()
  for v in id: q["id"] = $v
  let res = await client.httpDELETE(fmt"/accounts/{accountId}/devices/registrations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdDevicesRegistrationsResponse)
  else:
    raise newException(CloudflareClientError, body)
