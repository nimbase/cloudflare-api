# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc putAccountsAccountIdBuildsReposConnections*(client: CloudflareClient,
                                                 accountId: types.BuildsAccountId,
                                                 body: types.BuildsUpsertRepoConnectionRequest): Future[JsonNode] {.async.} =
  ## Upsert a repository connection for CI/CD integration

  let res = await client.httpPUT(fmt"/accounts/{accountId}/builds/repos/connections", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdBuildsReposConnectionsRepoConnectionUuid*(client: CloudflareClient,
                                                                      accountId: types.BuildsAccountId,
                                                                      repoConnectionUuid: types.BuildsRepoConnectionUuid): Future[types.BuildsAPIResponse] {.async.} =
  ## Remove a repository connection

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/builds/repos/connections/{repoConnectionUuid}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BuildsAPIResponse)
  else:
    raise newException(CloudflareClientError, body)
