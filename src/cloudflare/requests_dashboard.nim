# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetAccountsAccountIdCloudforceOneV2RequestsLegalResponseAccessCheckResponse* = object
    errors: seq[string]
      ## Always empty on success
    messages: seq[string]
      ## Always empty on success
    result: JsonNode
    success: bool
  GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeConstantsResponse* = object
    properties: JsonNode
    `type`: string
  GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeMetadataResponse* = object
    data: seq[JsonNode]
    success: bool
  GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeTypesResponse* = object
    result: JsonNode
    success: bool

proc getAccountsAccountIdCloudforceOneV2RequestsLegalResponseAccessCheck*(client: CloudflareClient,
                                                                          accountId: string): Future[GetAccountsAccountIdCloudforceOneV2RequestsLegalResponseAccessCheckResponse] {.async.} =
  ## Returns whether the JWT-authenticated user's email is on the legal-response
  ## allowlist. This endpoint is purely informational for UI gating; actual access
  ## enforcement is performed by `legalResponseMiddleware` on real legal-response
  ## endpoints. Read-only — no Durable Object writes are performed.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/requests/legal-response/access-check")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2RequestsLegalResponseAccessCheckResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2RequestsProjectTypeConstants*(client: CloudflareClient,
                                                                      accountId: string,
                                                                      projectType: ProjectType): Future[GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeConstantsResponse] {.async.} =
  ## Returns available priorities, statuses, and TLP levels for request workflows

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/requests/{projectType}/constants")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeConstantsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2RequestsProjectTypeMetadata*(client: CloudflareClient,
                                                                     accountId: string,
                                                                     projectType: ProjectType,
                                                                     requestType: string = default(string),
                                                                     country: string = default(string)): Future[GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeMetadataResponse] {.async.} =
  ## Get custom metadata fields available for the specified project type

  var q = initOrderedTable[string, string]()
  q["request_type"] = $requestType
  q["country"] = $country
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/requests/{projectType}/metadata", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeMetadataResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2RequestsProjectTypeQuota*(client: CloudflareClient,
                                                                  accountId: string,
                                                                  projectType: ProjectType): Future[AsyncResponse] {.async.} =
  ## Returns the account's token quota for the current anniversary quarter: total
  ## granted, used, remaining, and the quarter/anniversary boundaries.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/requests/{projectType}/quota")
  return res

proc getAccountsAccountIdCloudforceOneV2RequestsProjectTypeTypes*(client: CloudflareClient,
                                                                  accountId: string,
                                                                  projectType: string): Future[GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeTypesResponse] {.async.} =
  ## Returns request types available to dashboard (external) callers. For restricted
  ## project types (e.g. legal-response), only the allowlisted subset is returned.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/requests/{projectType}/types")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeTypesResponse)
  else:
    raise newException(CloudflareClientError, body)
