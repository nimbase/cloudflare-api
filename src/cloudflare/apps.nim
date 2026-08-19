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
  GetAccountsAccountIdFlagshipAppsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: seq[types.FlagshipApp]
    success: bool
  PostAccountsAccountIdFlagshipAppsRequest = object
    name: string
  PostAccountsAccountIdFlagshipAppsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: types.FlagshipApp
    success: bool
  GetAccountsAccountIdFlagshipAppsAppIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: types.FlagshipApp
    success: bool
  PutAccountsAccountIdFlagshipAppsAppIdRequest = object
    name: Option[string]
  PutAccountsAccountIdFlagshipAppsAppIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: types.FlagshipApp
    success: bool
  DeleteAccountsAccountIdFlagshipAppsAppIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: types.FlagshipDeleteAppResult
    success: bool
  GetAccountsAccountIdRealtimeKitAppsResponse* = object
    data: seq[JsonNode]
    paging: JsonNode
    success: bool
  PostAccountsAccountIdRealtimeKitAppsRequest = object
    name: string
  PostAccountsAccountIdRealtimeKitAppsResponse* = object
    data: JsonNode
    success: bool
  GetAccountsAccountIdRealtimeKitAppsAppIdResponse* = object
    data: JsonNode
    success: bool
  AppSortOrderOption* = enum
    sortOrderASC = "ASC"
    sortOrderDESC = "DESC"


proc getAccountsAccountIdFlagshipApps*(client: CloudflareClient,
                                       accountId: string): Future[GetAccountsAccountIdFlagshipAppsResponse] {.async.} =
  ## Lists all apps in the account. Returns identity and audit fields only — flag
  ## definitions are not included.

  let res = await client.httpGET(fmt"/accounts/{accountId}/flagship/apps")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdFlagshipAppsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdFlagshipApps*(client: CloudflareClient,
                                        accountId: string,
                                        body: PostAccountsAccountIdFlagshipAppsRequest): Future[PostAccountsAccountIdFlagshipAppsResponse] {.async.} =
  ## Creates an app. The returned `id` is used in all subsequent flag, changelog, and
  ## evaluation requests.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/flagship/apps", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, PostAccountsAccountIdFlagshipAppsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdFlagshipAppsAppId*(client: CloudflareClient,
                                            accountId: string, appId: string): Future[GetAccountsAccountIdFlagshipAppsAppIdResponse] {.async.} =
  ## Returns an app's name and audit fields. Flag definitions are not included.

  let res = await client.httpGET(fmt"/accounts/{accountId}/flagship/apps/{appId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdFlagshipAppsAppIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdFlagshipAppsAppId*(client: CloudflareClient,
                                            accountId: string, appId: string,
                                            body: PutAccountsAccountIdFlagshipAppsAppIdRequest): Future[PutAccountsAccountIdFlagshipAppsAppIdResponse] {.async.} =
  ## Updates an app. Only `name` is mutable.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/flagship/apps/{appId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdFlagshipAppsAppIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdFlagshipAppsAppId*(client: CloudflareClient,
                                               accountId: string, appId: string): Future[DeleteAccountsAccountIdFlagshipAppsAppIdResponse] {.async.} =
  ## Deletes an app and all its flags and changelog history. Returns 409 if any
  ## Worker still references this app via a Flagship binding.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/flagship/apps/{appId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdFlagshipAppsAppIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitApps*(client: CloudflareClient,
                                          pageNo: int64 = 1, perPage: int64 = 20,
                                          search: string = default(string),
                                          sortOrder: string = "DESC"): Future[GetAccountsAccountIdRealtimeKitAppsResponse] {.async.} =
  ## Fetch all apps for your account

  var q = initOrderedTable[string, string]()
  q["page_no"] = $pageNo
  q["per_page"] = $perPage
  q["search"] = $search
  for v in sortOrder: q["sort_order"] = $v
  let res = await client.httpGET("/accounts/{account_id}/realtime/kit/apps", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdRealtimeKitAppsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdRealtimeKitApps*(client: CloudflareClient,
                                           body: PostAccountsAccountIdRealtimeKitAppsRequest): Future[PostAccountsAccountIdRealtimeKitAppsResponse] {.async.} =
  ## Create new app for your account

  let res = await client.httpPOST("/accounts/{account_id}/realtime/kit/apps", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdRealtimeKitAppsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitAppsAppId*(client: CloudflareClient,
                                               accountId: types.RealtimekitAccountIdentifier,
                                               appId: types.RealtimekitAppId): Future[GetAccountsAccountIdRealtimeKitAppsAppIdResponse] {.async.} =
  ## Fetch details for an app in your account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/apps/{appId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdRealtimeKitAppsAppIdResponse)
  else:
    raise newException(CloudflareClientError, body)
