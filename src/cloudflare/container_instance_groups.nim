# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdContainersInstanceGroups*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Lists active namespace-backed Container Instance Groups owned by the account.

  let res = await client.httpGET("/accounts/{account_id}/containers/instance-groups")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdContainersInstanceGroupsNamespaceId*(client: CloudflareClient,
                                                              namespaceId: types.CcContainerInstanceGroupNamespaceID): Future[JsonNode] {.async.} =
  ## Returns the active Container Instance Group configured for a Durable Object
  ## namespace.

  let res = await client.httpGET(fmt"/accounts/{account_id}/containers/instance-groups/{namespaceId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdContainersInstanceGroupsNamespaceId*(client: CloudflareClient,
                                                              namespaceId: types.CcContainerInstanceGroupNamespaceID,
                                                              body: types.CcPutContainerInstanceGroupRequestBody): Future[JsonNode] {.async.} =
  ## Creates or replaces the mutable policy for one Container-enabled Durable Object
  ## namespace.

  let res = await client.httpPUT(fmt"/accounts/{account_id}/containers/instance-groups/{namespaceId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdContainersInstanceGroupsNamespaceId*(client: CloudflareClient,
                                                                 namespaceId: types.CcContainerInstanceGroupNamespaceID): Future[JsonNode] {.async.} =
  ## Delete namespace configuration and remove its runtime metadata projection.

  let res = await client.httpDELETE(fmt"/accounts/{account_id}/containers/instance-groups/{namespaceId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
