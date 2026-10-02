# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options]
import ./private/metaclient
import ./private/types

type
  PostZonesZoneIdAccessGroupsRequest = object
    exclude: Option[types.AccessExclude]
    `include`: types.AccessInclude
    name: types.AccessName16
    require: Option[types.AccessRequire]
  PutZonesZoneIdAccessGroupsGroupIdRequest = object
    exclude: Option[types.AccessExclude]
    `include`: types.AccessInclude
    name: types.AccessName16
    require: Option[types.AccessRequire]

proc getZonesZoneIdAccessGroups*(client: CloudflareClient,
                                 zoneId: types.AccessIdentifier): Future[types.AccessResponseCollection19] {.async.} =
  ## Lists all Access groups.

  let res = await client.httpGET(fmt"/zones/{zoneId}/access/groups")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection19)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdAccessGroups*(client: CloudflareClient,
                                  zoneId: types.AccessIdentifier,
                                  body: PostZonesZoneIdAccessGroupsRequest): Future[types.AccessSingleResponse18] {.async.} =
  ## Creates a new Access group.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/access/groups", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AccessSingleResponse18)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdAccessGroupsGroupId*(client: CloudflareClient,
                                        groupId: types.AccessUuid,
                                        zoneId: types.AccessIdentifier): Future[types.AccessSingleResponse18] {.async.} =
  ## Fetches a single Access group.

  let res = await client.httpGET(fmt"/zones/{zoneId}/access/groups/{groupId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse18)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdAccessGroupsGroupId*(client: CloudflareClient,
                                        groupId: types.AccessUuid,
                                        zoneId: types.AccessIdentifier,
                                        body: PutZonesZoneIdAccessGroupsGroupIdRequest): Future[types.AccessSingleResponse18] {.async.} =
  ## Updates a configured Access group.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/access/groups/{groupId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse18)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdAccessGroupsGroupId*(client: CloudflareClient,
                                           groupId: types.AccessUuid,
                                           zoneId: types.AccessIdentifier): Future[types.AccessIdResponse] {.async.} =
  ## Deletes an Access group.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/access/groups/{groupId}")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.AccessIdResponse)
  else:
    raise newException(CloudflareClientError, body)
