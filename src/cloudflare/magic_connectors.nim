# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types

type
  MagicConnectorDeviceTypeOption* = enum
    deviceTypeMANAGED = "MANAGED"
    deviceTypeLICENSED = "LICENSED"


proc getAccountsAccountIdMagicConnectors*(client: CloudflareClient,
                                          accountId: types.MconnAccountId,
                                          deviceType: MagicConnectorDeviceTypeOption): Future[types.MconnCustomerConnectorsListResponse] {.async.} =
  ## Lists Magic WAN Connectors.

  var q = initOrderedTable[string, string]()
  q["device_type"] = $deviceType
  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/connectors", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MconnCustomerConnectorsListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicConnectors*(client: CloudflareClient,
                                           accountId: types.MconnAccountId,
                                           body: types.MconnCustomerConnectorsCreateRequest): Future[types.MconnCustomerConnectorsCreateResponse] {.async.} =
  ## Creates a Magic WAN Connector.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/connectors", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MconnCustomerConnectorsCreateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicConnectorsConnectorId*(client: CloudflareClient,
                                                     accountId: types.MconnAccountId,
                                                     connectorId: types.MconnUuid): Future[types.MconnCustomerConnectorsGetResponse] {.async.} =
  ## Gets a Magic WAN Connector.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/connectors/{connectorId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MconnCustomerConnectorsGetResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMagicConnectorsConnectorId*(client: CloudflareClient,
                                                     accountId: types.MconnAccountId,
                                                     connectorId: types.MconnUuid,
                                                     body: types.MconnCustomerConnectorsUpdateRequest): Future[types.MconnCustomerConnectorsUpdateResponse] {.async.} =
  ## Updates properties of a Magic WAN Connector. May be used to re-provision a
  ## license key.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/magic/connectors/{connectorId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MconnCustomerConnectorsUpdateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicConnectorsConnectorId*(client: CloudflareClient,
                                                        accountId: types.MconnAccountId,
                                                        connectorId: types.MconnUuid): Future[types.MconnCustomerConnectorsDeleteResponse] {.async.} =
  ## Deletes a Magic WAN Connector.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/connectors/{connectorId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MconnCustomerConnectorsDeleteResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicConnectorsConnectorId*(client: CloudflareClient,
                                                       accountId: types.MconnAccountId,
                                                       connectorId: types.MconnUuid,
                                                       body: types.MconnCustomerConnectorsEditRequest): Future[types.MconnCustomerConnectorsEditResponse] {.async.} =
  ## Edits properties of a Magic WAN Connector. May be used to re-provision a license
  ## key.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/connectors/{connectorId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MconnCustomerConnectorsEditResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicConnectorsConnectorIdInterrupts*(client: CloudflareClient,
                                                               accountId: types.MconnAccountId,
                                                               connectorId: types.MconnUuid): Future[types.MconnConnectorInterruptsListResponse] {.async.} =
  ## Lists interrupts for a Magic WAN Connector.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/connectors/{connectorId}/interrupts")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MconnConnectorInterruptsListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicConnectorsConnectorIdInterrupts*(client: CloudflareClient,
                                                                accountId: types.MconnAccountId,
                                                                connectorId: types.MconnUuid,
                                                                body: types.MconnInterrupt): Future[types.MconnConnectorInterruptsCreateResponse] {.async.} =
  ## Creates an interrupt for a Magic WAN Connector.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/connectors/{connectorId}/interrupts", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MconnConnectorInterruptsCreateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicConnectorsConnectorIdTelemetryEvents*(client: CloudflareClient,
                                                                    accountId: types.MconnAccountId,
                                                                    connectorId: string,
                                                                    `from`: float64,
                                                                    to: float64,
                                                                    limit: float64 = default(float64),
                                                                    cursor: string = default(string),
                                                                    k: string = default(string)): Future[types.MconnCustomerEventsListSuccess] {.async.} =
  ## Lists Magic WAN Connector Telemetry Events

  var q = initOrderedTable[string, string]()
  q["from"] = $`from`
  q["to"] = $to
  q["limit"] = $limit
  q["cursor"] = $cursor
  q["k"] = $k
  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/connectors/{connectorId}/telemetry/events", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MconnCustomerEventsListSuccess)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicConnectorsConnectorIdTelemetryEventsLatest*(client: CloudflareClient,
                                                                          accountId: types.MconnAccountId,
                                                                          connectorId: string): Future[types.MconnCustomerEventsLatestGetSuccess] {.async.} =
  ## Gets latest Magic WAN Connector Telemetry Events

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/connectors/{connectorId}/telemetry/events/latest")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MconnCustomerEventsLatestGetSuccess)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicConnectorsConnectorIdTelemetryEventsEventTEventN*(client: CloudflareClient,
                                                                                accountId: types.MconnAccountId,
                                                                                connectorId: string,
                                                                                eventT: float64,
                                                                                eventN: float64): Future[types.MconnCustomerEventsGetSuccess] {.async.} =
  ## Gets Magic WAN Connector Telemetry Event

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/connectors/{connectorId}/telemetry/events/{eventT}.{eventN}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MconnCustomerEventsGetSuccess)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicConnectorsConnectorIdTelemetrySnapshots*(client: CloudflareClient,
                                                                       accountId: types.MconnAccountId,
                                                                       connectorId: string,
                                                                       `from`: float64,
                                                                       to: float64,
                                                                       limit: float64 = default(float64),
                                                                       cursor: string = default(string)): Future[types.MconnCustomerSnapshotsListSuccess] {.async.} =
  ## Lists Magic WAN Connector Telemetry Snapshots

  var q = initOrderedTable[string, string]()
  q["from"] = $`from`
  q["to"] = $to
  q["limit"] = $limit
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/connectors/{connectorId}/telemetry/snapshots", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MconnCustomerSnapshotsListSuccess)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicConnectorsConnectorIdTelemetrySnapshotsLatest*(client: CloudflareClient,
                                                                             accountId: types.MconnAccountId,
                                                                             connectorId: string): Future[types.MconnCustomerSnapshotsLatestGetSuccess] {.async.} =
  ## Gets latest Magic WAN Connector Telemetry Snapshots

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/connectors/{connectorId}/telemetry/snapshots/latest")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MconnCustomerSnapshotsLatestGetSuccess)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicConnectorsConnectorIdTelemetrySnapshotsSnapshotT*(client: CloudflareClient,
                                                                                accountId: types.MconnAccountId,
                                                                                connectorId: string,
                                                                                snapshotT: float64): Future[types.MconnCustomerSnapshotsGetSuccess] {.async.} =
  ## Gets Magic WAN Connector Telemetry Snapshot

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/connectors/{connectorId}/telemetry/snapshots/{snapshotT}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MconnCustomerSnapshotsGetSuccess)
  else:
    raise newException(CloudflareClientError, body)
