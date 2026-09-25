# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdPayPerUseProposals*(client: CloudflareClient,
                                             accountId: string, page: int64 = 1,
                                             perPage: int64 = 100): Future[types.PayPerCrawlPPUProposalsResponse] {.async.} =
  ## Lists a paginated set of outstanding pay-per-use publisher price proposals for
  ## an operator. Listing remains available while the operator is disabled or its
  ## name is unverified so proposals can be rejected.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/pay-per-use/proposals", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlPPUProposalsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPayPerUseProposals*(client: CloudflareClient,
                                              accountId: string,
                                              body: types.PayPerCrawlPPUOperatorProposalActionRequest): Future[types.PayPerCrawlPPUPriceResponse] {.async.} =
  ## Accepts or rejects the pending pay-per-use price proposal identified by price_id
  ## in the request body. Acceptance requires an enabled operator with a verified
  ## name, an enabled publisher zone, and matching billing classifications; rejection
  ## remains available for cleanup.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pay-per-use/proposals", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlPPUPriceResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdPayPerUseOperators*(client: CloudflareClient, zoneId: string,
                                       page: int64 = 1, perPage: int64 = 100): Future[types.PayPerCrawlPPUOperatorPricesResponse] {.async.} =
  ## Lists a paginated set of enabled pay-per-use operators with verified names,
  ## matching billing classification, and their prices for a zone.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/zones/{zoneId}/pay-per-use/operators", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlPPUOperatorPricesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdPayPerUseOperatorsOperatorIdPrice*(client: CloudflareClient,
                                                       zoneId: string,
                                                       operatorId: string,
                                                       body: types.PayPerCrawlPPUPublisherPriceActionRequest): Future[types.PayPerCrawlPPUPriceResponse] {.async.} =
  ## Proposes a required price, withdraws a pending proposal, accepts an operator's
  ## default pay-per-use price, or resumes an accepted price before its scheduled
  ## expiry. Propose, accept_default, and resume require an enabled operator with a
  ## verified name, an enabled publisher zone, and matching billing classifications.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/pay-per-use/operators/{operatorId}/price", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlPPUPriceResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdPayPerUseOperatorsOperatorIdPrice*(client: CloudflareClient,
                                                         zoneId: string,
                                                         operatorId: string): Future[types.PayPerCrawlApiNoResultResponse] {.async.} =
  ## Opts a zone out by scheduling the current accepted pay-per-use operator price to
  ## expire at the start of the next UTC month. Use the withdraw action for a pending
  ## proposal.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/pay-per-use/operators/{operatorId}/price")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlApiNoResultResponse)
  else:
    raise newException(CloudflareClientError, body)
