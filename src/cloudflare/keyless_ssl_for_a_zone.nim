# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options]
import ./private/metaclient
import ./private/types

type
  PostZonesZoneIdKeylessCertificatesRequest = object
    bundle_method: Option[types.TlsCertificatesAndHostnamesBundleMethod]
    certificate: types.TlsCertificatesAndHostnamesCertificate2
    host: types.TlsCertificatesAndHostnamesHost
    name: Option[types.TlsCertificatesAndHostnamesNameWrite]
    port: types.TlsCertificatesAndHostnamesPort
    tunnel: Option[types.TlsCertificatesAndHostnamesKeylessTunnel]
  PatchZonesZoneIdKeylessCertificatesKeylessCertificateIdRequest = object
    enabled: Option[types.TlsCertificatesAndHostnamesEnabledWrite]
    host: Option[types.TlsCertificatesAndHostnamesHost]
    name: Option[types.TlsCertificatesAndHostnamesNameWrite]
    port: Option[types.TlsCertificatesAndHostnamesPort]
    tunnel: Option[types.TlsCertificatesAndHostnamesKeylessTunnel]

proc getZonesZoneIdKeylessCertificates*(client: CloudflareClient,
                                        zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesKeylessResponseCollection] {.async.} =
  ## List all Keyless SSL configurations for a given zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/keyless_certificates")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesKeylessResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdKeylessCertificates*(client: CloudflareClient,
                                         zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                         body: PostZonesZoneIdKeylessCertificatesRequest): Future[types.TlsCertificatesAndHostnamesKeylessResponseSingle] {.async.} =
  ## Creates a Keyless SSL configuration that allows SSL/TLS termination without
  ## exposing private keys to Cloudflare. Keys remain on your infrastructure.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/keyless_certificates", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesKeylessResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdKeylessCertificatesKeylessCertificateId*(client: CloudflareClient,
                                                            keylessCertificateId: types.TlsCertificatesAndHostnamesIdentifier,
                                                            zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesKeylessResponseSingle] {.async.} =
  ## Get details for one Keyless SSL configuration.

  let res = await client.httpGET(fmt"/zones/{zoneId}/keyless_certificates/{keylessCertificateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesKeylessResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdKeylessCertificatesKeylessCertificateId*(client: CloudflareClient,
                                                               keylessCertificateId: types.TlsCertificatesAndHostnamesIdentifier,
                                                               zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesKeylessResponseSingleId] {.async.} =
  ## Removes a Keyless SSL configuration. SSL connections will no longer use the
  ## keyless server for cryptographic operations.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/keyless_certificates/{keylessCertificateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesKeylessResponseSingleId)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdKeylessCertificatesKeylessCertificateId*(client: CloudflareClient,
                                                              keylessCertificateId: types.TlsCertificatesAndHostnamesIdentifier,
                                                              zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                                              body: PatchZonesZoneIdKeylessCertificatesKeylessCertificateIdRequest): Future[types.TlsCertificatesAndHostnamesKeylessResponseSingle] {.async.} =
  ## This will update attributes of a Keyless SSL. Consists of one or more of the
  ## following:  host,name,port.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/keyless_certificates/{keylessCertificateId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesKeylessResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
