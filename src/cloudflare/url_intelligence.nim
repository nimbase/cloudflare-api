# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdIntelUrl*(client: CloudflareClient,
                                   accountId: types.IntelIdentifier, url: string): Future[types.IntelUrlIntelligenceSingleResponse] {.async.} =
  ## Gets security information about a URL, including content categories and risk
  ## types. The URL must be provided as a query parameter.

  var q = initOrderedTable[string, string]()
  q["url"] = $url
  let res = await client.httpGET(fmt"/accounts/{accountId}/intel/url", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IntelUrlIntelligenceSingleResponse)
  else:
    raise newException(CloudflareClientError, body)
