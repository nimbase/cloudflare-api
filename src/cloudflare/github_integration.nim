# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdBuildsReposProviderTypeProviderAccountIdRepoIdConfigAutofill*(client: CloudflareClient,
                                                                                       accountId: types.BuildsAccountId,
                                                                                       providerType: types.BuildsSCMProviderType,
                                                                                       providerAccountId: types.BuildsProviderAccountId,
                                                                                       repoId: types.BuildsRepoId,
                                                                                       branch: types.BuildsBranch,
                                                                                       rootDirectory: types.BuildsRootDirectory = default(types.BuildsRootDirectory)): Future[JsonNode] {.async.} =
  ## Analyze repository for automatic configuration detection

  var q = initOrderedTable[string, string]()
  q["branch"] = $branch
  q["root_directory"] = $rootDirectory
  let res = await client.httpGET(fmt"/accounts/{accountId}/builds/repos/{providerType}/{providerAccountId}/{repoId}/config_autofill", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
