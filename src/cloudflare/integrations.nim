# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types

type
  IntegrationDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"

  IntegrationOrderOption* = enum
    orderApplication = "application"
    orderCreated = "created"
    orderName = "name"
    orderStatus = "status"

  IntegrationStatusOption* = enum
    statusHealthy = "Healthy"
    statusInitializing = "Initializing"
    statusOffline = "Offline"
    statusUnhealthy = "Unhealthy"


proc getAccountsAccountIdOneIntegrations*(client: CloudflareClient,
                                          accountId: string,
                                          application: string = default(string),
                                          direction: IntegrationDirectionOption,
                                          dlpEnabled: bool = default(bool),
                                          order: IntegrationOrderOption,
                                          page: int64 = default(int64),
                                          pageSize: int64 = default(int64),
                                          search: string = default(string),
                                          status: IntegrationStatusOption,
                                          useCases: string = default(string)): Future[types.OnePaginatedIntegrationV2ListItemList] {.async.} =
  ## Returns a paginated list of integrations for the account.

  var q = initOrderedTable[string, string]()
  q["application"] = $application
  q["direction"] = $direction
  q["dlp_enabled"] = $dlpEnabled
  q["order"] = $order
  q["page"] = $page
  q["page_size"] = $pageSize
  q["search"] = $search
  q["status"] = $status
  q["use_cases"] = $useCases
  let res = await client.httpGET(fmt"/accounts/{accountId}/one/integrations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.OnePaginatedIntegrationV2ListItemList)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdOneIntegrations*(client: CloudflareClient,
                                           accountId: string,
                                           body: types.OneIntegrationV2CreateRequest): Future[types.OneIntegrationCreateResponse] {.async.} =
  ## Creates a new integration for the specified application. Integration creation
  ## with OAuth is not supported by API at the moment. For other auth methods, use
  ## `GET /v2/applications/{application_id}/credential-guide` to see the required
  ## credential structure and example payloads for each vendor.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/one/integrations", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.OneIntegrationCreateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdOneIntegrationsId*(client: CloudflareClient,
                                            accountId: string, id: string): Future[types.OneIntegrationDetailResponse] {.async.} =
  ## Returns full integration details including use cases and permissions.

  let res = await client.httpGET(fmt"/accounts/{accountId}/one/integrations/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.OneIntegrationDetailResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdOneIntegrationsId*(client: CloudflareClient,
                                               accountId: string, id: string): Future[AsyncResponse] {.async.} =
  ## Delete an integration by soft-deleting it.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/one/integrations/{id}")
  return res

proc patchAccountsAccountIdOneIntegrationsId*(client: CloudflareClient,
                                              accountId: string, id: string,
                                              body: types.OnePatchedUpdateIntegrationV2Request): Future[types.OneIntegrationUpdateResponse] {.async.} =
  ## Updates an integration's name, permissions, DLP profiles, use cases, or
  ## credentials.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/one/integrations/{id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.OneIntegrationUpdateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdOneIntegrationsIdPause*(client: CloudflareClient,
                                                  accountId: string, id: string): Future[types.OneIntegrationPauseResponse] {.async.} =
  ## Pauses an integration, stopping all crawlers.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/one/integrations/{id}/pause")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.OneIntegrationPauseResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdOneIntegrationsIdResume*(client: CloudflareClient,
                                                   accountId: string, id: string): Future[types.OneIntegrationResumeResponse] {.async.} =
  ## Resumes a paused integration, restarting crawlers.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/one/integrations/{id}/resume")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.OneIntegrationResumeResponse)
  else:
    raise newException(CloudflareClientError, body)
