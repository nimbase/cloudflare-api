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
  PostAccountsAccountIdPagesProjectsProjectNameDeploymentsDeploymentIdTailsRequest = object
    filters: Option[seq[JsonNode]]
  PagesDeploymentEnvOption* = enum
    envProduction = "production"
    envPreview = "preview"


proc getAccountsAccountIdPagesProjectsProjectNameDeployments*(client: CloudflareClient,
                                                              projectName: types.PagesProjectName,
                                                              accountId: types.PagesIdentifier,
                                                              env: set[PagesDeploymentEnvOption] = {},
                                                              page: int64 = default(int64),
                                                              perPage: int64 = default(int64)): Future[JsonNode] {.async.} =
  ## Fetch a list of project deployments.

  var q = initOrderedTable[string, string]()
  for v in env: q["env"] = $v
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/pages/projects/{projectName}/deployments", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPagesProjectsProjectNameDeployments*(client: CloudflareClient,
                                                               projectName: types.PagesProjectName,
                                                               accountId: types.PagesIdentifier): Future[JsonNode] {.async.} =
  ## Start a new deployment from production. The repository and account must have
  ## already been authorized on the Cloudflare Pages dashboard.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pages/projects/{projectName}/deployments")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdPagesProjectsProjectNameDeploymentsDeploymentId*(client: CloudflareClient,
                                                                          deploymentId: types.PagesIdentifier,
                                                                          projectName: types.PagesProjectName,
                                                                          accountId: types.PagesIdentifier): Future[JsonNode] {.async.} =
  ## Fetch information about a deployment.

  let res = await client.httpGET(fmt"/accounts/{accountId}/pages/projects/{projectName}/deployments/{deploymentId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdPagesProjectsProjectNameDeploymentsDeploymentId*(client: CloudflareClient,
                                                                             deploymentId: types.PagesIdentifier,
                                                                             projectName: types.PagesProjectName,
                                                                             accountId: types.PagesIdentifier,
                                                                             force: bool = default(bool)): Future[JsonNode] {.async.} =
  ## Delete a deployment.

  var q = initOrderedTable[string, string]()
  q["force"] = $force
  let res = await client.httpDELETE(fmt"/accounts/{accountId}/pages/projects/{projectName}/deployments/{deploymentId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdPagesProjectsProjectNameDeploymentsDeploymentIdHistoryLogs*(client: CloudflareClient,
                                                                                     deploymentId: types.PagesIdentifier,
                                                                                     projectName: types.PagesProjectName,
                                                                                     accountId: types.PagesIdentifier): Future[JsonNode] {.async.} =
  ## Fetch deployment logs for a project.

  let res = await client.httpGET(fmt"/accounts/{accountId}/pages/projects/{projectName}/deployments/{deploymentId}/history/logs")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPagesProjectsProjectNameDeploymentsDeploymentIdRetry*(client: CloudflareClient,
                                                                                deploymentId: types.PagesIdentifier,
                                                                                projectName: types.PagesProjectName,
                                                                                accountId: types.PagesIdentifier): Future[JsonNode] {.async.} =
  ## Retry a previous deployment.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pages/projects/{projectName}/deployments/{deploymentId}/retry")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPagesProjectsProjectNameDeploymentsDeploymentIdRollback*(client: CloudflareClient,
                                                                                   deploymentId: types.PagesIdentifier,
                                                                                   projectName: types.PagesProjectName,
                                                                                   accountId: types.PagesIdentifier): Future[JsonNode] {.async.} =
  ## Rollback the production deployment to a previous deployment. You can only
  ## rollback to succesful builds on production.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pages/projects/{projectName}/deployments/{deploymentId}/rollback")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPagesProjectsProjectNameDeploymentsDeploymentIdTails*(client: CloudflareClient,
                                                                                deploymentId: types.PagesIdentifier,
                                                                                projectName: types.PagesProjectName,
                                                                                accountId: types.PagesIdentifier,
                                                                                body: PostAccountsAccountIdPagesProjectsProjectNameDeploymentsDeploymentIdTailsRequest): Future[JsonNode] {.async.} =
  ## Start a tail that receives logs and exception data.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pages/projects/{projectName}/deployments/{deploymentId}/tails", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdPagesProjectsProjectNameDeploymentsDeploymentIdTailsTailId*(client: CloudflareClient,
                                                                                        tailId: types.PagesIdentifier,
                                                                                        deploymentId: types.PagesIdentifier,
                                                                                        projectName: types.PagesProjectName,
                                                                                        accountId: types.PagesIdentifier): Future[JsonNode] {.async.} =
  ## Deletes a tail from a Pages deployment.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/pages/projects/{projectName}/deployments/{deploymentId}/tails/{tailId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
