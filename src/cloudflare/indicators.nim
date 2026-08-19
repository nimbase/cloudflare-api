# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options]
import ./private/metaclient

type
  PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorTypesCreateRequest = object
    description: Option[string]
    indicator_type: string
  PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorTypesCreateResponse* = object
    durable_object_id: string
    indicator_type: string
    message: string

proc postAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorTypesCreate*(client: CloudflareClient,
                                                                                   accountId: string,
                                                                                   datasetId: string,
                                                                                   body: PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorTypesCreateRequest): Future[PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorTypesCreateResponse] {.async.} =
  ## Creates a new indicator type and initializes its dedicated Durable Object

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}/indicatorTypes/create", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsDatasetDatasetIdIndicatorTypesCreateResponse)
  else:
    raise newException(CloudflareClientError, body)
