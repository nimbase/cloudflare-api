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
  PostZonesZoneIdAccessCertificatesRequest = object
    associated_hostnames: Option[types.AccessAssociatedHostnames2]
    certificate: string
    name: types.AccessName18
  PutZonesZoneIdAccessCertificatesSettingsRequest = object
    settings: seq[types.AccessSettings2]
  PutZonesZoneIdAccessCertificatesCertificateIdRequest = object
    associated_hostnames: types.AccessAssociatedHostnames2
    name: Option[types.AccessName18]

proc getZonesZoneIdAccessCertificates*(client: CloudflareClient,
                                       zoneId: types.AccessIdentifier): Future[types.AccessResponseCollection21] {.async.} =
  ## Lists all mTLS certificates.

  let res = await client.httpGET(fmt"/zones/{zoneId}/access/certificates")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection21)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdAccessCertificates*(client: CloudflareClient,
                                        zoneId: types.AccessIdentifier,
                                        body: PostZonesZoneIdAccessCertificatesRequest): Future[types.AccessSingleResponse20] {.async.} =
  ## Adds a new mTLS root certificate to Access.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/access/certificates", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AccessSingleResponse20)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdAccessCertificatesSettings*(client: CloudflareClient,
                                               zoneId: types.AccessIdentifier): Future[types.AccessResponseCollectionHostnames2] {.async.} =
  ## List all mTLS hostname settings for this zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/access/certificates/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollectionHostnames2)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdAccessCertificatesSettings*(client: CloudflareClient,
                                               zoneId: types.AccessIdentifier,
                                               body: PutZonesZoneIdAccessCertificatesSettingsRequest): Future[types.AccessResponseCollectionHostnames2] {.async.} =
  ## Updates an mTLS certificate's hostname settings.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/access/certificates/settings", body)
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.AccessResponseCollectionHostnames2)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdAccessCertificatesCertificateId*(client: CloudflareClient,
                                                    certificateId: types.AccessUuid,
                                                    zoneId: types.AccessIdentifier): Future[types.AccessSingleResponse20] {.async.} =
  ## Fetches a single mTLS certificate.

  let res = await client.httpGET(fmt"/zones/{zoneId}/access/certificates/{certificateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse20)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdAccessCertificatesCertificateId*(client: CloudflareClient,
                                                    certificateId: types.AccessUuid,
                                                    zoneId: types.AccessIdentifier,
                                                    body: PutZonesZoneIdAccessCertificatesCertificateIdRequest): Future[types.AccessSingleResponse20] {.async.} =
  ## Updates a configured mTLS certificate.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/access/certificates/{certificateId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse20)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdAccessCertificatesCertificateId*(client: CloudflareClient,
                                                       certificateId: types.AccessUuid,
                                                       zoneId: types.AccessIdentifier): Future[types.AccessIdResponse3] {.async.} =
  ## Deletes an mTLS certificate.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/access/certificates/{certificateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessIdResponse3)
  else:
    raise newException(CloudflareClientError, body)
