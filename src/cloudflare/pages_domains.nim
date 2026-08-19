# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdPagesProjectsProjectNameDomainsRequest = object
    name: types.PagesDomainName

proc getAccountsAccountIdPagesProjectsProjectNameDomains*(client: CloudflareClient,
                                                          projectName: types.PagesProjectName,
                                                          accountId: types.PagesIdentifier): Future[JsonNode] {.async.} =
  ## Fetch a list of all domains associated with a Pages project.

  let res = await client.httpGET(fmt"/accounts/{accountId}/pages/projects/{projectName}/domains")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPagesProjectsProjectNameDomains*(client: CloudflareClient,
                                                           projectName: types.PagesProjectName,
                                                           accountId: types.PagesIdentifier,
                                                           body: PostAccountsAccountIdPagesProjectsProjectNameDomainsRequest): Future[JsonNode] {.async.} =
  ## Add a new domain for the Pages project.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pages/projects/{projectName}/domains", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdPagesProjectsProjectNameDomainsDomainName*(client: CloudflareClient,
                                                                    domainName: types.PagesDomainName,
                                                                    projectName: types.PagesProjectName,
                                                                    accountId: types.PagesIdentifier): Future[JsonNode] {.async.} =
  ## Fetch a single domain.

  let res = await client.httpGET(fmt"/accounts/{accountId}/pages/projects/{projectName}/domains/{domainName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdPagesProjectsProjectNameDomainsDomainName*(client: CloudflareClient,
                                                                       domainName: types.PagesDomainName,
                                                                       projectName: types.PagesProjectName,
                                                                       accountId: types.PagesIdentifier): Future[JsonNode] {.async.} =
  ## Delete a Pages project's domain.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/pages/projects/{projectName}/domains/{domainName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdPagesProjectsProjectNameDomainsDomainName*(client: CloudflareClient,
                                                                      domainName: types.PagesDomainName,
                                                                      projectName: types.PagesProjectName,
                                                                      accountId: types.PagesIdentifier): Future[JsonNode] {.async.} =
  ## Retry the validation status of a single domain.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/pages/projects/{projectName}/domains/{domainName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
