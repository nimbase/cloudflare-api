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
  WarpChangeEventTypeOption* = enum
    typeConfig = "config"
    typeToggle = "toggle"

  WarpChangeEventToggleOption* = enum
    toggleOn = "on"
    toggleOff = "off"

  WarpChangeEventSortOrderOption* = enum
    sortOrderASC = "ASC"
    sortOrderDESC = "DESC"


proc getAccountsAccountIdDexWarpChangeEvents*(client: CloudflareClient,
                                              accountId: types.DigitalExperienceMonitoringAccountIdentifier,
                                              page: float64, perPage: float64,
                                              `from`: string, to: string,
                                              `type`: WarpChangeEventTypeOption,
                                              toggle: WarpChangeEventToggleOption,
                                              configName: string = default(string),
                                              accountName: string = default(string),
                                              sortOrder: WarpChangeEventSortOrderOption = sortOrderASC): Future[JsonNode] {.async.} =
  ## List WARP configuration and enablement toggle change events by device.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["from"] = $`from`
  q["to"] = $to
  q["type"] = $`type`
  q["toggle"] = $toggle
  q["config_name"] = $configName
  q["account_name"] = $accountName
  q["sort_order"] = $sortOrder
  let res = await client.httpGET(fmt"/accounts/{accountId}/dex/warp-change-events", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
