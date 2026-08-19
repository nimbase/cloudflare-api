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
  GetAccountsAccountIdDevicesDeploymentGroupsResponse* = object
    errors: seq[types.TeamsDevicesV4ResponseMessage]
    messages: seq[types.TeamsDevicesV4ResponseMessage]
    result: seq[types.TeamsDevicesDeploymentGroup]
    result_info: types.TeamsDevicesPaginationInfo
    success: bool
      ## Indicates whether the API call was successful.
  PostAccountsAccountIdDevicesDeploymentGroupsResponse* = object
    errors: seq[types.TeamsDevicesV4ResponseMessage]
    messages: seq[types.TeamsDevicesV4ResponseMessage]
    result: types.TeamsDevicesDeploymentGroup
    success: bool
      ## Indicates whether the API call was successful.
  GetAccountsAccountIdDevicesDeploymentGroupsGroupIdResponse* = object
    errors: seq[types.TeamsDevicesV4ResponseMessage]
    messages: seq[types.TeamsDevicesV4ResponseMessage]
    result: types.TeamsDevicesDeploymentGroup
    success: bool
      ## Indicates whether the API call was successful.
  DeleteAccountsAccountIdDevicesDeploymentGroupsGroupIdResponse* = object
    errors: seq[types.TeamsDevicesV4ResponseMessage]
    messages: seq[types.TeamsDevicesV4ResponseMessage]
    result: JsonNode
    success: bool
      ## Indicates whether the API call was successful.
  PatchAccountsAccountIdDevicesDeploymentGroupsGroupIdResponse* = object
    errors: seq[types.TeamsDevicesV4ResponseMessage]
    messages: seq[types.TeamsDevicesV4ResponseMessage]
    result: types.TeamsDevicesDeploymentGroup
    success: bool
      ## Indicates whether the API call was successful.

proc getAccountsAccountIdDevicesDeploymentGroups*(client: CloudflareClient,
                                                  accountId: string,
                                                  page: int64 = 1,
                                                  perPage: int64 = 50): Future[GetAccountsAccountIdDevicesDeploymentGroupsResponse] {.async.} =
  ## Lists all deployment groups for an account. Use deployment groups to assign
  ## target WARP client versions to specific devices. This endpoint is in Beta.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/deployment-groups", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdDevicesDeploymentGroupsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDevicesDeploymentGroups*(client: CloudflareClient,
                                                   accountId: string,
                                                   body: types.TeamsDevicesDeploymentGroupCreateRequest): Future[PostAccountsAccountIdDevicesDeploymentGroupsResponse] {.async.} =
  ## Creates a new deployment group. Policy IDs must be unique across all deployment
  ## groups. This endpoint is in Beta.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/devices/deployment-groups", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdDevicesDeploymentGroupsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDevicesDeploymentGroupsGroupId*(client: CloudflareClient,
                                                         accountId: string,
                                                         groupId: string): Future[GetAccountsAccountIdDevicesDeploymentGroupsGroupIdResponse] {.async.} =
  ## Fetches a single deployment group by its ID. This endpoint is in Beta.

  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/deployment-groups/{groupId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdDevicesDeploymentGroupsGroupIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDevicesDeploymentGroupsGroupId*(client: CloudflareClient,
                                                            accountId: string,
                                                            groupId: string): Future[DeleteAccountsAccountIdDevicesDeploymentGroupsGroupIdResponse] {.async.} =
  ## Deletes a deployment group. Associated policies no longer apply and devices stop
  ## receiving version targets. This endpoint is in Beta.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/devices/deployment-groups/{groupId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdDevicesDeploymentGroupsGroupIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdDevicesDeploymentGroupsGroupId*(client: CloudflareClient,
                                                           accountId: string,
                                                           groupId: string,
                                                           body: types.TeamsDevicesDeploymentGroupUpdateRequest): Future[PatchAccountsAccountIdDevicesDeploymentGroupsGroupIdResponse] {.async.} =
  ## Updates a deployment group. Returns 409 if any newly added policy IDs already
  ## belong to another deployment group. This endpoint is in Beta.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/devices/deployment-groups/{groupId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdDevicesDeploymentGroupsGroupIdResponse)
  else:
    raise newException(CloudflareClientError, body)
