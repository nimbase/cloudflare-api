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
  PostAccountsAccountIdGatewayLocationsRequest = object
    client_default: Option[types.ZeroTrustGatewayClientDefault]
    dns_destination_ips_id: Option[types.ZeroTrustGatewayDnsDestinationIpsIdWrite]
    ecs_support: Option[types.ZeroTrustGatewayEcsSupport]
    endpoints: Option[types.ZeroTrustGatewayEndpoints]
    max_ttl: Option[types.ZeroTrustGatewayMaxTtl]
    name: types.ZeroTrustGatewayName2
    networks: Option[types.ZeroTrustGatewayIpv4Networks]
  PutAccountsAccountIdGatewayLocationsLocationIdRequest = object
    client_default: Option[types.ZeroTrustGatewayClientDefault]
    dns_destination_ips_id: Option[types.ZeroTrustGatewayDnsDestinationIpsIdWrite]
    ecs_support: Option[types.ZeroTrustGatewayEcsSupport]
    endpoints: Option[types.ZeroTrustGatewayEndpoints]
    max_ttl: Option[types.ZeroTrustGatewayMaxTtl]
    name: types.ZeroTrustGatewayName2
    networks: Option[types.ZeroTrustGatewayIpv4Networks]

proc getAccountsAccountIdGatewayLocations*(client: CloudflareClient,
                                           accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewayResponseCollection5] {.async.} =
  ## List Zero Trust Gateway locations for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway/locations")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayResponseCollection5)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdGatewayLocations*(client: CloudflareClient,
                                            accountId: types.ZeroTrustGatewayIdentifier2,
                                            body: PostAccountsAccountIdGatewayLocationsRequest): Future[types.ZeroTrustGatewaySingleResponse3] {.async.} =
  ## Create a new Zero Trust Gateway location.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/gateway/locations", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewaySingleResponse3)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdGatewayLocationsLocationId*(client: CloudflareClient,
                                                     locationId: types.ZeroTrustGatewayUuid3,
                                                     accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewaySingleResponse3] {.async.} =
  ## Get a single Zero Trust Gateway location.

  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway/locations/{locationId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewaySingleResponse3)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdGatewayLocationsLocationId*(client: CloudflareClient,
                                                     locationId: types.ZeroTrustGatewayUuid3,
                                                     accountId: types.ZeroTrustGatewayIdentifier2,
                                                     body: PutAccountsAccountIdGatewayLocationsLocationIdRequest): Future[types.ZeroTrustGatewaySingleResponse3] {.async.} =
  ## Update a configured Zero Trust Gateway location.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/gateway/locations/{locationId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewaySingleResponse3)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdGatewayLocationsLocationId*(client: CloudflareClient,
                                                        locationId: types.ZeroTrustGatewayUuid3,
                                                        accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewayEmptyResponse] {.async.} =
  ## Delete a configured Zero Trust Gateway location.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/gateway/locations/{locationId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayEmptyResponse)
  else:
    raise newException(CloudflareClientError, body)
