# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissionsRequest = object
    role: string
    subject_id: string
    subject_type: string
  PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissionsResponse* = object
    created_at: string
    resource_id: string
      ## The resource ID this permission applies to account_id or group_id
    resource_type: string
    role: string
    subject_id: string
    subject_type: string
    updated_at: string
    uuid: string
  PutAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissionsGrantIdRequest = object
    role: string
  PutAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissionsGrantIdResponse* = object
    message: string
    success: bool
  DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissionsGrantIdResponse* = object
    message: string
    success: bool

proc getAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissions*(client: CloudflareClient,
                                                                         accountId: string,
                                                                         datasetId: string): Future[seq[JsonNode]] {.async.} =
  ## List permissions

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}/permissions")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[JsonNode])
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissions*(client: CloudflareClient,
                                                                          accountId: string,
                                                                          datasetId: string,
                                                                          body: PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissionsRequest): Future[PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissionsResponse] {.async.} =
  ## Create a permission

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}/permissions", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissionsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissionsGrantId*(client: CloudflareClient,
                                                                                accountId: string,
                                                                                datasetId: string,
                                                                                grantId: string,
                                                                                body: PutAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissionsGrantIdRequest): Future[PutAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissionsGrantIdResponse] {.async.} =
  ## Update a permission

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}/permissions/{grantId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissionsGrantIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissionsGrantId*(client: CloudflareClient,
                                                                                   accountId: string,
                                                                                   datasetId: string,
                                                                                   grantId: string): Future[DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissionsGrantIdResponse] {.async.} =
  ## Delete a permission

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}/permissions/{grantId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneEventsDatasetDatasetIdPermissionsGrantIdResponse)
  else:
    raise newException(CloudflareClientError, body)
