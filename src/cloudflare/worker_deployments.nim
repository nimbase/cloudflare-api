# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdWorkersScriptsScriptNameDeployments*(client: CloudflareClient,
                                                              accountId: types.WorkersIdentifier,
                                                              scriptName: types.WorkersScriptName): Future[JsonNode] {.async.} =
  ## List of Worker Deployments. The first deployment in the list is the latest
  ## deployment actively serving traffic.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/deployments")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdWorkersScriptsScriptNameDeployments*(client: CloudflareClient,
                                                               accountId: types.WorkersIdentifier,
                                                               scriptName: types.WorkersScriptName,
                                                               force: bool = default(bool),
                                                               body: types.WorkersDeployment): Future[JsonNode] {.async.} =
  ## Deployments configure how [WorkerVersions](https://developers.cloudflare.com/ap
  ## i/operations/worker-versions-list-versions) are deployed to traffic. A
  ## deployment can consist of one or two versions of a Worker.

  var q = initOrderedTable[string, string]()
  q["force"] = $force
  let res = await client.httpPOST(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/deployments", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersScriptsScriptNameDeploymentsDeploymentId*(client: CloudflareClient,
                                                                          accountId: types.WorkersIdentifier,
                                                                          scriptName: types.WorkersScriptName,
                                                                          deploymentId: string): Future[JsonNode] {.async.} =
  ## Get information about a Worker Deployment.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/deployments/{deploymentId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdWorkersScriptsScriptNameDeploymentsDeploymentId*(client: CloudflareClient,
                                                                             accountId: types.WorkersIdentifier,
                                                                             scriptName: types.WorkersScriptName,
                                                                             deploymentId: string): Future[types.WorkersApiResponseCommon] {.async.} =
  ## Delete a Worker Deployment. The latest deployment, which is actively serving
  ## traffic, cannot be deleted. All other deployments can be deleted.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/deployments/{deploymentId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)
