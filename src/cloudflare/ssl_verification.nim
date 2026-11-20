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
                                    retry: SslVerificationRetryOption = retryTrue): Future[types.TlsCertificatesAndHostnamesSslVerificationResponseCollection] {.async.} =
  ## Get SSL Verification Info for a Zone.

  var q = initOrderedTable[string, string]()
  q["retry"] = $retry
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
  ## Update the configured SSL validation method for a Universal SSL certificate
  ## pack, or request another validation attempt for a pack in pending_validation.
  ## This endpoint does not change the validation method for advanced certificates.
  ## For an active certificate pack, a method-only update saves the method without
  ## rerunning validation or replacing the active certificate. For a pack pending
  ## validation, changing the method initializes validation using the requested
  ## method. Cloudflare may select a different method during automatic renewal.
  ## Omit validation_method, send an empty JSON object, or omit the request body to
  ## use the current or default method. For a pack in pending_validation, keeping the
  ## current method requests another validation attempt. Cloudflare may queue this
  ## attempt rather than complete validation before returning. For an active pack, an
  ## empty JSON object or a request without a body does not rerun DCV. The response
  ## returns the current status and does not guarantee that validation has completed.
  ## Available methods depend on the DNS setup and certificate authority. For Google
  ## Trust Services, Let's Encrypt, and SSL.com, full DNS setups support txt only,
  ## while partial DNS setups support txt or http. HTTP validation does not support
  ## wildcard certificates. This endpoint allows four PATCH requests per zone per 60
  ## seconds.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/ssl/verification/{certificatePackId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesSslValidationMethodResponseCollection)
  else:
    raise newException(CloudflareClientError, body)
