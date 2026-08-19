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
  GetAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyChangelogResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: types.FlagshipChangelogPage
    result_info: types.FlagshipResultInfo
    success: bool

proc getAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyChangelog*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 appId: string,
                                                                 flagKey: string,
                                                                 limit: string = default(string),
                                                                 cursor: string = default(string)): Future[GetAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyChangelogResponse] {.async.} =
  ## Returns the audit history for a flag, newest first. Each entry includes the
  ## event type and full flag state after the change; `update` entries include a
  ## field-level diff. Capped at 200 entries per flag.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/accounts/{accountId}/flagship/apps/{appId}/flags/{flagKey}/changelog", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdFlagshipAppsAppIdFlagsFlagKeyChangelogResponse)
  else:
    raise newException(CloudflareClientError, body)
