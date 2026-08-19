# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdIamResourceGroups*(client: CloudflareClient,
                                            accountId: types.IamAccountIdentifier,
                                            id: JsonNode = default(JsonNode),
                                            name: string = default(string)): Future[JsonNode] {.async.} =
  ## List all the resource groups for an account.

  var q = initOrderedTable[string, string]()
  q["id"] = $id
  q["name"] = $name
  let res = await client.httpGET(fmt"/accounts/{accountId}/iam/resource_groups", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdIamResourceGroups*(client: CloudflareClient,
                                             accountId: types.IamAccountIdentifier,
                                             body: types.IamRequestCreateResourceGroup): Future[JsonNode] {.async.} =
  ## Create a new Resource Group under the specified account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/iam/resource_groups", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdIamResourceGroupsResourceGroupId*(client: CloudflareClient,
                                                           accountId: types.IamAccountIdentifier,
                                                           resourceGroupId: types.IamResourceGroupIdentifier): Future[JsonNode] {.async.} =
  ## Get information about a specific resource group in an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/iam/resource_groups/{resourceGroupId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdIamResourceGroupsResourceGroupId*(client: CloudflareClient,
                                                           accountId: types.IamAccountIdentifier,
                                                           resourceGroupId: types.IamResourceGroupIdentifier,
                                                           body: types.IamRequestUpdateResourceGroup): Future[JsonNode] {.async.} =
  ## Modify an existing resource group.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/iam/resource_groups/{resourceGroupId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdIamResourceGroupsResourceGroupId*(client: CloudflareClient,
                                                              accountId: types.IamAccountIdentifier,
                                                              resourceGroupId: types.IamResourceGroupIdentifier): Future[types.IamApiResponseSingleId] {.async.} =
  ## Remove a resource group from an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/iam/resource_groups/{resourceGroupId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamApiResponseSingleId)
  else:
    raise newException(CloudflareClientError, body)
