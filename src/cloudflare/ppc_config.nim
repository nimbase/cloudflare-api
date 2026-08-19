# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc patchAccountsAccountIdPayPerCrawlZonesCanBeEnabled*(client: CloudflareClient,
                                                         accountId: string,
                                                         body: types.PayPerCrawlZonesCanBeEnabledPayload): Future[types.PayPerCrawlApiNoResultResponse] {.async.} =
  ## Allows an account admin to set the can_be_enabled setting on a list of zones.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/pay-per-crawl/zones_can_be_enabled", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlApiNoResultResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPayPerCrawlZonesCanBeEnabledQuery*(client: CloudflareClient,
                                                             accountId: string,
                                                             body: types.PayPerCrawlZonesCanBeEnabledQueryPayload): Future[types.PayPerCrawlQueryZonesCanBeEnabledResponse] {.async.} =
  ## Provided a list of pay-per-crawl configured zones this method will return
  ## whether they can enable PPC or not.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pay-per-crawl/zones_can_be_enabled/query", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlQueryZonesCanBeEnabledResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdPayPerCrawlCanBeEnabled*(client: CloudflareClient,
                                            zoneId: string): Future[types.PayPerCrawlGetZoneCanBeEnabledResponse] {.async.} =
  ## Gets whether pay-per-crawl can be enabled for a zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/pay-per-crawl/can_be_enabled")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlGetZoneCanBeEnabledResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdPayPerCrawlConfiguration*(client: CloudflareClient,
                                             zoneId: string): Future[types.PayPerCrawlGetConfigResponse] {.async.} =
  ## Gets the pay-per-crawl config for a zone including the bot configuration.

  let res = await client.httpGET(fmt"/zones/{zoneId}/pay-per-crawl/configuration")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlGetConfigResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdPayPerCrawlConfiguration*(client: CloudflareClient,
                                              zoneId: string,
                                              body: types.PayPerCrawlDaricConfig): Future[types.PayPerCrawlGetConfigResponse] {.async.} =
  ## Creates the pay-per-crawl config for a zone.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/pay-per-crawl/configuration", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlGetConfigResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdPayPerCrawlConfiguration*(client: CloudflareClient,
                                               zoneId: string,
                                               body: types.PayPerCrawlDaricConfig): Future[types.PayPerCrawlGetConfigResponse] {.async.} =
  ## Changes the pay-per-crawl config for a zone.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/pay-per-crawl/configuration", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlGetConfigResponse)
  else:
    raise newException(CloudflareClientError, body)
