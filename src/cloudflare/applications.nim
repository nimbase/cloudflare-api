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
  ApplicationEnvironmentOption* = enum
    environmentFedramp = "fedramp"
    environmentStandard = "standard"


proc getAccountsAccountIdContainersApplications*(client: CloudflareClient,
                                                 name: types.CcApplicationName = default(types.CcApplicationName),
                                                 image: types.CcImage = default(types.CcImage),
                                                 label: seq[string] = @[]): Future[JsonNode] {.async.} =
  ## Lists all the applications that are associated with your account.

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  q["image"] = $image
  for v in label: q["label"] = $v
  let res = await client.httpGET("/accounts/{account_id}/containers/applications", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdContainersApplications*(client: CloudflareClient,
                                                  body: types.CcCreateApplicationRequest): Future[JsonNode] {.async.} =
  ## Create a new application. An Application represents an intent to run one or more
  ## containers, with the same image, dynamically scheduled based on constraints.

  let res = await client.httpPOST("/accounts/{account_id}/containers/applications", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdContainersApplicationsApplicationId*(client: CloudflareClient,
                                                              applicationId: types.CcApplicationID): Future[JsonNode] {.async.} =
  ## Returns a single application by id.

  let res = await client.httpGET(fmt"/accounts/{account_id}/containers/applications/{applicationId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdContainersApplicationsApplicationId*(client: CloudflareClient,
                                                                 applicationId: types.CcApplicationID): Future[JsonNode] {.async.} =
  ## Deletes a single application by id.

  let res = await client.httpDELETE(fmt"/accounts/{account_id}/containers/applications/{applicationId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdContainersApplicationsApplicationId*(client: CloudflareClient,
                                                                applicationId: types.CcApplicationID,
                                                                body: types.CcContainersModifyApplicationRequestBody): Future[JsonNode] {.async.} =
  ## Modifies a single application by id. Changes that replace instance deployment
  ## configuration, including the image, must be applied with a rollout.

  let res = await client.httpPATCH(fmt"/accounts/{account_id}/containers/applications/{applicationId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdContainersApplicationsApplicationIdVersions*(client: CloudflareClient,
                                                                      applicationId: types.CcApplicationID): Future[JsonNode] {.async.} =
  ## Returns all versions for this application.

  let res = await client.httpGET(fmt"/accounts/{account_id}/containers/applications/{applicationId}/versions")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdOneApplications*(client: CloudflareClient,
                                          accountId: string,
                                          environment: string = default(string),
                                          page: int64 = default(int64),
                                          pageSize: int64 = default(int64)): Future[types.OnePaginatedApplicationListList] {.async.} =
  ## Returns a list of available applications with use cases and permissions.

  var q = initOrderedTable[string, string]()
  q["environment"] = $environment
  q["page"] = $page
  q["page_size"] = $pageSize
  let res = await client.httpGET(fmt"/accounts/{accountId}/one/applications", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.OnePaginatedApplicationListList)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdOneApplicationsApplicationId*(client: CloudflareClient,
                                                       accountId: string,
                                                       applicationId: ApplicationId): Future[types.OneApplicationDetailResponse] {.async.} =
  ## Returns full application details including auth methods, use cases, and
  ## permissions.

  let res = await client.httpGET(fmt"/accounts/{accountId}/one/applications/{applicationId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.OneApplicationDetailResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdOneApplicationsApplicationIdAuthMethods*(client: CloudflareClient,
                                                                  accountId: string,
                                                                  applicationId: ApplicationId,
                                                                  page: int64 = default(int64),
                                                                  pageSize: int64 = default(int64)): Future[types.OnePaginatedAuthMethodDetailList] {.async.} =
  ## Returns available auth methods for the specified vendor, including credential
  ## schema, instructions, and example payloads. Use this to understand what
  ## credentials are required before calling POST /v2/integrations.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["page_size"] = $pageSize
  let res = await client.httpGET(fmt"/accounts/{accountId}/one/applications/{applicationId}/auth-methods", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.OnePaginatedAuthMethodDetailList)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdOneApplicationsApplicationIdSetupFlows*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 applicationId: ApplicationId,
                                                                 authMethod: string = default(string),
                                                                 environment: ApplicationEnvironmentOption,
                                                                 page: int64 = default(int64),
                                                                 pageSize: int64 = default(int64)): Future[types.OnePaginatedSetupFlowList] {.async.} =
  ## Returns all available setup flows for the application, one per auth method.

  var q = initOrderedTable[string, string]()
  q["auth_method"] = $authMethod
  q["environment"] = $environment
  q["page"] = $page
  q["page_size"] = $pageSize
  let res = await client.httpGET(fmt"/accounts/{accountId}/one/applications/{applicationId}/setup-flows", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.OnePaginatedSetupFlowList)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdResourceLibraryApplications*(client: CloudflareClient,
                                                      accountId: string,
                                                      filter: string = default(string),
                                                      limit: int64 = 25,
                                                      offset: int64 = 0,
                                                      orderBy: string = default(string),
                                                      search: string = default(string)): Future[types.AlexandriaGetApplicationsResponse] {.async.} =
  ## List applications with different filters.

  var q = initOrderedTable[string, string]()
  q["filter"] = $filter
  q["limit"] = $limit
  q["offset"] = $offset
  q["order_by"] = $orderBy
  q["search"] = $search
  let res = await client.httpGET(fmt"/accounts/{accountId}/resource-library/applications", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AlexandriaGetApplicationsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdResourceLibraryApplications*(client: CloudflareClient,
                                                       accountId: string,
                                                       body: types.AlexandriaCreateApplicationRequest): Future[types.AlexandriaGetApplicationResponse] {.async.} =
  ## Create a custom application for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/resource-library/applications", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AlexandriaGetApplicationResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdResourceLibraryApplicationsId*(client: CloudflareClient,
                                                        accountId: string,
                                                        id: int64): Future[types.AlexandriaGetApplicationResponse] {.async.} =
  ## Get application by ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/resource-library/applications/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AlexandriaGetApplicationResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdResourceLibraryApplicationsId*(client: CloudflareClient,
                                                           accountId: string,
                                                           id: types.AlexandriaApplicationId): Future[types.AlexandriaDeleteApplicationResponse] {.async.} =
  ## Delete a custom application and all of its versions.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/resource-library/applications/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AlexandriaDeleteApplicationResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdResourceLibraryApplicationsId*(client: CloudflareClient,
                                                          accountId: string,
                                                          id: types.AlexandriaApplicationId,
                                                          body: types.AlexandriaUpdateApplicationRequest): Future[types.AlexandriaGetApplicationResponse] {.async.} =
  ## Replace the network matchers for a custom application and create a new version.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/resource-library/applications/{id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AlexandriaGetApplicationResponse)
  else:
    raise newException(CloudflareClientError, body)
