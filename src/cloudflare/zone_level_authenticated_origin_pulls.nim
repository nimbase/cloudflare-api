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
  PostZonesZoneIdOriginTlsClientAuthRequest = object
    certificate: types.TlsCertificatesAndHostnamesCertificate5
    private_key: types.TlsCertificatesAndHostnamesPrivateKey2
  PutZonesZoneIdOriginTlsClientAuthSettingsRequest = object
    enabled: types.TlsCertificatesAndHostnamesEnabled4

proc getZonesZoneIdOriginTlsClientAuth*(client: CloudflareClient,
                                        zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesCertificateResponseCollection3] {.async.} =
  ## Lists all client certificates configured for zone-level authenticated origin
  ## pulls.

  let res = await client.httpGET(fmt"/zones/{zoneId}/origin_tls_client_auth")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificateResponseCollection3)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdOriginTlsClientAuth*(client: CloudflareClient,
                                         zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                         body: PostZonesZoneIdOriginTlsClientAuthRequest): Future[types.TlsCertificatesAndHostnamesCertificateResponseSingle3] {.async.} =
  ## Upload your own certificate you want Cloudflare to use for edge-to-origin
  ## communication to override the shared certificate. Please note that it is
  ## important to keep only one certificate active. Also, make sure to enable
  ## zone-level authenticated origin pulls by making a PUT call to settings endpoint
  ## to see the uploaded certificate in use.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/origin_tls_client_auth", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificateResponseSingle3)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdOriginTlsClientAuthSettings*(client: CloudflareClient,
                                                zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesEnabledResponse] {.async.} =
  ## Get whether zone-level authenticated origin pulls is enabled or not. It is false
  ## by default.

  let res = await client.httpGET(fmt"/zones/{zoneId}/origin_tls_client_auth/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesEnabledResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdOriginTlsClientAuthSettings*(client: CloudflareClient,
                                                zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                                body: PutZonesZoneIdOriginTlsClientAuthSettingsRequest): Future[types.TlsCertificatesAndHostnamesEnabledResponse] {.async.} =
  ## Enable or disable zone-level authenticated origin pulls. 'enabled' should be set
  ## true either before/after the certificate is uploaded to see the certificate in
  ## use.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/origin_tls_client_auth/settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesEnabledResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdOriginTlsClientAuthCertificateId*(client: CloudflareClient,
                                                     certificateId: types.TlsCertificatesAndHostnamesIdentifier,
                                                     zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesCertificateResponseSingle3] {.async.} =
  ## Retrieves details for a specific client certificate used in zone-level
  ## authenticated origin pulls.

  let res = await client.httpGET(fmt"/zones/{zoneId}/origin_tls_client_auth/{certificateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificateResponseSingle3)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdOriginTlsClientAuthCertificateId*(client: CloudflareClient,
                                                        certificateId: types.TlsCertificatesAndHostnamesIdentifier,
                                                        zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesCertificateResponseSingle3] {.async.} =
  ## Removes a client certificate used for zone-level authenticated origin pulls.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/origin_tls_client_auth/{certificateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificateResponseSingle3)
  else:
    raise newException(CloudflareClientError, body)
