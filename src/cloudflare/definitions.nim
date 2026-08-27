# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdFlagshipAppsAppIdDefinitions*(client: CloudflareClient,
                                                       accountId: string,
                                                       appId: string): Future[types.FlagshipFlagDefinitions] {.async.} =
  ## Returns an app's evaluation-only flag definitions for SDKs that evaluate
  ## locally. Send the returned `ETag` in `If-None-Match` to avoid downloading
  ## unchanged definitions.

  let res = await client.httpGET(fmt"/accounts/{accountId}/flagship/apps/{appId}/definitions")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FlagshipFlagDefinitions)
  else:
    raise newException(CloudflareClientError, body)
