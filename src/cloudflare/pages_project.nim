# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdPagesProjectsRequest = object
    build_config: Option[JsonNode]
    deployment_configs: Option[JsonNode]
    name: string
    production_branch: string
    source: Option[JsonNode]
  PatchAccountsAccountIdPagesProjectsProjectNameRequest = object
    build_config: Option[JsonNode]
    deployment_configs: Option[JsonNode]
    name: Option[string]
    production_branch: Option[string]
    source: Option[JsonNode]

proc getAccountsAccountIdPagesProjects*(client: CloudflareClient,
                                        accountId: types.PagesIdentifier,
                                        page: int64 = default(int64),
                                        perPage: int64 = default(int64)): Future[JsonNode] {.async.} =
  ## Fetch a list of all user projects.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/pages/projects", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPagesProjects*(client: CloudflareClient,
                                         accountId: types.PagesIdentifier,
                                         body: PostAccountsAccountIdPagesProjectsRequest): Future[JsonNode] {.async.} =
  ## Create a new project.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pages/projects", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdPagesProjectsProjectName*(client: CloudflareClient,
                                                   projectName: types.PagesProjectName,
                                                   accountId: types.PagesIdentifier): Future[JsonNode] {.async.} =
  ## Fetch a project by name.

  let res = await client.httpGET(fmt"/accounts/{accountId}/pages/projects/{projectName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdPagesProjectsProjectName*(client: CloudflareClient,
                                                      projectName: types.PagesProjectName,
                                                      accountId: types.PagesIdentifier): Future[JsonNode] {.async.} =
  ## Delete a project by name.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/pages/projects/{projectName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdPagesProjectsProjectName*(client: CloudflareClient,
                                                     projectName: types.PagesProjectName,
                                                     accountId: types.PagesIdentifier,
                                                     body: PatchAccountsAccountIdPagesProjectsProjectNameRequest): Future[JsonNode] {.async.} =
  ## Set new attributes for an existing project. Modify environment variables. To
  ## delete an environment variable, set the key to null.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/pages/projects/{projectName}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPagesProjectsProjectNameSource*(client: CloudflareClient,
                                                          projectName: types.PagesProjectName,
                                                          accountId: types.PagesIdentifier,
                                                          body: types.PagesSource): Future[JsonNode] {.async.} =
  ## Connect a Git repository source to an existing Pages project.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pages/projects/{projectName}/source", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdPagesProjectsProjectNameSource*(client: CloudflareClient,
                                                            projectName: types.PagesProjectName,
                                                            accountId: types.PagesIdentifier): Future[JsonNode] {.async.} =
  ## Disconnect the Git repository source from an existing Pages project.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/pages/projects/{projectName}/source")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdPagesProjectsProjectNameUploadToken*(client: CloudflareClient,
                                                              projectName: types.PagesProjectName,
                                                              accountId: types.PagesIdentifier): Future[JsonNode] {.async.} =
  ## Get a short-lived JWT for Pages Direct Upload asset operations.

  let res = await client.httpGET(fmt"/accounts/{accountId}/pages/projects/{projectName}/upload-token")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
