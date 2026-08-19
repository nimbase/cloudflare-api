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
  PutZonesZoneIdHostnamesSettingsSettingIdHostnameRequest = object
    value: types.TlsCertificatesAndHostnamesValue

proc getZonesZoneIdHostnamesSettingsSettingId*(client: CloudflareClient,
                                               zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                               settingId: types.TlsCertificatesAndHostnamesSettingId): Future[types.TlsCertificatesAndHostnamesPerHostnameSettingsResponseCollection] {.async.} =
  ## List the requested TLS setting for the hostnames under this zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/hostnames/settings/{settingId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesPerHostnameSettingsResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdHostnamesSettingsSettingIdHostname*(client: CloudflareClient,
                                                       zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                                       settingId: types.TlsCertificatesAndHostnamesSettingId,
                                                       hostname: types.TlsCertificatesAndHostnamesHostname3): Future[types.TlsCertificatesAndHostnamesPerHostnameSettingsResponse] {.async.} =
  ## Get the requested TLS setting for the hostname.

  let res = await client.httpGET(fmt"/zones/{zoneId}/hostnames/settings/{settingId}/{hostname}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesPerHostnameSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdHostnamesSettingsSettingIdHostname*(client: CloudflareClient,
                                                       zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                                       settingId: types.TlsCertificatesAndHostnamesSettingId,
                                                       hostname: types.TlsCertificatesAndHostnamesHostname3,
                                                       body: PutZonesZoneIdHostnamesSettingsSettingIdHostnameRequest): Future[types.TlsCertificatesAndHostnamesPerHostnameSettingsResponse] {.async.} =
  ## Update the tls setting value for the hostname.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/hostnames/settings/{settingId}/{hostname}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesPerHostnameSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdHostnamesSettingsSettingIdHostname*(client: CloudflareClient,
                                                          zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                                          settingId: types.TlsCertificatesAndHostnamesSettingId,
                                                          hostname: types.TlsCertificatesAndHostnamesHostname3): Future[types.TlsCertificatesAndHostnamesPerHostnameSettingsResponseDelete] {.async.} =
  ## Delete the tls setting value for the hostname.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/hostnames/settings/{settingId}/{hostname}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesPerHostnameSettingsResponseDelete)
  else:
    raise newException(CloudflareClientError, body)
