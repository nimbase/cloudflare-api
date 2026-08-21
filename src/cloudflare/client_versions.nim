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
  GetAccountsAccountIdDevicesClientVersionsResponse* = object
    errors: seq[types.TeamsDevicesV4ResponseMessage]
    messages: seq[types.TeamsDevicesV4ResponseMessage]
    result: seq[types.TeamsDevicesClientVersion]
    result_info: types.TeamsDevicesPaginationInfo
    success: bool
      ## Indicates whether the API call was successful.
  GetAccountsAccountIdDevicesClientVersionsTargetEnvironmentsResponse* = object
    errors: seq[types.TeamsDevicesV4ResponseMessage]
    messages: seq[types.TeamsDevicesV4ResponseMessage]
    result: seq[types.TeamsDevicesTargetEnvironmentInfo]
    success: bool
      ## Indicates whether the API call was successful.
  ClientVersionReleaseTrackOption* = enum
    releaseTrackGa = "ga"
    releaseTrackBeta = "beta"


proc getAccountsAccountIdDevicesClientVersions*(client: CloudflareClient,
                                                accountId: string,
                                                targetEnvironment: string,
                                                releaseTrack: ClientVersionReleaseTrackOption,
                                                page: int64 = 1,
                                                perPage: int64 = 20): Future[GetAccountsAccountIdDevicesClientVersionsResponse] {.async.} =
  ## Lists available WARP client versions for a specific target environment and
  ## release track. This endpoint is in Beta.

  var q = initOrderedTable[string, string]()
  q["target_environment"] = $targetEnvironment
  q["release_track"] = $releaseTrack
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/client-versions", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdDevicesClientVersionsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDevicesClientVersionsTargetEnvironments*(client: CloudflareClient,
                                                                  accountId: string): Future[GetAccountsAccountIdDevicesClientVersionsTargetEnvironmentsResponse] {.async.} =
  ## Retrieves a list of all available target environments with their display names.
  ## This endpoint is in Beta.

  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/client-versions/target-environments")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdDevicesClientVersionsTargetEnvironmentsResponse)
  else:
    raise newException(CloudflareClientError, body)
