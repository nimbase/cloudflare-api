# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types

type
  CwsDeploymentOrderOption* = enum
    orderName = "name"
    orderCreatedAt = "created_at"
    orderUpdatedAt = "updated_at"

  CwsDeploymentDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdCwsDeployments*(client: CloudflareClient,
                                         accountId: string,
                                         cursor: string = default(string),
                                         perPage: int64 = 20,
                                         order: CwsDeploymentOrderOption = orderCreatedAt,
                                         direction: CwsDeploymentDirectionOption = directionAsc,
                                         name: string = default(string)): Future[types.CwsPageResponseDeployment] {.async.} =
  ## Returns a paginated list of deployments in the account.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  q["name"] = $name
  let res = await client.httpGET(fmt"/accounts/{accountId}/cws/deployments", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsPageResponseDeployment)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCwsDeployments*(client: CloudflareClient,
                                          accountId: string,
                                          body: types.CwsCreateDeploymentInputBody): Future[types.CwsResponseDeployment] {.async.} =
  ## Creates a deployment with the specified policy sets, domain ACL, and basic-auth
  ## credentials.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cws/deployments", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.CwsResponseDeployment)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCwsDeploymentsDeploymentId*(client: CloudflareClient,
                                                     accountId: string,
                                                     deploymentId: string): Future[types.CwsResponseDeployment] {.async.} =
  ## Returns the deployment with the specified ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cws/deployments/{deploymentId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseDeployment)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCwsDeploymentsDeploymentId*(client: CloudflareClient,
                                                     accountId: string,
                                                     deploymentId: string,
                                                     body: types.CwsUpdateDeploymentInputBody): Future[types.CwsResponseDeployment] {.async.} =
  ## Replaces the deployment's mutable configuration and resource attachments.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cws/deployments/{deploymentId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseDeployment)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCwsDeploymentsDeploymentId*(client: CloudflareClient,
                                                        accountId: string,
                                                        deploymentId: string): Future[types.CwsResponseDeletedResult] {.async.} =
  ## Deletes the deployment and detaches its associated resources. The resources are
  ## not deleted.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cws/deployments/{deploymentId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseDeletedResult)
  else:
    raise newException(CloudflareClientError, body)
