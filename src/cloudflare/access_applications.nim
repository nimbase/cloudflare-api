# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdAccessApps*(client: CloudflareClient,
                                     accountId: types.AccessIdentifier,
                                     name: string = default(string),
                                     domain: string = default(string),
                                     aud: string = default(string),
                                     targetAttributes: string = default(string),
                                     exact: bool = default(bool),
                                     search: string = default(string),
                                     page: int64 = 1, perPage: int64 = 1000): Future[types.AccessResponseCollection7] {.async.} =
  ## Lists all Access applications in an account.

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  q["domain"] = $domain
  q["aud"] = $aud
  q["target_attributes"] = $targetAttributes
  q["exact"] = $exact
  q["search"] = $search
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/apps", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection7)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessApps*(client: CloudflareClient,
                                      accountId: types.AccessIdentifier,
                                      body: types.AccessAppRequest): Future[JsonNode] {.async.} =
  ## Adds a new application to Access.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/apps", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessAppsAppId*(client: CloudflareClient,
                                          appId: types.AccessAppId,
                                          accountId: types.AccessIdentifier): Future[types.AccessSingleResponse8] {.async.} =
  ## Fetches information about an Access application.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/apps/{appId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse8)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAccessAppsAppId*(client: CloudflareClient,
                                          appId: types.AccessAppId,
                                          accountId: types.AccessIdentifier,
                                          body: types.AccessAppRequest): Future[JsonNode] {.async.} =
  ## Updates an Access application.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/access/apps/{appId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAccessAppsAppId*(client: CloudflareClient,
                                             appId: types.AccessAppId,
                                             accountId: types.AccessIdentifier): Future[types.AccessIdResponse] {.async.} =
  ## Deletes an application from Access.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/access/apps/{appId}")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.AccessIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessAppsAppIdRevokeTokens*(client: CloudflareClient,
                                                       appId: types.AccessAppId,
                                                       accountId: types.AccessIdentifier): Future[types.AccessEmptyResponse2] {.async.} =
  ## Revokes all tokens issued for an application.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/apps/{appId}/revoke_tokens")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.AccessEmptyResponse2)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAccessAppsAppIdSettings*(client: CloudflareClient,
                                                  appId: types.AccessAppId,
                                                  accountId: types.AccessIdentifier,
                                                  body: types.AccessAppSettingsRequest): Future[JsonNode] {.async.} =
  ## Updates Access application settings.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/access/apps/{appId}/settings", body)
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdAccessAppsAppIdSettings*(client: CloudflareClient,
                                                    appId: types.AccessAppId,
                                                    accountId: types.AccessIdentifier,
                                                    body: types.AccessAppSettingsRequest): Future[JsonNode] {.async.} =
  ## Updates Access application settings.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/access/apps/{appId}/settings", body)
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessAppsAppIdUserPolicyChecks*(client: CloudflareClient,
                                                          appId: types.AccessAppId,
                                                          accountId: types.AccessIdentifier): Future[types.AccessPolicyCheckResponse] {.async.} =
  ## Tests if a specific user has permission to access an application.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/apps/{appId}/user_policy_checks")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessPolicyCheckResponse)
  else:
    raise newException(CloudflareClientError, body)
