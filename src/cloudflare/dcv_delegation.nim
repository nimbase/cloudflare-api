# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdDcvDelegationUuid*(client: CloudflareClient,
                                      zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesDcvDelegationResponse] {.async.} =
  ## Retrieve the account and zone specific unique identifier used as part of the
  ## CNAME target for DCV Delegation.

  let res = await client.httpGET(fmt"/zones/{zoneId}/dcv_delegation/uuid")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesDcvDelegationResponse)
  else:
    raise newException(CloudflareClientError, body)
