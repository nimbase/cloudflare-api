# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc postAccountsAccountIdCloudforceOneRequests*(client: CloudflareClient,
                                                 accountId: types.CloudforceOneRequestsIdentifier,
                                                 body: types.CloudforceOneRequestsRequestList): Future[JsonNode] {.async.} =
  ## Lists Cloudforce One intelligence requests with filtering and pagination.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/requests", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneRequestsConstants*(client: CloudflareClient,
                                                         accountId: types.CloudforceOneRequestsIdentifier): Future[JsonNode] {.async.} =
  ## Retrieves constant values used in Cloudforce One requests, including valid
  ## statuses and types.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/requests/constants")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneRequestsNew*(client: CloudflareClient,
                                                    accountId: types.CloudforceOneRequestsIdentifier,
                                                    body: types.CloudforceOneRequestsRequestEdit): Future[JsonNode] {.async.} =
  ## Creating a request adds the request into the Cloudforce One queue for analysis.
  ## In addition to the content, a short title, type, priority, and releasability
  ## should be provided. If one is not provided, a default will be assigned.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/requests/new", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneRequestsQuota*(client: CloudflareClient,
                                                     accountId: types.CloudforceOneRequestsIdentifier): Future[JsonNode] {.async.} =
  ## Retrieves quota usage for Cloudforce One standard requests.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/requests/quota")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneRequestsTypes*(client: CloudflareClient,
                                                     accountId: types.CloudforceOneRequestsIdentifier): Future[JsonNode] {.async.} =
  ## Lists available request types for Cloudforce One intelligence requests.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/requests/types")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneRequestsRequestId*(client: CloudflareClient,
                                                         accountId: types.CloudforceOneRequestsIdentifier,
                                                         requestId: types.CloudforceOneRequestsUuid): Future[JsonNode] {.async.} =
  ## Retrieves details for a specific Cloudforce One intelligence request.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/requests/{requestId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCloudforceOneRequestsRequestId*(client: CloudflareClient,
                                                         accountId: types.CloudforceOneRequestsIdentifier,
                                                         requestId: types.CloudforceOneRequestsUuid,
                                                         body: types.CloudforceOneRequestsRequestEdit): Future[JsonNode] {.async.} =
  ## Updating a request alters the request in the Cloudforce One queue. This API may
  ## be used to update any attributes of the request after the initial submission.
  ## Only fields that you choose to update need to be add to the request body.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cloudforce-one/requests/{requestId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneRequestsRequestId*(client: CloudflareClient,
                                                            accountId: types.CloudforceOneRequestsIdentifier,
                                                            requestId: types.CloudforceOneRequestsUuid): Future[types.CloudforceOneRequestsApiResponseCommon] {.async.} =
  ## Deletes a Cloudforce One intelligence request and all associated data.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/requests/{requestId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudforceOneRequestsApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneRequestsRequestIdAsset*(client: CloudflareClient,
                                                               accountId: types.CloudforceOneRequestsIdentifier,
                                                               requestId: types.CloudforceOneRequestsUuid,
                                                               body: types.CloudforceOneRequestsRequestAssetList): Future[JsonNode] {.async.} =
  ## Lists assets attached to a Cloudforce One intelligence request.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/requests/{requestId}/asset", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneRequestsRequestIdAssetNew*(client: CloudflareClient,
                                                                  accountId: types.CloudforceOneRequestsIdentifier,
                                                                  requestId: types.CloudforceOneRequestsUuid): Future[JsonNode] {.async.} =
  ## Uploads a new asset to a Cloudforce One intelligence request.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/requests/{requestId}/asset/new")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneRequestsRequestIdAssetAssetId*(client: CloudflareClient,
                                                                     accountId: types.CloudforceOneRequestsIdentifier,
                                                                     requestId: types.CloudforceOneRequestsUuid,
                                                                     assetId: types.CloudforceOneRequestsUuid): Future[JsonNode] {.async.} =
  ## Retrieves an asset attached to a Cloudforce One intelligence request.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/requests/{requestId}/asset/{assetId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCloudforceOneRequestsRequestIdAssetAssetId*(client: CloudflareClient,
                                                                     accountId: types.CloudforceOneRequestsIdentifier,
                                                                     requestId: types.CloudforceOneRequestsUuid,
                                                                     assetId: types.CloudforceOneRequestsUuid,
                                                                     body: types.CloudforceOneRequestsRequestAssetEdit): Future[JsonNode] {.async.} =
  ## Updates an asset in a Cloudforce One intelligence request.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cloudforce-one/requests/{requestId}/asset/{assetId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneRequestsRequestIdAssetAssetId*(client: CloudflareClient,
                                                                        accountId: types.CloudforceOneRequestsIdentifier,
                                                                        requestId: types.CloudforceOneRequestsUuid,
                                                                        assetId: types.CloudforceOneRequestsUuid): Future[types.CloudforceOneRequestsApiResponseCommon] {.async.} =
  ## Removes an asset from a Cloudforce One intelligence request.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/requests/{requestId}/asset/{assetId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudforceOneRequestsApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneRequestsRequestIdMessage*(client: CloudflareClient,
                                                                 accountId: types.CloudforceOneRequestsIdentifier,
                                                                 requestId: types.CloudforceOneRequestsUuid,
                                                                 body: types.CloudforceOneRequestsRequestMessageList): Future[JsonNode] {.async.} =
  ## Lists messages in a Cloudforce One intelligence request conversation.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/requests/{requestId}/message", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneRequestsRequestIdMessageNew*(client: CloudflareClient,
                                                                    accountId: types.CloudforceOneRequestsIdentifier,
                                                                    requestId: types.CloudforceOneRequestsUuid,
                                                                    body: types.CloudforceOneRequestsRequestMessageEdit): Future[JsonNode] {.async.} =
  ## Adds a message to a Cloudforce One intelligence request conversation.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/requests/{requestId}/message/new", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCloudforceOneRequestsRequestIdMessageMessageId*(client: CloudflareClient,
                                                                         accountId: types.CloudforceOneRequestsIdentifier,
                                                                         requestId: types.CloudforceOneRequestsUuid,
                                                                         messageId: int64,
                                                                         body: types.CloudforceOneRequestsRequestMessageEdit): Future[JsonNode] {.async.} =
  ## Updates a message in a Cloudforce One intelligence request thread.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cloudforce-one/requests/{requestId}/message/{messageId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneRequestsRequestIdMessageMessageId*(client: CloudflareClient,
                                                                            accountId: types.CloudforceOneRequestsIdentifier,
                                                                            requestId: types.CloudforceOneRequestsUuid,
                                                                            messageId: int64): Future[types.CloudforceOneRequestsApiResponseCommon] {.async.} =
  ## Removes a message from a Cloudforce One intelligence request thread.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/requests/{requestId}/message/{messageId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudforceOneRequestsApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)
