# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdWorkersAccountSettings*(client: CloudflareClient,
                                                 accountId: types.WorkersIdentifier): Future[JsonNode] {.async.} =
  ## Fetches Worker account settings for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/account-settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdWorkersAccountSettings*(client: CloudflareClient,
                                                 accountId: types.WorkersIdentifier,
                                                 body: types.WorkersAccountSettings): Future[JsonNode] {.async.} =
  ## Creates Worker account settings for an account.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/workers/account-settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
