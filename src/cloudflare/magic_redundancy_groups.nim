# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdMagicRedundancyGroups*(client: CloudflareClient,
                                                accountId: types.MagicIdentifier): Future[types.MagicRedundancyGroupsCollectionResponse] {.async.} =
  ## Lists redundancy groups associated with an account, including full member tunnel
  ## data.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/redundancy_groups")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicRedundancyGroupsCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicRedundancyGroups*(client: CloudflareClient,
                                                 accountId: types.MagicIdentifier,
                                                 body: types.MagicCreateRedundancyGroupRequest): Future[types.MagicRedundancyGroupSingleResponse] {.async.} =
  ## Creates a new redundancy group, optionally with tunnel members.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/redundancy_groups", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.MagicRedundancyGroupSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicRedundancyGroupsRedundancyGroupId*(client: CloudflareClient,
                                                                 accountId: types.MagicIdentifier,
                                                                 redundancyGroupId: types.MagicIdentifier): Future[types.MagicRedundancyGroupWithMembersResponse] {.async.} =
  ## Gets details for a specific redundancy group, including full member tunnel data.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/redundancy_groups/{redundancyGroupId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicRedundancyGroupWithMembersResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMagicRedundancyGroupsRedundancyGroupId*(client: CloudflareClient,
                                                                 accountId: types.MagicIdentifier,
                                                                 redundancyGroupId: types.MagicIdentifier,
                                                                 body: types.MagicCreateRedundancyGroupRequest): Future[types.MagicRedundancyGroupSingleResponse] {.async.} =
  ## Replaces the name, description, and full set of members for an existing
  ## redundancy group.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/magic/redundancy_groups/{redundancyGroupId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicRedundancyGroupSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicRedundancyGroupsRedundancyGroupId*(client: CloudflareClient,
                                                                    accountId: types.MagicIdentifier,
                                                                    redundancyGroupId: types.MagicIdentifier): Future[types.MagicDeleteRedundancyGroupResponse] {.async.} =
  ## Deletes a redundancy group. Member tunnels are not deleted — their
  ## redundancy_group_id is cleared.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/redundancy_groups/{redundancyGroupId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicDeleteRedundancyGroupResponse)
  else:
    raise newException(CloudflareClientError, body)
