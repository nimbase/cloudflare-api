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
  PostAccountsAccountIdGatewayProxyEndpointsRequest = object
    kind: Option[string]
  PatchAccountsAccountIdGatewayProxyEndpointsProxyEndpointIdRequest = object
    ips: Option[types.ZeroTrustGatewayIps]
    name: Option[types.ZeroTrustGatewayName6]

proc getAccountsAccountIdGatewayProxyEndpoints*(client: CloudflareClient,
                                                accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewayResponseCollection9] {.async.} =
  ## List all Zero Trust Gateway proxy endpoints for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway/proxy_endpoints")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayResponseCollection9)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdGatewayProxyEndpoints*(client: CloudflareClient,
                                                 accountId: types.ZeroTrustGatewayIdentifier2,
                                                 body: PostAccountsAccountIdGatewayProxyEndpointsRequest): Future[types.ZeroTrustGatewaySingleResponse5] {.async.} =
  ## Create a new Zero Trust Gateway proxy endpoint.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/gateway/proxy_endpoints", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewaySingleResponse5)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdGatewayProxyEndpointsProxyEndpointId*(client: CloudflareClient,
                                                               proxyEndpointId: types.ZeroTrustGatewayUuid3,
                                                               accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewaySingleResponse5] {.async.} =
  ## Get a single Zero Trust Gateway proxy endpoint.

  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway/proxy_endpoints/{proxyEndpointId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewaySingleResponse5)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdGatewayProxyEndpointsProxyEndpointId*(client: CloudflareClient,
                                                                  proxyEndpointId: types.ZeroTrustGatewayUuid3,
                                                                  accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewayEmptyResponse] {.async.} =
  ## Delete a configured Zero Trust Gateway proxy endpoint.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/gateway/proxy_endpoints/{proxyEndpointId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayEmptyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdGatewayProxyEndpointsProxyEndpointId*(client: CloudflareClient,
                                                                 proxyEndpointId: types.ZeroTrustGatewayUuid3,
                                                                 accountId: types.ZeroTrustGatewayIdentifier2,
                                                                 body: PatchAccountsAccountIdGatewayProxyEndpointsProxyEndpointIdRequest): Future[types.ZeroTrustGatewaySingleResponse5] {.async.} =
  ## Update a configured Zero Trust Gateway proxy endpoint.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/gateway/proxy_endpoints/{proxyEndpointId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewaySingleResponse5)
  else:
    raise newException(CloudflareClientError, body)
