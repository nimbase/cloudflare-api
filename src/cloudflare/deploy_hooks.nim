# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdBuildsWorkersScriptNameDeployHooks*(client: CloudflareClient,
                                                             accountId: types.BuildsAccountId,
                                                             scriptName: types.BuildsScriptName): Future[JsonNode] {.async.} =
  ## List the branch-specific deploy hooks configured for a Worker.

  let res = await client.httpGET(fmt"/accounts/{accountId}/builds/workers/{scriptName}/deploy_hooks")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdBuildsWorkersScriptNameDeployHooks*(client: CloudflareClient,
                                                              accountId: types.BuildsAccountId,
                                                              scriptName: types.BuildsScriptName,
                                                              body: types.BuildsCreateDeployHookRequest): Future[JsonNode] {.async.} =
  ## Create an HTTP hook that starts a build for a selected Worker branch.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/builds/workers/{scriptName}/deploy_hooks", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBuildsWorkersScriptNameDeployHooksDeployHookUuid*(client: CloudflareClient,
                                                                           accountId: types.BuildsAccountId,
                                                                           scriptName: types.BuildsScriptName,
                                                                           deployHookUuid: types.BuildsDeployHookUuid): Future[JsonNode] {.async.} =
  ## Retrieve the name, branch, Worker identifier, and timestamps for a deploy hook.

  let res = await client.httpGET(fmt"/accounts/{accountId}/builds/workers/{scriptName}/deploy_hooks/{deployHookUuid}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdBuildsWorkersScriptNameDeployHooksDeployHookUuid*(client: CloudflareClient,
                                                                           accountId: types.BuildsAccountId,
                                                                           scriptName: types.BuildsScriptName,
                                                                           deployHookUuid: types.BuildsDeployHookUuid,
                                                                           body: types.BuildsCreateDeployHookRequest): Future[JsonNode] {.async.} =
  ## Replace the name and target branch for a deploy hook.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/builds/workers/{scriptName}/deploy_hooks/{deployHookUuid}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdBuildsWorkersScriptNameDeployHooksDeployHookUuid*(client: CloudflareClient,
                                                                              accountId: types.BuildsAccountId,
                                                                              scriptName: types.BuildsScriptName,
                                                                              deployHookUuid: types.BuildsDeployHookUuid): Future[JsonNode] {.async.} =
  ## Delete a deploy hook so its UUID can no longer start builds.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/builds/workers/{scriptName}/deploy_hooks/{deployHookUuid}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postWorkersBuildsDeployHooksDeployHookUuid*(client: CloudflareClient,
                                                 deployHookUuid: types.BuildsDeployHookUuid): Future[JsonNode] {.async.} =
  ## Trigger a build using a deploy hook. This endpoint does not require
  ## authentication - the deploy_hook_uuid acts as a secret token.

  let res = await client.httpPOST(fmt"/workers/builds/deploy_hooks/{deployHookUuid}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
