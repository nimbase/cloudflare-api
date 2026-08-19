# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdSecurityCenterInsightsScans*(client: CloudflareClient,
                                                      accountId: types.SecurityCenterIdentifier): Future[JsonNode] {.async.} =
  ## Returns the most recent on-demand scans for the account, up to a maximum of 5.
  ## Each scan includes its ID, start time, and current status. This includes both
  ## account-wide and zone-scoped scans. Also returns quota information showing how
  ## many scans have been used and how many remain in the current 24-hour window.

  let res = await client.httpGET(fmt"/accounts/{accountId}/security-center/insights/scans")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdSecurityCenterInsightsScans*(client: CloudflareClient,
                                                       accountId: types.SecurityCenterIdentifier,
                                                       body: types.SecurityCenterNewScanRequest): Future[JsonNode] {.async.} =
  ## Initiates an on-demand security scan for the entire account, scanning all zones
  ## associated with the account. Rate limited to 5 scans per account per 24-hour
  ## window.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/security-center/insights/scans", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSecurityCenterInsightsScans*(client: CloudflareClient,
                                                zoneId: types.SecurityCenterIdentifier): Future[JsonNode] {.async.} =
  ## Returns the most recent on-demand scans for a specific zone, up to a maximum of
  ## 5. Each scan includes its ID, start time, and current status. Results include
  ## both zone-specific scans and account-wide scans (which cover all zones). Also
  ## returns quota information showing how many scans have been used and how many
  ## remain in the current 24-hour window.

  let res = await client.httpGET(fmt"/zones/{zoneId}/security-center/insights/scans")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdSecurityCenterInsightsScans*(client: CloudflareClient,
                                                 zoneId: types.SecurityCenterIdentifier,
                                                 body: types.SecurityCenterNewScanRequest): Future[JsonNode] {.async.} =
  ## Initiates an on-demand security scan for a specific zone. Rate limited to 5
  ## scans per account per 24-hour window (shared with account-level scans).

  let res = await client.httpPOST(fmt"/zones/{zoneId}/security-center/insights/scans", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
