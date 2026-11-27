# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdPayPerUseAgreements*(client: CloudflareClient,
                                              accountId: string, page: int64 = 1,
                                              perPage: int64 = 100): Future[types.PayPerCrawlPPUAgreementsResponse] {.async.} =
  ## Lists the requesting buyer's open pay-per-use offers to publishers, newest
  ## first.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/pay-per-use/agreements", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlPPUAgreementsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPayPerUseAgreements*(client: CloudflareClient,
                                               accountId: string,
                                               body: types.PayPerCrawlPPUAgreementRequest): Future[types.PayPerCrawlPPUAgreementResponse] {.async.} =
  ## Submits the requesting buyer's offer to a publisher. A buyer has one open offer
  ## per publisher; a second returns 409. A missing or null price means no price is
  ## agreed yet. The account needs a pay-per-use operator configuration, but neither
  ## side needs to be enabled or Cloudflare verified.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pay-per-use/agreements", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.PayPerCrawlPPUAgreementResponse)
  else:
    raise newException(CloudflareClientError, body)
