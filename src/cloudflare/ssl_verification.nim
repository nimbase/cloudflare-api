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
  SslVerificationRetryOption* = enum
    retryTrue = "true"


proc getZonesZoneIdSslVerification*(client: CloudflareClient,
                                    zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                    retry: set[SslVerificationRetryOption] = {}): Future[types.TlsCertificatesAndHostnamesSslVerificationResponseCollection] {.async.} =
  ## Get SSL Verification Info for a Zone.

  var q = initOrderedTable[string, string]()
  for v in retry: q["retry"] = $v
  let res = await client.httpGET(fmt"/zones/{zoneId}/ssl/verification", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesSslVerificationResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSslVerificationCertificatePackId*(client: CloudflareClient,
                                                       certificatePackId: types.TlsCertificatesAndHostnamesCertPackUuid,
                                                       zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                                       body: types.TlsCertificatesAndHostnamesValidationMethod3): Future[types.TlsCertificatesAndHostnamesSslValidationMethodResponseCollection] {.async.} =
  ## Edit SSL validation method for a certificate pack. A PATCH request will request
  ## an immediate validation check on any certificate, and return the updated status.
  ## If a validation method is provided, the validation will be immediately attempted
  ## using that method.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/ssl/verification/{certificatePackId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesSslValidationMethodResponseCollection)
  else:
    raise newException(CloudflareClientError, body)
