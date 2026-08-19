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
  GetAccountsAccountIdDevicesIpProfilesResponse* = object
    errors: seq[types.TeamsDevicesV4ResponseMessage]
    messages: seq[types.TeamsDevicesV4ResponseMessage]
    result: seq[types.TeamsDevicesIpProfile]
    result_info: types.TeamsDevicesPaginationInfo
    success: bool
      ## Whether the API call was successful.
  PostAccountsAccountIdDevicesIpProfilesResponse* = object
    errors: seq[types.TeamsDevicesV4ResponseMessage]
    messages: seq[types.TeamsDevicesV4ResponseMessage]
    result: types.TeamsDevicesIpProfile
    success: bool
      ## Whether the API call was successful.
  GetAccountsAccountIdDevicesIpProfilesProfileIdResponse* = object
    errors: seq[types.TeamsDevicesV4ResponseMessage]
    messages: seq[types.TeamsDevicesV4ResponseMessage]
    result: types.TeamsDevicesIpProfile
    success: bool
      ## Whether the API call was successful.
  DeleteAccountsAccountIdDevicesIpProfilesProfileIdResponse* = object
    errors: seq[types.TeamsDevicesV4ResponseMessage]
    messages: seq[types.TeamsDevicesV4ResponseMessage]
    result: JsonNode
    success: bool
      ## Whether the API call was successful.
  PatchAccountsAccountIdDevicesIpProfilesProfileIdResponse* = object
    errors: seq[types.TeamsDevicesV4ResponseMessage]
    messages: seq[types.TeamsDevicesV4ResponseMessage]
    result: types.TeamsDevicesIpProfile
    success: bool
      ## Whether the API call was successful.

proc getAccountsAccountIdDevicesIpProfiles*(client: CloudflareClient,
                                            accountId: string, page: int64 = 1,
                                            perPage: int64 = 50): Future[GetAccountsAccountIdDevicesIpProfilesResponse] {.async.} =
  ## Lists WARP Device IP profiles.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/ip-profiles", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdDevicesIpProfilesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDevicesIpProfiles*(client: CloudflareClient,
                                             accountId: string,
                                             body: types.TeamsDevicesIpProfileCreateRequest): Future[PostAccountsAccountIdDevicesIpProfilesResponse] {.async.} =
  ## Creates a WARP Device IP profile. Currently, only IPv4 Device subnets can be
  ## associated.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/devices/ip-profiles", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdDevicesIpProfilesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDevicesIpProfilesProfileId*(client: CloudflareClient,
                                                     accountId: string,
                                                     profileId: string): Future[GetAccountsAccountIdDevicesIpProfilesProfileIdResponse] {.async.} =
  ## Fetches a single WARP Device IP profile.

  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/ip-profiles/{profileId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdDevicesIpProfilesProfileIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDevicesIpProfilesProfileId*(client: CloudflareClient,
                                                        accountId: string,
                                                        profileId: string): Future[DeleteAccountsAccountIdDevicesIpProfilesProfileIdResponse] {.async.} =
  ## Delete a WARP Device IP profile.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/devices/ip-profiles/{profileId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdDevicesIpProfilesProfileIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdDevicesIpProfilesProfileId*(client: CloudflareClient,
                                                       accountId: string,
                                                       profileId: string,
                                                       body: types.TeamsDevicesIpProfileUpdateRequest): Future[PatchAccountsAccountIdDevicesIpProfilesProfileIdResponse] {.async.} =
  ## Updates a WARP Device IP profile. Currently, only IPv4 Device subnets can be
  ## associated.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/devices/ip-profiles/{profileId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdDevicesIpProfilesProfileIdResponse)
  else:
    raise newException(CloudflareClientError, body)
