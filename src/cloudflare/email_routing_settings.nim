# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdEmailRouting*(client: CloudflareClient,
                                 zoneId: types.EmailIdentifier): Future[types.EmailEmailSettingsResponseSingle] {.async.} =
  ## Get information about the settings for your Email Routing zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/email/routing")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailEmailSettingsResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdEmailRouting*(client: CloudflareClient,
                                 zoneId: types.EmailIdentifier,
                                 body: types.EmailUpdateEmailRoutingSettingsProperties): Future[types.EmailEmailSettingsResponseSingle] {.async.} =
  ## Update the settings for your Email Routing zone.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/email/routing", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailEmailSettingsResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdEmailRouting*(client: CloudflareClient,
                                   zoneId: types.EmailIdentifier,
                                   body: types.EmailUpdateEmailRoutingSettingsProperties): Future[types.EmailEmailSettingsResponseSingle] {.async.} =
  ## Update the settings for your Email Routing zone.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/email/routing", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailEmailSettingsResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdEmailRoutingDisable*(client: CloudflareClient,
                                         zoneId: types.EmailIdentifier): Future[types.EmailEmailSettingsResponseSingle] {.async.} =
  ## Disable your Email Routing zone. Also removes additional MX records previously
  ## required for Email Routing to work.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/email/routing/disable")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailEmailSettingsResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdEmailRoutingDns*(client: CloudflareClient,
                                    zoneId: types.EmailIdentifier,
                                    subdomain: types.EmailEmailSettingName = default(types.EmailEmailSettingName)): Future[types.EmailDnsSettingsResponseCollection] {.async.} =
  ## Show the DNS records needed to configure your Email Routing zone.

  var q = initOrderedTable[string, string]()
  q["subdomain"] = $subdomain
  let res = await client.httpGET(fmt"/zones/{zoneId}/email/routing/dns", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailDnsSettingsResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdEmailRoutingDns*(client: CloudflareClient,
                                     zoneId: types.EmailIdentifier,
                                     body: types.EmailEmailSettingDnsRequestBody): Future[types.EmailEmailSettingsResponseSingle] {.async.} =
  ## Enable you Email Routing zone. Add and lock the necessary MX and SPF records.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/email/routing/dns", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailEmailSettingsResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdEmailRoutingDns*(client: CloudflareClient,
                                       zoneId: types.EmailIdentifier,
                                       body: types.EmailEmailSettingDnsRequestBody): Future[types.EmailEmailSettingsResponseSingle] {.async.} =
  ## Disable your Email Routing zone. Also removes additional MX records previously
  ## required for Email Routing to work.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/email/routing/dns", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailEmailSettingsResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdEmailRoutingDns*(client: CloudflareClient,
                                      zoneId: types.EmailIdentifier,
                                      body: types.EmailEmailSettingDnsRequestBody): Future[types.EmailEmailSettingsResponseSingle] {.async.} =
  ## Unlock MX Records previously locked by Email Routing.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/email/routing/dns", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailEmailSettingsResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdEmailRoutingEnable*(client: CloudflareClient,
                                        zoneId: types.EmailIdentifier): Future[types.EmailEmailSettingsResponseSingle] {.async.} =
  ## Enable you Email Routing zone. Add and lock the necessary MX and SPF records.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/email/routing/enable")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailEmailSettingsResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdEmailRoutingUnlock*(client: CloudflareClient,
                                        zoneId: types.EmailIdentifier,
                                        body: types.EmailEmailSettingDnsRequestBody): Future[types.EmailEmailSettingsResponseSingle] {.async.} =
  ## Unlock MX records previously locked by Email Routing. Deprecated - use PATCH
  ## /zones/{zone_id}/email/routing/dns instead.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/email/routing/unlock", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailEmailSettingsResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
