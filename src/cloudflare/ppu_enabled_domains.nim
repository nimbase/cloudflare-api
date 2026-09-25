# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdPayPerUseEnabledDomains*(client: CloudflareClient,
                                                  accountId: string,
                                                  cursor: string = default(string),
                                                  perPage: int64 = 100): Future[types.PayPerCrawlEnabledDomainsResponse] {.async.} =
  ## Returns publisher domains associated with the requesting Pay Per Use operator
  ## through an accepted price agreement. License expiration is the earlier non-null
  ## boundary from the price agreement and publisher zone lifecycles. A future
  ## expiration remains active and is exposed to the operator. After expiration, the
  ## license remains listed as expired for one calendar month before it is omitted;
  ## an active agreement for the same domain takes precedence. The requesting account
  ## must be an active Pay Per Use operator.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/pay-per-use/enabled-domains", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlEnabledDomainsResponse)
  else:
    raise newException(CloudflareClientError, body)
