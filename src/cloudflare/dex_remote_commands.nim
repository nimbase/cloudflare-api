# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdDexCommandsRequest = object
    commands: seq[JsonNode]
  DexRemoteCommandCommandTypeOption* = enum
    commandTypePcap = "pcap"
    commandTypeSpeedTest = "speed-test"
    commandTypeWarpDiag = "warp-diag"

  DexRemoteCommandStatusOption* = enum
    statusPENDINGEXEC = "PENDING_EXEC"
    statusPENDINGUPLOAD = "PENDING_UPLOAD"
    statusSUCCESS = "SUCCESS"
    statusFAILED = "FAILED"


proc getAccountsAccountIdDexCommands*(client: CloudflareClient,
                                      accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                      page: float64, perPage: float64,
                                      `from`: string = default(string),
                                      to: string = default(string),
                                      deviceId: string = default(string),
                                      userEmail: string = default(string),
                                      commandType: set[DexRemoteCommandCommandTypeOption] = {},
                                      status: set[DexRemoteCommandStatusOption] = {}): Future[JsonNode] {.async.} =
  ## Retrieves a paginated list of commands issued to devices under the specified
  ## account, optionally filtered by time range, device, or other parameters

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["from"] = $`from`
  q["to"] = $to
  q["device_id"] = $deviceId
  q["user_email"] = $userEmail
  for v in commandType: q["command_type"] = $v
  for v in status: q["status"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/commands", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDexCommands*(client: CloudflareClient,
                                       accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                       body: PostAccountsAccountIdDexCommandsRequest): Future[JsonNode] {.async.} =
  ## Initiate commands for up to 10 devices per account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dex/commands", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDexCommandsDevices*(client: CloudflareClient,
                                             accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                             page: float64, perPage: float64,
                                             search: string = default(string)): Future[JsonNode] {.async.} =
  ## List devices with WARP client support for remote captures which have been
  ## connected in the last 1 hour.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["search"] = $search
  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/commands/devices", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDexCommandsQuota*(client: CloudflareClient,
                                           accountId: types.DigitalExperienceMonitoringAccountIdentifier): Future[JsonNode] {.async.} =
  ## Retrieves the current quota usage and limits for device commands within a
  ## specific account, including the time when the quota will reset

  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/commands/quota")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDexCommandsCommandIdDownloadsFilename*(client: CloudflareClient,
                                                                accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                                                commandId: types.DigitalExperienceMonitoringCommandId,
                                                                filename: string): Future[AsyncResponse] {.async.} =
  ## Downloads artifacts for an executed command. Bulk downloads are not supported

  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/commands/{commandId}/downloads/{filename}")
  return res
