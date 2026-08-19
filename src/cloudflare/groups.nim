# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  PostAccountsAccountIdCloudforceOneEventsDatasetGroupsRequest = object
    description: string
    name: string
  PostAccountsAccountIdCloudforceOneEventsDatasetGroupsResponse* = object
    created_at: string
    description: string
    name: string
    updated_at: string
    uuid: string
  GetAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdResponse* = object
    created_at: string
    description: string
    members: seq[JsonNode]
    name: string
    updated_at: string
    uuid: string
  PutAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdRequest = object
    description: string
    name: string
  PutAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdResponse* = object
    created_at: string
    description: string
    name: string
    updated_at: string
    uuid: string
  DeleteAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdResponse* = object
    message: string
    success: bool
  PostAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdMembersRequest = object
    account_id: Option[string]
    account_tag: Option[string]
  PostAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdMembersResponse* = object
    account_id: string
    account_tag: string
    created_at: string
    updated_at: string
    uuid: string
  DeleteAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdMembersMemberIdResponse* = object
    message: string
    success: bool

proc getAccountsAccountIdCloudforceOneEventsDatasetGroups*(client: CloudflareClient,
                                                           accountId: string): Future[seq[JsonNode]] {.async.} =
  ## List groups for an account

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/-/groups")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[JsonNode])
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsDatasetGroups*(client: CloudflareClient,
                                                            accountId: string,
                                                            body: PostAccountsAccountIdCloudforceOneEventsDatasetGroupsRequest): Future[PostAccountsAccountIdCloudforceOneEventsDatasetGroupsResponse] {.async.} =
  ## Create a group

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/-/groups", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsDatasetGroupsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupId*(client: CloudflareClient,
                                                                  accountId: string,
                                                                  groupId: string): Future[GetAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdResponse] {.async.} =
  ## Read a group for an account

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/-/groups/{groupId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupId*(client: CloudflareClient,
                                                                  accountId: string,
                                                                  groupId: string,
                                                                  body: PutAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdRequest): Future[PutAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdResponse] {.async.} =
  ## Update a group

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/-/groups/{groupId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupId*(client: CloudflareClient,
                                                                     accountId: string,
                                                                     groupId: string): Future[DeleteAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdResponse] {.async.} =
  ## Delete a group for an account

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/-/groups/{groupId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdMembers*(client: CloudflareClient,
                                                                         accountId: string,
                                                                         groupId: string): Future[seq[JsonNode]] {.async.} =
  ## List group members

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/-/groups/{groupId}/members")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[JsonNode])
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdMembers*(client: CloudflareClient,
                                                                          accountId: string,
                                                                          groupId: string,
                                                                          body: PostAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdMembersRequest): Future[PostAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdMembersResponse] {.async.} =
  ## Create a group member

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/-/groups/{groupId}/members", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdMembersResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdMembersMemberId*(client: CloudflareClient,
                                                                                    accountId: string,
                                                                                    groupId: string,
                                                                                    memberId: string): Future[DeleteAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdMembersMemberIdResponse] {.async.} =
  ## Delete a group member

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/-/groups/{groupId}/members/{memberId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneEventsDatasetGroupsGroupIdMembersMemberIdResponse)
  else:
    raise newException(CloudflareClientError, body)
