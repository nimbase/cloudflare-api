# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc postAccountsAccountIdPagesProjectsProjectNamePurgeBuildCache*(client: CloudflareClient,
                                                                   projectName: types.PagesProjectName,
                                                                   accountId: types.PagesIdentifier): Future[JsonNode] {.async.} =
  ## Purge all cached build artifacts for a Pages project

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pages/projects/{projectName}/purge_build_cache")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
