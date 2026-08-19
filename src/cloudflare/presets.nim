# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdRealtimeKitAppIdPresets*(client: CloudflareClient,
                                                  accountId: types.RealtimekitAccountIdentifier,
                                                  appId: types.RealtimekitAppId,
                                                  perPage: float64 = default(float64),
                                                  pageNo: float64 = default(float64),
                                                  search: string = default(string)): Future[JsonNode] {.async.} =
  ## Fetches all the presets belonging to an App.

  var q = initOrderedTable[string, string]()
  q["per_page"] = $perPage
  q["page_no"] = $pageNo
  q["search"] = $search
  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/{appId}/presets", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdRealtimeKitAppIdPresets*(client: CloudflareClient,
                                                   accountId: types.RealtimekitAccountIdentifier,
                                                   appId: types.RealtimekitAppId,
                                                   body: types.RealtimekitPreset): Future[JsonNode] {.async.} =
  ## Creates a preset belonging to the current App

  let res = await client.httpPOST(fmt"/accounts/{accountId}/realtime/kit/{appId}/presets", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitAppIdPresetsPresetId*(client: CloudflareClient,
                                                          accountId: types.RealtimekitAccountIdentifier,
                                                          appId: types.RealtimekitAppId,
                                                          presetId: string): Future[JsonNode] {.async.} =
  ## Fetches details of a preset using the provided preset ID

  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/{appId}/presets/{presetId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdRealtimeKitAppIdPresetsPresetId*(client: CloudflareClient,
                                                          accountId: types.RealtimekitAccountIdentifier,
                                                          appId: types.RealtimekitAppId,
                                                          presetId: string,
                                                          body: types.RealtimekitPreset): Future[JsonNode] {.async.} =
  ## Replace all details for the preset using the provided preset ID.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/realtime/kit/{appId}/presets/{presetId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdRealtimeKitAppIdPresetsPresetId*(client: CloudflareClient,
                                                             accountId: types.RealtimekitAccountIdentifier,
                                                             appId: types.RealtimekitAppId,
                                                             presetId: string): Future[JsonNode] {.async.} =
  ## Deletes a preset using the provided preset ID

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/realtime/kit/{appId}/presets/{presetId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdRealtimeKitAppIdPresetsPresetId*(client: CloudflareClient,
                                                            accountId: types.RealtimekitAccountIdentifier,
                                                            appId: types.RealtimekitAppId,
                                                            presetId: string,
                                                            body: types.RealtimekitUpdatePreset): Future[JsonNode] {.async.} =
  ## Update a preset by the provided preset ID

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/realtime/kit/{appId}/presets/{presetId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
