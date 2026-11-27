# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdPayPerUseEnabledPublishers*(client: CloudflareClient,
                                                     accountId: string,
                                                     cursor: string = default(string),
                                                     perPage: int64 = 100): Future[types.PayPerCrawlEnabledPublishersResponse] {.async.} =
  ## Returns the publishers whose offers the requesting Pay Per Use operator has
  ## accepted, one item per publisher with the domains it covers. Licensing is per
  ## publisher, and the domains are informational and do not restrict usage. Report
  ## usage with the item's publisher_id. Each item shows one accepted offer; an
  ## active offer takes precedence over an expired one. License expiration is the
  ## earlier non-null boundary from the offer and the publisher lifecycle. A future
  ## expiration remains active and is exposed to the operator. After expiration, the
  ## license remains listed as expired for one calendar month before it is omitted.
  ## Zone agreements are listed by the enabled domains endpoint instead. Items are
  ## ordered alphabetically by publisher_name, ignoring case and accents, then by
  ## publisher_id; a publisher renamed while you paginate can be skipped or listed
  ## twice. The requesting account must be an active Pay Per Use operator.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/pay-per-use/enabled-publishers", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlEnabledPublishersResponse)
  else:
    raise newException(CloudflareClientError, body)
