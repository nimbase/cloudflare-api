# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdPayPerCrawlCrawlers*(client: CloudflareClient,
                                              accountId: string): Future[types.PayPerCrawlListCrawlersResponse] {.async.} =
  ## Lists the crawlers known to pay-per-crawl.

  let res = await client.httpGET(fmt"/accounts/{accountId}/pay-per-crawl/crawlers")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlListCrawlersResponse)
  else:
    raise newException(CloudflareClientError, body)
