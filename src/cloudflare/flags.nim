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
  GetAccountsAccountIdFlagshipAppsAppIdFlagsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: types.FlagshipFlagsPage
    result_info: types.FlagshipResultInfo
    success: bool
  PostAccountsAccountIdFlagshipAppsAppIdFlagsRequest = object
    default_variation: string
    description: Option[string]
    enabled: bool
    key: string
    rules: seq[JsonNode]
    `type`: Option[string]
    variations: JsonNode
  PostAccountsAccountIdFlagshipAppsAppIdFlagsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: types.FlagshipFlag
    success: bool
  GetAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: types.FlagshipFlag
    success: bool
  PutAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyRequest = object
    default_variation: string
    description: Option[string]
    enabled: bool
    key: string
    rules: seq[JsonNode]
    `type`: Option[string]
    variations: JsonNode
  PutAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: types.FlagshipFlag
    success: bool
  DeleteAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: types.FlagshipDeleteFlagResult
    success: bool

proc getAccountsAccountIdFlagshipAppsAppIdFlags*(client: CloudflareClient,
                                                 accountId: string,
                                                 appId: string,
                                                 limit: string = default(string),
                                                 cursor: string = default(string)): Future[GetAccountsAccountIdFlagshipAppsAppIdFlagsResponse] {.async.} =
  ## Lists an app's flags ordered by key. Pass `cursor` from `result_info` to page
  ## forward; a null cursor indicates the last page.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/accounts/{accountId}/flagship/apps/{appId}/flags", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdFlagshipAppsAppIdFlagsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdFlagshipAppsAppIdFlags*(client: CloudflareClient,
                                                  accountId: string,
                                                  appId: string,
                                                  body: PostAccountsAccountIdFlagshipAppsAppIdFlagsRequest): Future[PostAccountsAccountIdFlagshipAppsAppIdFlagsResponse] {.async.} =
  ## Creates a flag. Returns 409 if the key already exists. `type` is inferred from
  ## variation values and may be omitted.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/flagship/apps/{appId}/flags", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, PostAccountsAccountIdFlagshipAppsAppIdFlagsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdFlagshipAppsAppIdFlagsFlagKey*(client: CloudflareClient,
                                                        accountId: string,
                                                        appId: string,
                                                        flagKey: string): Future[GetAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyResponse] {.async.} =
  ## Returns the full flag definition including rules, variations, and audit fields.

  let res = await client.httpGET(fmt"/accounts/{accountId}/flagship/apps/{appId}/flags/{flagKey}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdFlagshipAppsAppIdFlagsFlagKey*(client: CloudflareClient,
                                                        accountId: string,
                                                        appId: string,
                                                        flagKey: string,
                                                        body: PutAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyRequest): Future[PutAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyResponse] {.async.} =
  ## Replaces the entire flag definition. Omitted fields are dropped, not preserved —
  ## read before writing. Each update appends a changelog entry.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/flagship/apps/{appId}/flags/{flagKey}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdFlagshipAppsAppIdFlagsFlagKey*(client: CloudflareClient,
                                                           accountId: string,
                                                           appId: string,
                                                           flagKey: string): Future[DeleteAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyResponse] {.async.} =
  ## Deletes a flag permanently. Subsequent evaluations fall back to the
  ## caller-supplied default. Cannot be undone.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/flagship/apps/{appId}/flags/{flagKey}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyResponse)
  else:
    raise newException(CloudflareClientError, body)
