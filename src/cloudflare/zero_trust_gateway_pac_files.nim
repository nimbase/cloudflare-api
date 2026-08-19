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
  PostAccountsAccountIdGatewayPacfilesRequest = object
    contents: types.ZeroTrustGatewayContents
    description: Option[types.ZeroTrustGatewayDescription4]
    name: types.ZeroTrustGatewayName7
    slug: Option[string]
  PutAccountsAccountIdGatewayPacfilesPacfileIdRequest = object
    contents: types.ZeroTrustGatewayContents
    description: types.ZeroTrustGatewayDescription4
    name: types.ZeroTrustGatewayName7

proc getAccountsAccountIdGatewayPacfiles*(client: CloudflareClient,
                                          accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewayResponseCollection10] {.async.} =
  ## List all Zero Trust Gateway PAC files for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway/pacfiles")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayResponseCollection10)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdGatewayPacfiles*(client: CloudflareClient,
                                           accountId: types.ZeroTrustGatewayIdentifier2,
                                           body: PostAccountsAccountIdGatewayPacfilesRequest): Future[types.ZeroTrustGatewaySingleResponse7] {.async.} =
  ## Create a new Zero Trust Gateway PAC file.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/gateway/pacfiles", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewaySingleResponse7)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdGatewayPacfilesPacfileId*(client: CloudflareClient,
                                                   pacfileId: types.ZeroTrustGatewayUuid3,
                                                   accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewaySingleResponse7] {.async.} =
  ## Get a single Zero Trust Gateway PAC file.

  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway/pacfiles/{pacfileId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewaySingleResponse7)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdGatewayPacfilesPacfileId*(client: CloudflareClient,
                                                   pacfileId: types.ZeroTrustGatewayUuid3,
                                                   accountId: types.ZeroTrustGatewayIdentifier2,
                                                   body: PutAccountsAccountIdGatewayPacfilesPacfileIdRequest): Future[types.ZeroTrustGatewaySingleResponse7] {.async.} =
  ## Update a configured Zero Trust Gateway PAC file.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/gateway/pacfiles/{pacfileId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewaySingleResponse7)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdGatewayPacfilesPacfileId*(client: CloudflareClient,
                                                      pacfileId: types.ZeroTrustGatewayUuid3,
                                                      accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewayEmptyResponse] {.async.} =
  ## Delete a configured Zero Trust Gateway PAC file.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/gateway/pacfiles/{pacfileId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayEmptyResponse)
  else:
    raise newException(CloudflareClientError, body)
