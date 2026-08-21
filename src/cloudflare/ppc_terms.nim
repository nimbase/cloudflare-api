# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types

type
  PpcTermEventTypeOption* = enum
    eventTypeAgreed = "agreed"
    eventTypeDisplayed = "displayed"


proc getAccountsAccountIdPayPerCrawlSignatureLink*(client: CloudflareClient,
                                                   accountId: string): Future[types.PayPerCrawlGetTermsSignatureLinkResponse] {.async.} =
  ## Gets a download link for the account's signed pay-per-crawl terms.

  let res = await client.httpGET(fmt"/accounts/{accountId}/pay-per-crawl/signature_link")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlGetTermsSignatureLinkResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdPayPerCrawlTerms*(client: CloudflareClient,
                                           accountId: string): Future[types.PayPerCrawlGetTermsResponse] {.async.} =
  ## Gets the pay-per-crawl terms and conditions contract.

  let res = await client.httpGET(fmt"/accounts/{accountId}/pay-per-crawl/terms")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlGetTermsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdPayPerCrawlTermsSignature*(client: CloudflareClient,
                                                    accountId: string,
                                                    remote: bool = default(bool)): Future[types.PayPerCrawlGetTermsSignatureResponse] {.async.} =
  ## Gets the account's pay-per-crawl terms signature status.

  var q = initOrderedTable[string, string]()
  q["remote"] = $remote
  let res = await client.httpGET(fmt"/accounts/{accountId}/pay-per-crawl/terms/signature", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlGetTermsSignatureResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPayPerCrawlTermsSignature*(client: CloudflareClient,
                                                     accountId: string,
                                                     eventType: PpcTermEventTypeOption,
                                                     vid: string): Future[types.PayPerCrawlApiNoResultResponse] {.async.} =
  ## Records that an account displayed or agreed to the pay-per-crawl terms.

  var q = initOrderedTable[string, string]()
  q["event_type"] = $eventType
  q["vid"] = $vid
  let res = await client.httpPOST(fmt"/accounts/{accountId}/pay-per-crawl/terms/signature", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlApiNoResultResponse)
  else:
    raise newException(CloudflareClientError, body)
