# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdSecurityCenterPartnersPartnerSettings*(client: CloudflareClient,
                                                                accountId: types.SecurityCenterIdentifier,
                                                                partner: Partner): Future[types.SecurityCenterPartnerSettingsResponse] {.async.} =
  ## Returns whether the account has enabled the selected partner integration. An
  ## integration that has never been configured is returned as disabled.

  let res = await client.httpGET(fmt"/accounts/{accountId}/security-center/partners/{partner}/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecurityCenterPartnerSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdSecurityCenterPartnersPartnerSettings*(client: CloudflareClient,
                                                                 accountId: types.SecurityCenterIdentifier,
                                                                 partner: Partner,
                                                                 body: types.SecurityCenterPartnerSettings): Future[types.SecurityCenterPartnerSettingsResponse] {.async.} =
  ## Enables or disables the selected partner integration for the account. Enabling
  ## the integration for the first time also schedules an account scan for that
  ## partner.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/security-center/partners/{partner}/settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecurityCenterPartnerSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSecurityCenterPartnersPartnerShadowZones*(client: CloudflareClient,
                                                                   accountId: types.SecurityCenterIdentifier,
                                                                   partner: Partner,
                                                                   page: int64 = 1,
                                                                   perPage: int64 = 25): Future[types.SecurityCenterShadowZonesResponse] {.async.} =
  ## Lists domains discovered by the selected partner that are not in the account.
  ## Baseline accounts receive the total count only; premium accounts receive
  ## paginated items and may request CSV output.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/security-center/partners/{partner}/shadow-zones", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecurityCenterShadowZonesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSecurityCenterPartnersPartnerShadowZonesDomainHosts*(client: CloudflareClient,
                                                                              accountId: types.SecurityCenterIdentifier,
                                                                              partner: Partner,
                                                                              domain: string,
                                                                              page: int64 = 1,
                                                                              perPage: int64 = 25): Future[types.SecurityCenterShadowHostsResponse] {.async.} =
  ## Lists hosts discovered beneath a shadow-zone domain. This endpoint is available
  ## only to premium accounts and supports JSON and CSV output.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/security-center/partners/{partner}/shadow-zones/{domain}/hosts", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecurityCenterShadowHostsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSecurityCenterPartnersPartnerShadowHosts*(client: CloudflareClient,
                                                             zoneId: types.SecurityCenterIdentifier,
                                                             partner: Partner,
                                                             page: int64 = 1,
                                                             perPage: int64 = 25): Future[types.SecurityCenterShadowHostsResponse] {.async.} =
  ## Lists partner-discovered hosts beneath the zone that are not in the account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/zones/{zoneId}/security-center/partners/{partner}/shadow-hosts", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecurityCenterShadowHostsResponse)
  else:
    raise newException(CloudflareClientError, body)
