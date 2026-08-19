# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdIntelIp*(client: CloudflareClient,
                                  accountId: types.IntelIdentifier,
                                  ipv4: string = default(string),
                                  ipv6: string = default(string)): Future[types.IntelSchemasResponse] {.async.} =
  ## Gets the geolocation, ASN, infrastructure type of the ASN, and any security
  ## threat categories of an IP address. **Must provide ip query parameters.** For
  ## example, `/intel/ip?ipv4=1.1.1.1` or `/intel/ip?ipv6=2001:db8::1`.

  var q = initOrderedTable[string, string]()
  q["ipv4"] = $ipv4
  q["ipv6"] = $ipv6
  let res = await client.httpGET(fmt"/accounts/{accountId}/intel/ip", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IntelSchemasResponse)
  else:
    raise newException(CloudflareClientError, body)
