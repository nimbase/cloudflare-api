# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdDnsSettings*(client: CloudflareClient,
                                zoneId: types.DnsSettingsIdentifier): Future[types.DnsSettingsDnsResponseSingle2] {.async.} =
  ## Show DNS settings for a zone

  let res = await client.httpGET(fmt"/zones/{zoneId}/dns_settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsSettingsDnsResponseSingle2)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdDnsSettings*(client: CloudflareClient,
                                  zoneId: types.DnsSettingsIdentifier,
                                  body: types.DnsSettingsDnsSettingsZonePatch): Future[types.DnsSettingsDnsResponseSingle2] {.async.} =
  ## Update DNS settings for a zone

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/dns_settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsSettingsDnsResponseSingle2)
  else:
    raise newException(CloudflareClientError, body)
