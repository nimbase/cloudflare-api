# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdContainersApplicationsApplicationIdInstances*(client: CloudflareClient,
                                                                       applicationId: types.CcApplicationID,
                                                                       perPage: int64 = default(int64),
                                                                       pageToken: string = default(string)): Future[JsonNode] {.async.} =
  ## Lists container instances belonging to an application.

  var q = initOrderedTable[string, string]()
  q["per_page"] = $perPage
  q["page_token"] = $pageToken
  let res = await client.httpGET(fmt"/accounts/{account_id}/containers/applications/{applicationId}/instances", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdContainersApplicationsApplicationIdInstancesInstanceId*(client: CloudflareClient,
                                                                                 applicationId: types.CcApplicationID,
                                                                                 instanceId: types.CcContainersContainerInstanceID): Future[JsonNode] {.async.} =
  ## Returns a container instance belonging to an application.

  let res = await client.httpGET(fmt"/accounts/{account_id}/containers/applications/{applicationId}/instances/{instanceId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
