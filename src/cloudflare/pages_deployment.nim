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
                                                              env: PagesDeploymentEnvOption = envProduction,
                                                              page: int64 = default(int64),
                                                              perPage: int64 = default(int64)): Future[JsonNode] {.async.} =
  ## List the production or preview deployments for a Cloudflare Pages project.

  var q = initOrderedTable[string, string]()
  q["env"] = $env
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
  ## Create a Cloudflare Pages deployment from a Git branch or Direct Upload
  ## manifest. Git repositories must already be authorized in Cloudflare Pages.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pages/projects/{projectName}/deployments")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdPagesProjectsProjectNameDeploymentsDeploymentId*(client: CloudflareClient,
                                                                          deploymentId: types.PagesDeploymentId,
                                                                          projectName: types.PagesProjectName,
                                                                          accountId: types.PagesIdentifier): Future[JsonNode] {.async.} =
  ## Retrieve the status and details of a Cloudflare Pages deployment.

  let res = await client.httpGET(fmt"/accounts/{accountId}/pages/projects/{projectName}/deployments/{deploymentId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdPagesProjectsProjectNameDeploymentsDeploymentId*(client: CloudflareClient,
                                                                             deploymentId: types.PagesDeploymentId,
                                                                             projectName: types.PagesProjectName,
                                                                             accountId: types.PagesIdentifier,
                                                                             force: bool = default(bool)): Future[JsonNode] {.async.} =
  ## Remove a deployment from a Cloudflare Pages project.

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
                                                                                     deploymentId: types.PagesDeploymentId,
                                                                                     projectName: types.PagesProjectName,
                                                                                     accountId: types.PagesIdentifier): Future[JsonNode] {.async.} =
  ## Retrieve the build logs for a Cloudflare Pages deployment.

  let res = await client.httpGET(fmt"/accounts/{accountId}/pages/projects/{projectName}/deployments/{deploymentId}/history/logs")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPagesProjectsProjectNameDeploymentsDeploymentIdRetry*(client: CloudflareClient,
                                                                                deploymentId: types.PagesDeploymentId,
                                                                                projectName: types.PagesProjectName,
                                                                                accountId: types.PagesIdentifier): Future[JsonNode] {.async.} =
  ## Retry a previous Cloudflare Pages deployment.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pages/projects/{projectName}/deployments/{deploymentId}/retry")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPagesProjectsProjectNameDeploymentsDeploymentIdRollback*(client: CloudflareClient,
                                                                                   deploymentId: types.PagesDeploymentId,
                                                                                   projectName: types.PagesProjectName,
                                                                                   accountId: types.PagesIdentifier): Future[JsonNode] {.async.} =
  ## Roll back production to a previous successful Cloudflare Pages deployment.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pages/projects/{projectName}/deployments/{deploymentId}/rollback")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPagesProjectsProjectNameDeploymentsDeploymentIdTails*(client: CloudflareClient,
                                                                                deploymentId: types.PagesDeploymentId,
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
                                                                                        deploymentId: types.PagesDeploymentId,
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
