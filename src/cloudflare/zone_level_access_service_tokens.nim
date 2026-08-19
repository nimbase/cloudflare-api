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
  PostZonesZoneIdAccessServiceTokensRequest = object
    client_secret_version: Option[types.AccessClientSecretVersion]
    duration: Option[types.AccessDuration2]
    enabled: Option[types.AccessEnabled]
    name: types.AccessName17
    previous_client_secret_expires_at: Option[types.AccessPreviousClientSecretExpiresAt]
  PutZonesZoneIdAccessServiceTokensServiceTokenIdRequest = object
    client_secret_version: Option[types.AccessClientSecretVersion]
    duration: Option[types.AccessDuration2]
    enabled: Option[types.AccessEnabled]
    name: Option[types.AccessName17]
    previous_client_secret_expires_at: Option[types.AccessPreviousClientSecretExpiresAt]

proc getZonesZoneIdAccessServiceTokens*(client: CloudflareClient,
                                        zoneId: types.AccessIdentifier): Future[types.AccessResponseCollection19] {.async.} =
  ## Lists all service tokens.

  let res = await client.httpGET(fmt"/zones/{zoneId}/access/service_tokens")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection19)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdAccessServiceTokens*(client: CloudflareClient,
                                         zoneId: types.AccessIdentifier,
                                         body: PostZonesZoneIdAccessServiceTokensRequest): Future[types.AccessCreateResponse2] {.async.} =
  ## Generates a new service token. **Note:** This is the only time you can get the
  ## Client Secret. If you lose the Client Secret, you will have to create a new
  ## service token.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/access/service_tokens", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AccessCreateResponse2)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdAccessServiceTokensServiceTokenId*(client: CloudflareClient,
                                                      serviceTokenId: types.AccessUuid,
                                                      zoneId: types.AccessIdentifier): Future[types.AccessSingleResponse18] {.async.} =
  ## Fetches a single service token.

  let res = await client.httpGET(fmt"/zones/{zoneId}/access/service_tokens/{serviceTokenId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse18)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdAccessServiceTokensServiceTokenId*(client: CloudflareClient,
                                                      serviceTokenId: types.AccessUuid,
                                                      zoneId: types.AccessIdentifier,
                                                      body: PutZonesZoneIdAccessServiceTokensServiceTokenIdRequest): Future[types.AccessSingleResponse18] {.async.} =
  ## Updates a configured service token.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/access/service_tokens/{serviceTokenId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse18)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdAccessServiceTokensServiceTokenId*(client: CloudflareClient,
                                                         serviceTokenId: types.AccessUuid,
                                                         zoneId: types.AccessIdentifier): Future[types.AccessSingleResponse18] {.async.} =
  ## Deletes a service token.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/access/service_tokens/{serviceTokenId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse18)
  else:
    raise newException(CloudflareClientError, body)
