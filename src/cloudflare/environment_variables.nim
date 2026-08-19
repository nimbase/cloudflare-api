# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdBuildsTriggersTriggerUuidEnvironmentVariables*(client: CloudflareClient,
                                                                        accountId: types.BuildsAccountId,
                                                                        triggerUuid: types.BuildsTriggerUuid): Future[JsonNode] {.async.} =
  ## Get all environment variables for a trigger

  let res = await client.httpGET(fmt"/accounts/{accountId}/builds/triggers/{triggerUuid}/environment_variables")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdBuildsTriggersTriggerUuidEnvironmentVariables*(client: CloudflareClient,
                                                                          accountId: types.BuildsAccountId,
                                                                          triggerUuid: types.BuildsTriggerUuid,
                                                                          body: types.BuildsEnvironmentVariablesRequest): Future[JsonNode] {.async.} =
  ## Create or update environment variables for a trigger

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/builds/triggers/{triggerUuid}/environment_variables", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdBuildsTriggersTriggerUuidEnvironmentVariablesEnvironmentVariableKey*(client: CloudflareClient,
                                                                                                 accountId: types.BuildsAccountId,
                                                                                                 triggerUuid: types.BuildsTriggerUuid,
                                                                                                 environmentVariableKey: types.BuildsEnvironmentVariableKey): Future[types.BuildsAPIResponse] {.async.} =
  ## Remove a specific environment variable from a trigger

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/builds/triggers/{triggerUuid}/environment_variables/{environmentVariableKey}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BuildsAPIResponse)
  else:
    raise newException(CloudflareClientError, body)
