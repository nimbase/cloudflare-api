# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdBuildsBuilds*(client: CloudflareClient,
                                       accountId: types.BuildsAccountId,
                                       versionIds: types.BuildsVersionIds): Future[JsonNode] {.async.} =
  ## Retrieve builds associated with one or more Worker version IDs.

  var q = initOrderedTable[string, string]()
  q["version_ids"] = $versionIds
  let res = await client.httpGET(fmt"/accounts/{accountId}/builds/builds", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBuildsBuildsLatest*(client: CloudflareClient,
                                             accountId: types.BuildsAccountId,
                                             externalScriptIds: types.BuildsExternalScriptIds): Future[JsonNode] {.async.} =
  ## Retrieve the most recent builds for multiple worker scripts

  var q = initOrderedTable[string, string]()
  q["external_script_ids"] = $externalScriptIds
  let res = await client.httpGET(fmt"/accounts/{accountId}/builds/builds/latest", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBuildsBuildsBuildUuid*(client: CloudflareClient,
                                                accountId: types.BuildsAccountId,
                                                buildUuid: types.BuildsBuildUuid): Future[JsonNode] {.async.} =
  ## Retrieve status, outcome, timestamps, trigger settings, and source metadata for
  ## a build UUID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/builds/builds/{buildUuid}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdBuildsBuildsBuildUuidCancel*(client: CloudflareClient,
                                                      accountId: types.BuildsAccountId,
                                                      buildUuid: types.BuildsBuildUuid): Future[JsonNode] {.async.} =
  ## Cancel a queued or running build.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/builds/builds/{buildUuid}/cancel")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBuildsBuildsBuildUuidLogs*(client: CloudflareClient,
                                                    accountId: types.BuildsAccountId,
                                                    buildUuid: types.BuildsBuildUuid,
                                                    cursor: types.BuildsCursor = default(types.BuildsCursor)): Future[JsonNode] {.async.} =
  ## Retrieve cursor-paginated log lines for a build UUID.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/accounts/{accountId}/builds/builds/{buildUuid}/logs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
