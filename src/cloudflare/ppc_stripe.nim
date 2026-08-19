# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdPayPerCrawlCrawlerStripe*(client: CloudflareClient,
                                                   accountId: string): Future[types.PayPerCrawlGetStripeConfigResponse] {.async.} =
  ## Gets the stripe config for a crawler.

  let res = await client.httpGET(fmt"/accounts/{accountId}/pay-per-crawl/crawler/stripe")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlGetStripeConfigResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPayPerCrawlCrawlerStripe*(client: CloudflareClient,
                                                    accountId: string): Future[types.PayPerCrawlCreateStripeConfigResponse] {.async.} =
  ## Creates the stripe config for a crawler.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pay-per-crawl/crawler/stripe")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlCreateStripeConfigResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdPayPerCrawlCrawlerStripe*(client: CloudflareClient,
                                                      accountId: string): Future[types.PayPerCrawlApiNoResultResponse] {.async.} =
  ## Deletes the stripe config for a crawler.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/pay-per-crawl/crawler/stripe")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlApiNoResultResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdPayPerCrawlPublisherStripe*(client: CloudflareClient,
                                                     accountId: string): Future[types.PayPerCrawlGetStripeConfigResponse] {.async.} =
  ## Gets the stripe config for a publisher.

  let res = await client.httpGET(fmt"/accounts/{accountId}/pay-per-crawl/publisher/stripe")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlGetStripeConfigResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPayPerCrawlPublisherStripe*(client: CloudflareClient,
                                                      accountId: string): Future[types.PayPerCrawlCreateStripeConfigResponse] {.async.} =
  ## Creates the stripe config for a publisher.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pay-per-crawl/publisher/stripe")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlCreateStripeConfigResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdPayPerCrawlPublisherStripe*(client: CloudflareClient,
                                                        accountId: string): Future[types.PayPerCrawlApiNoResultResponse] {.async.} =
  ## Deletes the stripe config for a publisher.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/pay-per-crawl/publisher/stripe")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlApiNoResultResponse)
  else:
    raise newException(CloudflareClientError, body)
