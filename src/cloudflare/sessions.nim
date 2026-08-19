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
  GetAccountsAccountIdRealtimeKitAppIdSessionsResponse* = object
    data: JsonNode
    paging: JsonNode
    success: bool
  GetAccountsAccountIdRealtimeKitAppIdSessionsPeerReportPeerIdResponse* = object
    data: JsonNode
    success: bool
  GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdResponse* = object
    data: types.RealtimekitActiveSession
    success: bool
  GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdChatResponse* = object
    data: types.RealtimekitChatMessage
    success: bool
  GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdParticipantsResponse* = object
    data: JsonNode
    success: bool
  GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdParticipantsParticipantIdResponse* = object
    data: JsonNode
    success: bool
  GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdSummaryResponse* = object
    data: types.RealtimekitTranscriptSummary
    success: bool
  PostAccountsAccountIdRealtimeKitAppIdSessionsSessionIdSummaryResponse* = object
    data: JsonNode
    success: bool
  GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdTranscriptResponse* = object
    data: types.RealtimekitTranscript
    success: bool
  SessionSortByOption* = enum
    sortByMinutesConsumed = "minutesConsumed"
    sortByCreatedAt = "createdAt"

  SessionSortOrderOption* = enum
    sortOrderASC = "ASC"
    sortOrderDESC = "DESC"

  SessionStatusOption* = enum
    statusLIVE = "LIVE"
    statusENDED = "ENDED"

  SessionFiltersOption* = enum
    filtersDeviceInfo = "device_info"
    filtersIpInformation = "ip_information"
    filtersPrecallNetworkInformation = "precall_network_information"
    filtersEvents = "events"
    filtersQualityStats = "quality_stats"

  SessionViewOption* = enum
    viewRaw = "raw"
    viewConsolidated = "consolidated"

  SessionFormatOption* = enum
    formatSRT = "SRT"
    formatVTT = "VTT"
    formatJSON = "JSON"
    formatCSV = "CSV"


proc getAccountsAccountIdRealtimeKitAppIdSessions*(client: CloudflareClient,
                                                   accountId: types.RealtimekitAccountIdentifier,
                                                   appId: types.RealtimekitAppId,
                                                   pageNo: float64 = default(float64),
                                                   perPage: float64 = default(float64),
                                                   sortBy: set[SessionSortByOption] = {},
                                                   sortOrder: set[SessionSortOrderOption] = {},
                                                   startTime: string = default(string),
                                                   endTime: string = default(string),
                                                   participants: string = default(string),
                                                   status: set[SessionStatusOption] = {},
                                                   search: string = default(string),
                                                   associatedId: string = default(string)): Future[GetAccountsAccountIdRealtimeKitAppIdSessionsResponse] {.async.} =
  ## Returns details of all sessions of an App.

  var q = initOrderedTable[string, string]()
  q["page_no"] = $pageNo
  q["per_page"] = $perPage
  for v in sortBy: q["sort_by"] = $v
  for v in sortOrder: q["sort_order"] = $v
  q["start_time"] = $startTime
  q["end_time"] = $endTime
  q["participants"] = $participants
  for v in status: q["status"] = $v
  q["search"] = $search
  q["associated_id"] = $associatedId
  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/{appId}/sessions", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdRealtimeKitAppIdSessionsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitAppIdSessionsPeerReportPeerId*(client: CloudflareClient,
                                                                   accountId: types.RealtimekitAccountIdentifier,
                                                                   appId: types.RealtimekitAppId,
                                                                   filters: set[SessionFiltersOption] = {},
                                                                   includePeerEvents: bool = false,
                                                                   peerId: string): Future[GetAccountsAccountIdRealtimeKitAppIdSessionsPeerReportPeerIdResponse] {.async.} =
  ## Returns participant details for the given peer ID along with call statistics.

  var q = initOrderedTable[string, string]()
  for v in filters: q["filters"] = $v
  q["include_peer_events"] = $includePeerEvents
  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/{appId}/sessions/peer-report/{peerId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdRealtimeKitAppIdSessionsPeerReportPeerIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitAppIdSessionsSessionId*(client: CloudflareClient,
                                                            accountId: types.RealtimekitAccountIdentifier,
                                                            appId: types.RealtimekitAppId,
                                                            includeBreakoutRooms: bool = false,
                                                            sessionId: string): Future[GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdResponse] {.async.} =
  ## Returns data of the given session ID including recording details.

  var q = initOrderedTable[string, string]()
  q["include_breakout_rooms"] = $includeBreakoutRooms
  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/{appId}/sessions/{sessionId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitAppIdSessionsSessionIdChat*(client: CloudflareClient,
                                                                accountId: types.RealtimekitAccountIdentifier,
                                                                appId: types.RealtimekitAppId,
                                                                sessionId: string): Future[GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdChatResponse] {.async.} =
  ## Returns a URL to download all chat messages of the session ID in CSV format.

  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/{appId}/sessions/{sessionId}/chat")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdChatResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitAppIdSessionsSessionIdParticipants*(client: CloudflareClient,
                                                                        accountId: types.RealtimekitAccountIdentifier,
                                                                        appId: types.RealtimekitAppId,
                                                                        search: string = default(string),
                                                                        pageNo: float64 = default(float64),
                                                                        perPage: float64 = default(float64),
                                                                        sortOrder: set[SessionSortOrderOption] = {},
                                                                        sortBy: set[SessionSortByOption] = {},
                                                                        includePeerEvents: bool = false,
                                                                        view: string = "raw",
                                                                        sessionId: string): Future[GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdParticipantsResponse] {.async.} =
  ## Returns a list of participants for the given session ID.

  var q = initOrderedTable[string, string]()
  q["search"] = $search
  q["page_no"] = $pageNo
  q["per_page"] = $perPage
  for v in sortOrder: q["sort_order"] = $v
  for v in sortBy: q["sort_by"] = $v
  q["include_peer_events"] = $includePeerEvents
  for v in view: q["view"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/{appId}/sessions/{sessionId}/participants", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdParticipantsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitAppIdSessionsSessionIdParticipantsParticipantId*(client: CloudflareClient,
                                                                                     accountId: types.RealtimekitAccountIdentifier,
                                                                                     appId: types.RealtimekitAppId,
                                                                                     includePeerEvents: bool = false,
                                                                                     participantId: string,
                                                                                     sessionId: string): Future[GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdParticipantsParticipantIdResponse] {.async.} =
  ## Returns details of the given participant ID along with call statistics for the
  ## given session ID.

  var q = initOrderedTable[string, string]()
  q["include_peer_events"] = $includePeerEvents
  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/{appId}/sessions/{sessionId}/participants/{participantId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdParticipantsParticipantIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitAppIdSessionsSessionIdSummary*(client: CloudflareClient,
                                                                   accountId: types.RealtimekitAccountIdentifier,
                                                                   appId: types.RealtimekitAppId,
                                                                   sessionId: string): Future[GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdSummaryResponse] {.async.} =
  ## Returns a Summary URL to download the Summary of Transcripts for the session ID
  ## as plain text.

  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/{appId}/sessions/{sessionId}/summary")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdSummaryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdRealtimeKitAppIdSessionsSessionIdSummary*(client: CloudflareClient,
                                                                    accountId: types.RealtimekitAccountIdentifier,
                                                                    appId: types.RealtimekitAppId,
                                                                    sessionId: string): Future[PostAccountsAccountIdRealtimeKitAppIdSessionsSessionIdSummaryResponse] {.async.} =
  ## Trigger Summary generation of Transcripts for the session ID.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/realtime/kit/{appId}/sessions/{sessionId}/summary")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdRealtimeKitAppIdSessionsSessionIdSummaryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitAppIdSessionsSessionIdTranscript*(client: CloudflareClient,
                                                                      accountId: types.RealtimekitAccountIdentifier,
                                                                      appId: types.RealtimekitAppId,
                                                                      sessionId: string,
                                                                      format: string = "CSV"): Future[GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdTranscriptResponse] {.async.} =
  ## Returns a URL to download the transcript for the session ID in CSV format.

  var q = initOrderedTable[string, string]()
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/{appId}/sessions/{sessionId}/transcript", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdTranscriptResponse)
  else:
    raise newException(CloudflareClientError, body)
