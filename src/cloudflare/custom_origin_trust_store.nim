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
  PostZonesZoneIdAcmCustomTrustStoreRequest = object
    certificate: types.TlsCertificatesAndHostnamesCertificate3

proc getZonesZoneIdAcmCustomTrustStore*(client: CloudflareClient,
                                        zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                        page: float64 = default(float64),
                                        perPage: float64 = default(float64),
                                        limit: int64 = default(int64),
                                        offset: int64 = default(int64)): Future[types.TlsCertificatesAndHostnamesCustomTrustStoreResponseCollection] {.async.} =
  ## Get Custom Origin Trust Store for a Zone.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["limit"] = $limit
  q["offset"] = $offset
  let res = await client.httpGET(fmt"/zones/{zoneId}/acm/custom_trust_store", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCustomTrustStoreResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdAcmCustomTrustStore*(client: CloudflareClient,
                                         zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                         body: PostZonesZoneIdAcmCustomTrustStoreRequest): Future[types.TlsCertificatesAndHostnamesCustomTrustStoreResponseSingle] {.async.} =
  ## Upload a root CA certificate to the Custom Origin Trust Store for a Zone. Only
  ## root CA certificates are accepted.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/acm/custom_trust_store", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCustomTrustStoreResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdAcmCustomTrustStoreCustomOriginTrustStoreId*(client: CloudflareClient,
                                                                customOriginTrustStoreId: types.TlsCertificatesAndHostnamesIdentifier,
                                                                zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesCustomTrustStoreResponseSingle] {.async.} =
  ## Retrieves details about a specific root CA certificate in the custom origin
  ## trust store, including expiration and subject information.

  let res = await client.httpGET(fmt"/zones/{zoneId}/acm/custom_trust_store/{customOriginTrustStoreId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCustomTrustStoreResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdAcmCustomTrustStoreCustomOriginTrustStoreId*(client: CloudflareClient,
                                                                   customOriginTrustStoreId: types.TlsCertificatesAndHostnamesIdentifier,
                                                                   zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesCustomTrustStoreResponseIdOnly] {.async.} =
  ## Removes a root CA certificate from the custom origin trust store. Origins using
  ## certificates signed by this CA will no longer be trusted.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/acm/custom_trust_store/{customOriginTrustStoreId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCustomTrustStoreResponseIdOnly)
  else:
    raise newException(CloudflareClientError, body)
