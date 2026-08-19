# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdCustomNs*(client: CloudflareClient,
                             zoneId: types.DnsCustomNameserversIdentifier2): Future[types.DnsCustomNameserversGetResponse] {.async.} =
  ## Get metadata for account-level custom nameservers on a zone.
  ##
  ## Deprecated in favor of [Show DNSSettings](https://developers.cloudflare.com/api
  ## /operations/dns-settings-for-a-zone-list-dns-settings).

  let res = await client.httpGET(fmt"/zones/{zoneId}/custom_ns")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsCustomNameserversGetResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdCustomNs*(client: CloudflareClient,
                             zoneId: types.DnsCustomNameserversIdentifier2,
                             body: types.DnsCustomNameserversZoneMetadata): Future[types.DnsCustomNameserversEmptyResponse2] {.async.} =
  ## Set metadata for account-level custom nameservers on a zone.
  ##
  ## If you would like new zones in the account to use account custom nameservers by
  ## default, use PUT /accounts/:identifier to set the account setting
  ## use_account_custom_ns_by_default to true.
  ##
  ## Deprecated in favor of [Update DNSSettings](https://developers.cloudflare.com/a
  ## pi/operations/dns-settings-for-a-zone-update-dns-settings).

  let res = await client.httpPUT(fmt"/zones/{zoneId}/custom_ns", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsCustomNameserversEmptyResponse2)
  else:
    raise newException(CloudflareClientError, body)
