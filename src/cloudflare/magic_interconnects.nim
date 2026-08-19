# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdMagicCfInterconnects*(client: CloudflareClient,
                                               accountId: types.MagicIdentifier): Future[types.MagicComponentsSchemasTunnelsCollectionResponse] {.async.} =
  ## Lists interconnects associated with an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/cf_interconnects")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicComponentsSchemasTunnelsCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMagicCfInterconnects*(client: CloudflareClient,
                                               accountId: types.MagicIdentifier): Future[types.MagicComponentsSchemasModifiedTunnelsCollectionResponse] {.async.} =
  ## Updates multiple interconnects associated with an account. Use
  ## `?validate_only=true` as an optional query parameter to only run validation
  ## without persisting changes.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/magic/cf_interconnects", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicComponentsSchemasModifiedTunnelsCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicCfInterconnectsCfInterconnectId*(client: CloudflareClient,
                                                               cfInterconnectId: types.MagicIdentifier,
                                                               accountId: types.MagicIdentifier): Future[types.MagicComponentsSchemasTunnelSingleResponse] {.async.} =
  ## Lists details for a specific interconnect.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/cf_interconnects/{cfInterconnectId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicComponentsSchemasTunnelSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMagicCfInterconnectsCfInterconnectId*(client: CloudflareClient,
                                                               cfInterconnectId: types.MagicIdentifier,
                                                               accountId: types.MagicIdentifier,
                                                               body: types.MagicInterconnectTunnelUpdateRequest): Future[types.MagicComponentsSchemasTunnelModifiedResponse] {.async.} =
  ## Updates a specific interconnect associated with an account. Use
  ## `?validate_only=true` as an optional query parameter to only run validation
  ## without persisting changes.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/magic/cf_interconnects/{cfInterconnectId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicComponentsSchemasTunnelModifiedResponse)
  else:
    raise newException(CloudflareClientError, body)
