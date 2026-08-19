# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc postAccountsAccountIdCloudforceOneRequestsPriority*(client: CloudflareClient,
                                                         accountId: types.CloudforceOneRequestsIdentifier,
                                                         body: types.CloudforceOneRequestsPriorityList): Future[JsonNode] {.async.} =
  ## Lists priority intelligence requests in Cloudforce One.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/requests/priority", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneRequestsPriorityNew*(client: CloudflareClient,
                                                            accountId: types.CloudforceOneRequestsIdentifier,
                                                            body: types.CloudforceOneRequestsPriorityEdit): Future[JsonNode] {.async.} =
  ## Creates a new priority intelligence request in Cloudforce One.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/requests/priority/new", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneRequestsPriorityQuota*(client: CloudflareClient,
                                                             accountId: types.CloudforceOneRequestsIdentifier): Future[JsonNode] {.async.} =
  ## Retrieves quota usage for Cloudforce One priority requests.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/requests/priority/quota")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneRequestsPriorityPriorityId*(client: CloudflareClient,
                                                                  accountId: types.CloudforceOneRequestsIdentifier,
                                                                  priorityId: types.CloudforceOneRequestsUuid): Future[JsonNode] {.async.} =
  ## Retrieves a specific priority intelligence request from Cloudforce One.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/requests/priority/{priorityId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCloudforceOneRequestsPriorityPriorityId*(client: CloudflareClient,
                                                                  accountId: types.CloudforceOneRequestsIdentifier,
                                                                  priorityId: types.CloudforceOneRequestsUuid,
                                                                  body: types.CloudforceOneRequestsPriorityEdit): Future[JsonNode] {.async.} =
  ## Updates a priority intelligence request in Cloudforce One.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cloudforce-one/requests/priority/{priorityId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneRequestsPriorityPriorityId*(client: CloudflareClient,
                                                                     accountId: types.CloudforceOneRequestsIdentifier,
                                                                     priorityId: types.CloudforceOneRequestsUuid): Future[types.CloudforceOneRequestsApiResponseCommon] {.async.} =
  ## Deletes a priority intelligence request from Cloudforce One.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/requests/priority/{priorityId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudforceOneRequestsApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)
