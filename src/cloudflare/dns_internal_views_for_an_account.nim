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
  DeleteAccountsAccountIdDnsSettingsViewsViewIdResponse* = object
    result: JsonNode

proc getAccountsAccountIdDnsSettingsViews*(client: CloudflareClient,
                                           accountId: types.DnsSettingsIdentifier,
                                           name: string = default(string),
                                           nameExact: string = default(string),
                                           nameContains: string = default(string),
                                           nameStartswith: string = default(string),
                                           nameEndswith: string = default(string),
                                           zoneId: string = default(string),
                                           zoneName: string = default(string),
                                           match: types.DnsSettingsMatch = default(types.DnsSettingsMatch),
                                           page: types.DnsSettingsPage = default(types.DnsSettingsPage),
                                           perPage: types.DnsSettingsPerPage = default(types.DnsSettingsPerPage),
                                           order: types.DnsSettingsOrder = default(types.DnsSettingsOrder),
                                           direction: types.DnsSettingsDirection = default(types.DnsSettingsDirection)): Future[types.DnsSettingsDnsViewResponseCollection] {.async.} =
  ## List DNS Internal Views for an Account

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  q["name.exact"] = $nameExact
  q["name.contains"] = $nameContains
  q["name.startswith"] = $nameStartswith
  q["name.endswith"] = $nameEndswith
  q["zone_id"] = $zoneId
  q["zone_name"] = $zoneName
  q["match"] = $match
  q["page"] = $page
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  let res = await client.httpGET(fmt"/accounts/{accountId}/dns_settings/views", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsSettingsDnsViewResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDnsSettingsViews*(client: CloudflareClient,
                                            accountId: types.DnsSettingsIdentifier,
                                            body: types.DnsSettingsDnsViewPost): Future[types.DnsSettingsDnsViewResponseSingle] {.async.} =
  ## Create Internal DNS View for an account

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dns_settings/views", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsSettingsDnsViewResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDnsSettingsViewsViewId*(client: CloudflareClient,
                                                 accountId: types.DnsSettingsIdentifier,
                                                 viewId: types.DnsSettingsIdentifier): Future[types.DnsSettingsDnsViewResponseSingle] {.async.} =
  ## Get DNS Internal View

  let res = await client.httpGET(fmt"/accounts/{accountId}/dns_settings/views/{viewId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsSettingsDnsViewResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDnsSettingsViewsViewId*(client: CloudflareClient,
                                                    accountId: types.DnsSettingsIdentifier,
                                                    viewId: types.DnsSettingsIdentifier): Future[DeleteAccountsAccountIdDnsSettingsViewsViewIdResponse] {.async.} =
  ## Delete an existing Internal DNS View

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/dns_settings/views/{viewId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdDnsSettingsViewsViewIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdDnsSettingsViewsViewId*(client: CloudflareClient,
                                                   accountId: types.DnsSettingsIdentifier,
                                                   viewId: types.DnsSettingsIdentifier,
                                                   body: types.DnsSettingsDnsViewPatch): Future[types.DnsSettingsDnsViewResponseSingle] {.async.} =
  ## Update an existing Internal DNS View

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/dns_settings/views/{viewId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsSettingsDnsViewResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
