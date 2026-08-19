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
  PostAccountsAccountIdDevicesPostureRequest = object
    description: Option[types.TeamsDevicesDescription]
    expiration: Option[types.TeamsDevicesExpiration]
    input: Option[types.TeamsDevicesInput]
    match: Option[types.TeamsDevicesMatch]
    name: types.TeamsDevicesName
    schedule: Option[types.TeamsDevicesSchedule]
    `type`: types.TeamsDevicesType
  PutAccountsAccountIdDevicesPostureRuleIdRequest = object
    description: Option[types.TeamsDevicesDescription]
    expiration: Option[types.TeamsDevicesExpiration]
    input: Option[types.TeamsDevicesInput]
    match: Option[types.TeamsDevicesMatch]
    name: types.TeamsDevicesName
    schedule: Option[types.TeamsDevicesSchedule]
    `type`: types.TeamsDevicesType

proc getAccountsAccountIdDevicesPosture*(client: CloudflareClient,
                                         accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesResponseCollection] {.async.} =
  ## Fetches device posture rules for a Zero Trust account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/posture")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDevicesPosture*(client: CloudflareClient,
                                          accountId: types.TeamsDevicesIdentifier,
                                          body: PostAccountsAccountIdDevicesPostureRequest): Future[types.TeamsDevicesSingleResponse] {.async.} =
  ## Creates a new device posture rule.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/devices/posture", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDevicesPostureRuleId*(client: CloudflareClient,
                                               ruleId: types.TeamsDevicesUuid,
                                               accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesSingleResponse] {.async.} =
  ## Fetches a single device posture rule.

  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/posture/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDevicesPostureRuleId*(client: CloudflareClient,
                                               ruleId: types.TeamsDevicesUuid,
                                               accountId: types.TeamsDevicesIdentifier,
                                               body: PutAccountsAccountIdDevicesPostureRuleIdRequest): Future[types.TeamsDevicesSingleResponse] {.async.} =
  ## Updates a device posture rule.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/devices/posture/{ruleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDevicesPostureRuleId*(client: CloudflareClient,
                                                  ruleId: types.TeamsDevicesUuid,
                                                  accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesIdResponse] {.async.} =
  ## Deletes a device posture rule.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/devices/posture/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesIdResponse)
  else:
    raise newException(CloudflareClientError, body)
