# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc postAccountsAccountIdBuildsTriggers*(client: CloudflareClient,
                                          accountId: types.BuildsAccountId,
                                          body: types.BuildsCreateTriggerRequest): Future[JsonNode] {.async.} =
  ## Create a new CI/CD trigger

  let res = await client.httpPOST(fmt"/accounts/{accountId}/builds/triggers", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdBuildsTriggersTriggerUuid*(client: CloudflareClient,
                                                       accountId: types.BuildsAccountId,
                                                       triggerUuid: types.BuildsTriggerUuid): Future[types.BuildsAPIResponse] {.async.} =
  ## Remove a CI/CD trigger

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/builds/triggers/{triggerUuid}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BuildsAPIResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdBuildsTriggersTriggerUuid*(client: CloudflareClient,
                                                      accountId: types.BuildsAccountId,
                                                      triggerUuid: types.BuildsTriggerUuid,
                                                      body: types.BuildsUpdateTriggerRequest): Future[JsonNode] {.async.} =
  ## Update an existing CI/CD trigger

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/builds/triggers/{triggerUuid}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdBuildsTriggersTriggerUuidBuilds*(client: CloudflareClient,
                                                           accountId: types.BuildsAccountId,
                                                           triggerUuid: types.BuildsTriggerUuid,
                                                           body: types.BuildsCreateBuildRequest): Future[JsonNode] {.async.} =
  ## Trigger a manual build for a specific trigger

  let res = await client.httpPOST(fmt"/accounts/{accountId}/builds/triggers/{triggerUuid}/builds", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdBuildsTriggersTriggerUuidPurgeBuildCache*(client: CloudflareClient,
                                                                    accountId: types.BuildsAccountId,
                                                                    triggerUuid: types.BuildsTriggerUuid): Future[types.BuildsAPIResponse] {.async.} =
  ## Clear the build cache for a specific trigger

  let res = await client.httpPOST(fmt"/accounts/{accountId}/builds/triggers/{triggerUuid}/purge_build_cache")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BuildsAPIResponse)
  else:
    raise newException(CloudflareClientError, body)
