# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdIntelDomainHistory*(client: CloudflareClient,
                                             accountId: types.IntelIdentifier,
                                             domain: string = default(string)): Future[types.IntelResponse] {.async.} =
  ## Gets historical security threat and content categories currently and previously
  ## assigned to a domain.

  var q = initOrderedTable[string, string]()
  q["domain"] = $domain
  let res = await client.httpGET(fmt"/accounts/{accountId}/intel/domain-history", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IntelResponse)
  else:
    raise newException(CloudflareClientError, body)
