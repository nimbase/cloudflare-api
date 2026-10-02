# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdAccessGatewayCa*(client: CloudflareClient,
                                          accountId: types.AccessIdentifier): Future[types.AccessResponseCollection7] {.async.} =
  ## Lists SSH Certificate Authorities (CA).

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/gateway_ca")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection7)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessGatewayCa*(client: CloudflareClient,
                                           accountId: types.AccessIdentifier): Future[types.AccessSingleResponse8] {.async.} =
  ## Adds a new SSH Certificate Authority (CA).

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/gateway_ca")
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AccessSingleResponse8)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAccessGatewayCaCertificateId*(client: CloudflareClient,
                                                          certificateId: types.AccessUuid,
                                                          accountId: types.AccessIdentifier): Future[types.AccessIdResponse] {.async.} =
  ## Deletes an SSH Certificate Authority.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/access/gateway_ca/{certificateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessIdResponse)
  else:
    raise newException(CloudflareClientError, body)
