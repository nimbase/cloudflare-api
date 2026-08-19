# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdGatewayCertificates*(client: CloudflareClient,
                                              accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewayResponseCollection] {.async.} =
  ## List all Zero Trust certificates for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway/certificates")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdGatewayCertificates*(client: CloudflareClient,
                                               accountId: types.ZeroTrustGatewayIdentifier2,
                                               body: types.ZeroTrustGatewayGenerateCertRequest): Future[types.ZeroTrustGatewaySingleResponse] {.async.} =
  ## Create a new Zero Trust certificate.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/gateway/certificates", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewaySingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdGatewayCertificatesCertificateId*(client: CloudflareClient,
                                                           certificateId: types.ZeroTrustGatewayUuid,
                                                           accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewaySingleResponse] {.async.} =
  ## Get a single Zero Trust certificate.

  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway/certificates/{certificateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewaySingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdGatewayCertificatesCertificateId*(client: CloudflareClient,
                                                              certificateId: types.ZeroTrustGatewayUuid,
                                                              accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewaySingleResponse] {.async.} =
  ## Delete a gateway-managed Zero Trust certificate. You must deactivate the
  ## certificate from the edge (inactive) before deleting it.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/gateway/certificates/{certificateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewaySingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdGatewayCertificatesCertificateIdActivate*(client: CloudflareClient,
                                                                    certificateId: types.ZeroTrustGatewayUuid,
                                                                    accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewaySingleResponse] {.async.} =
  ## Bind a single Zero Trust certificate to the edge.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/gateway/certificates/{certificateId}/activate")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.ZeroTrustGatewaySingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdGatewayCertificatesCertificateIdDeactivate*(client: CloudflareClient,
                                                                      certificateId: types.ZeroTrustGatewayUuid,
                                                                      accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewaySingleResponse] {.async.} =
  ## Unbind a single Zero Trust certificate from the edge.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/gateway/certificates/{certificateId}/deactivate")
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.ZeroTrustGatewaySingleResponse)
  else:
    raise newException(CloudflareClientError, body)
