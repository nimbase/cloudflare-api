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
  PostAccountsAccountIdDevicesNetworksRequest = object
    config: types.TeamsDevicesSchemasConfigRequest
    name: types.TeamsDevicesDeviceManagedNetworksComponentsSchemasName
    `type`: types.TeamsDevicesComponentsSchemasType
  PutAccountsAccountIdDevicesNetworksNetworkIdRequest = object
    config: Option[types.TeamsDevicesSchemasConfigRequest]
    name: Option[types.TeamsDevicesDeviceManagedNetworksComponentsSchemasName]
    `type`: Option[types.TeamsDevicesComponentsSchemasType]

proc getAccountsAccountIdDevicesNetworks*(client: CloudflareClient,
                                          accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesComponentsSchemasResponseCollection] {.async.} =
  ## Fetches a list of managed networks for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/networks")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesComponentsSchemasResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDevicesNetworks*(client: CloudflareClient,
                                           accountId: types.TeamsDevicesIdentifier,
                                           body: PostAccountsAccountIdDevicesNetworksRequest): Future[types.TeamsDevicesComponentsSchemasSingleResponse] {.async.} =
  ## Creates a new device managed network.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/devices/networks", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesComponentsSchemasSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDevicesNetworksNetworkId*(client: CloudflareClient,
                                                   networkId: types.TeamsDevicesUuid,
                                                   accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesComponentsSchemasSingleResponse] {.async.} =
  ## Fetches details for a single managed network.

  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/networks/{networkId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesComponentsSchemasSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDevicesNetworksNetworkId*(client: CloudflareClient,
                                                   networkId: types.TeamsDevicesUuid,
                                                   accountId: types.TeamsDevicesIdentifier,
                                                   body: PutAccountsAccountIdDevicesNetworksNetworkIdRequest): Future[types.TeamsDevicesComponentsSchemasSingleResponse] {.async.} =
  ## Updates a configured device managed network.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/devices/networks/{networkId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesComponentsSchemasSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDevicesNetworksNetworkId*(client: CloudflareClient,
                                                      networkId: types.TeamsDevicesUuid,
                                                      accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesComponentsSchemasResponseCollection] {.async.} =
  ## Deletes a device managed network and fetches a list of the remaining device
  ## managed networks for an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/devices/networks/{networkId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesComponentsSchemasResponseCollection)
  else:
    raise newException(CloudflareClientError, body)
