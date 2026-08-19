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
  PostAccountsAccountIdDevicesPostureIntegrationRequest = object
    config: types.TeamsDevicesConfigRequest
    interval: types.TeamsDevicesInterval
    name: types.TeamsDevicesComponentsSchemasName
    `type`: types.TeamsDevicesSchemasType
  PatchAccountsAccountIdDevicesPostureIntegrationIntegrationIdRequest = object
    config: Option[types.TeamsDevicesConfigRequest]
    interval: Option[types.TeamsDevicesInterval]
    name: Option[types.TeamsDevicesComponentsSchemasName]
    `type`: Option[types.TeamsDevicesSchemasType]

proc getAccountsAccountIdDevicesPostureIntegration*(client: CloudflareClient,
                                                    accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesSchemasResponseCollection] {.async.} =
  ## Fetches the list of device posture integrations for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/posture/integration")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesSchemasResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDevicesPostureIntegration*(client: CloudflareClient,
                                                     accountId: types.TeamsDevicesIdentifier,
                                                     body: PostAccountsAccountIdDevicesPostureIntegrationRequest): Future[types.TeamsDevicesSchemasSingleResponse] {.async.} =
  ## Create a new device posture integration.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/devices/posture/integration", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesSchemasSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDevicesPostureIntegrationIntegrationId*(client: CloudflareClient,
                                                                 integrationId: types.TeamsDevicesUuid,
                                                                 accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesSchemasSingleResponse] {.async.} =
  ## Fetches details for a single device posture integration.

  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/posture/integration/{integrationId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesSchemasSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDevicesPostureIntegrationIntegrationId*(client: CloudflareClient,
                                                                    integrationId: types.TeamsDevicesUuid,
                                                                    accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesSchemasIdResponse] {.async.} =
  ## Delete a configured device posture integration.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/devices/posture/integration/{integrationId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesSchemasIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdDevicesPostureIntegrationIntegrationId*(client: CloudflareClient,
                                                                   integrationId: types.TeamsDevicesUuid,
                                                                   accountId: types.TeamsDevicesIdentifier,
                                                                   body: PatchAccountsAccountIdDevicesPostureIntegrationIntegrationIdRequest): Future[types.TeamsDevicesSchemasSingleResponse] {.async.} =
  ## Updates a configured device posture integration.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/devices/posture/integration/{integrationId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesSchemasSingleResponse)
  else:
    raise newException(CloudflareClientError, body)
