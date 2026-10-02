# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdPayPerUseOperatorConfiguration*(client: CloudflareClient,
                                                         accountId: string): Future[types.PayPerCrawlPPUOperatorConfigurationResultResponse] {.async.} =
  ## Gets the pay-per-use operator configuration for an account, including its
  ## read-only non-billable classification timestamp.

  let res = await client.httpGET(fmt"/accounts/{accountId}/pay-per-use/operator/configuration")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlPPUOperatorConfigurationResultResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdPayPerUseOperatorConfiguration*(client: CloudflareClient,
                                                         accountId: string,
                                                         body: types.PayPerCrawlPPUOperatorConfiguration): Future[types.PayPerCrawlPPUOperatorConfigurationResponse] {.async.} =
  ## Creates or updates the pay-per-use operator configuration for an account.
  ## Creating an enabled configuration or re-enabling a disabled billable operator
  ## requires completed Stripe onboarding, while non-billable operators do not; an
  ## already-enabled operator is not affected by later Stripe status changes. A
  ## Cloudflare-verified operator's name and default price cannot be changed.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/pay-per-use/operator/configuration", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlPPUOperatorConfigurationResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdPayPerUseOperatorConfiguration*(client: CloudflareClient,
                                                           accountId: string,
                                                           body: types.PayPerCrawlPPUOperatorConfigurationUpdate): Future[types.PayPerCrawlPPUOperatorConfigurationResponse] {.async.} =
  ## Updates one or more fields of an existing pay-per-use operator configuration.
  ## Re-enabling a disabled billable operator requires completed Stripe onboarding,
  ## while non-billable operators do not; an already-enabled operator is not affected
  ## by later Stripe status changes. A Cloudflare-verified operator's name and
  ## default price cannot be changed.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/pay-per-use/operator/configuration", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlPPUOperatorConfigurationResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdPayPerUseZonesCanBeEnabled*(client: CloudflareClient,
                                                       accountId: string,
                                                       body: types.PayPerCrawlPPUZonesCanBeEnabledPayload): Future[types.PayPerCrawlApiNoResultResponse] {.async.} =
  ## Sets pay-per-use eligibility for a list of account zones. An omitted
  ## can_be_enabled value leaves that zone unchanged. Revoking eligibility disables
  ## the zone immediately while existing accepted licenses remain active until the
  ## start of the next UTC month.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/pay-per-use/zones_can_be_enabled", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlApiNoResultResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdPayPerUseCanBeEnabled*(client: CloudflareClient,
                                          zoneId: string): Future[types.PayPerCrawlPPUZoneCanBeEnabledResponse] {.async.} =
  ## Gets whether pay-per-use can be enabled for a zone and the current zone-level
  ## grace period.

  let res = await client.httpGET(fmt"/zones/{zoneId}/pay-per-use/can_be_enabled")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlPPUZoneCanBeEnabledResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdPayPerUseConfiguration*(client: CloudflareClient,
                                           zoneId: string): Future[types.PayPerCrawlPPUZoneConfigurationResultResponse] {.async.} =
  ## Gets the pay-per-use configuration, zone-level grace period, and read-only
  ## non-billable classification timestamp for a zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/pay-per-use/configuration")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlPPUZoneConfigurationResultResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdPayPerUseConfiguration*(client: CloudflareClient,
                                             zoneId: string,
                                             body: types.PayPerCrawlPPUZoneConfigurationUpdate): Future[types.PayPerCrawlPPUZoneConfigurationResponse] {.async.} =
  ## Enables or disables an existing pay-per-use zone configuration. Omitting enabled
  ## leaves the zone unchanged. Enabling a disabled billable zone requires completed
  ## publisher Stripe onboarding, while non-billable zones do not; an already-enabled
  ## zone is not affected by later Stripe status changes. Disabling starts a disabled
  ## period immediately while existing accepted licenses remain active until the
  ## start of the next UTC month; re-enabling before expiry clears the schedule and
  ## restores those licenses.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/pay-per-use/configuration", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PayPerCrawlPPUZoneConfigurationResponse)
  else:
    raise newException(CloudflareClientError, body)
