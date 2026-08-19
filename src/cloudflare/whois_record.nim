# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdIntelWhois*(client: CloudflareClient,
                                     accountId: types.CloudforceOneWhoisIdentifier,
                                     domain: string = default(string)): Future[types.CloudforceOneWhoisSchemasSingleResponse] {.async.} =
  ## Retrieves WHOIS registration data for a domain, including registrant and
  ## nameserver information.

  var q = initOrderedTable[string, string]()
  q["domain"] = $domain
  let res = await client.httpGET(fmt"/accounts/{accountId}/intel/whois", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudforceOneWhoisSchemasSingleResponse)
  else:
    raise newException(CloudflareClientError, body)
