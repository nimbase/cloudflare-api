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
  PostZonesZoneIdSslAnalyzeRequest = object
    bundle_method: Option[types.TlsCertificatesAndHostnamesBundleMethod]
    certificate: Option[types.TlsCertificatesAndHostnamesCertificate]

proc postZonesZoneIdSslAnalyze*(client: CloudflareClient,
                                zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                body: PostZonesZoneIdSslAnalyzeRequest): Future[types.TlsCertificatesAndHostnamesCertificateAnalyzeResponse] {.async.} =
  ## Returns the set of hostnames, the signature algorithm, and the expiration date
  ## of the certificate.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/ssl/analyze", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificateAnalyzeResponse)
  else:
    raise newException(CloudflareClientError, body)
