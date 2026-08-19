# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient
import ./private/types

type
  GetAccountsAccountIdRealtimeKitAppIdAnalyticsLivestreamsDaywiseResponse* = object
    data: seq[JsonNode]
    success: bool
  GetAccountsAccountIdRealtimeKitAppIdAnalyticsLivestreamsOverallResponse* = object
    data: JsonNode
    success: bool
  GetAccountsAccountIdRealtimeKitAppIdLivestreamsResponse* = object
    data: JsonNode
    success: bool
  PostAccountsAccountIdRealtimeKitAppIdLivestreamsRequest = object
    name: Option[string]
  PostAccountsAccountIdRealtimeKitAppIdLivestreamsResponse* = object
    data: JsonNode
    success: bool
  GetAccountsAccountIdRealtimeKitAppIdLivestreamsSessionsLivestreamSessionIdResponse* = object
    data: JsonNode
    success: bool
  GetAccountsAccountIdRealtimeKitAppIdLivestreamsLivestreamIdResponse* = object
    data: JsonNode
    success: bool
  GetAccountsAccountIdRealtimeKitAppIdLivestreamsLivestreamIdActiveLivestreamSessionResponse* = object
    data: JsonNode
    success: bool
  GetAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveLivestreamResponse* = object
    data: JsonNode
    success: bool
  PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveLivestreamStopResponse* = object
    data: JsonNode
    success: bool
  GetAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdLivestreamResponse* = object
    data: JsonNode
    success: bool
  PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdLivestreamsRequest = object
    name: Option[string]
    video_config: Option[JsonNode]
  PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdLivestreamsResponse* = object
    data: JsonNode
    success: bool
  GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdLivestreamSessionsResponse* = object
    data: JsonNode
    success: bool
  LiveStreamStatusOption* = enum
    statusLIVE = "LIVE"
    statusIDLE = "IDLE"
    statusERRORED = "ERRORED"
    statusINVOKED = "INVOKED"

  LiveStreamSortOrderOption* = enum
    sortOrderASC = "ASC"
    sortOrderDSC = "DSC"


proc getAccountsAccountIdRealtimeKitAppIdAnalyticsLivestreamsDaywise*(client: CloudflareClient,
                                                                      accountId: types.RealtimekitAccountIdentifier,
                                                                      appId: types.RealtimekitAppId,
                                                                      startTime: int64 = default(int64),
                                                                      endTime: int64 = default(int64),
                                                                      filters: string = default(string)): Future[GetAccountsAccountIdRealtimeKitAppIdAnalyticsLivestreamsDaywiseResponse] {.async.} =
  ## Returns day-wise livestream analytics for the specified time range.

  var q = initOrderedTable[string, string]()
  q["start_time"] = $startTime
  q["end_time"] = $endTime
  q["filters"] = $filters
  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/{appId}/analytics/livestreams/daywise", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdRealtimeKitAppIdAnalyticsLivestreamsDaywiseResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitAppIdAnalyticsLivestreamsOverall*(client: CloudflareClient,
                                                                      accountId: types.RealtimekitAccountIdentifier,
                                                                      appId: types.RealtimekitAppId,
                                                                      startTime: int64 = default(int64),
                                                                      endTime: int64 = default(int64),
                                                                      filters: string = default(string)): Future[GetAccountsAccountIdRealtimeKitAppIdAnalyticsLivestreamsOverallResponse] {.async.} =
  ## Returns livestream analytics for the specified time range.

  var q = initOrderedTable[string, string]()
  q["start_time"] = $startTime
  q["end_time"] = $endTime
  q["filters"] = $filters
  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/{appId}/analytics/livestreams/overall", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdRealtimeKitAppIdAnalyticsLivestreamsOverallResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitAppIdLivestreams*(client: CloudflareClient,
                                                      excludeMeetings: bool = false,
                                                      perPage: int64 = default(int64),
                                                      pageNo: int64 = default(int64),
                                                      status: set[LiveStreamStatusOption] = {},
                                                      startTime: string = default(string),
                                                      endTime: string = default(string),
                                                      sortOrder: set[LiveStreamSortOrderOption] = {}): Future[GetAccountsAccountIdRealtimeKitAppIdLivestreamsResponse] {.async.} =
  ## Returns details of livestreams associated with the given App ID. It includes
  ## livestreams created by your App and RealtimeKit meetings that are livestreamed
  ## by your App. If you only want details of livestreams created by your App and not
  ## RealtimeKit meetings, you can use the `exclude_meetings` query parameter.

  var q = initOrderedTable[string, string]()
  q["exclude_meetings"] = $excludeMeetings
  q["per_page"] = $perPage
  q["page_no"] = $pageNo
  for v in status: q["status"] = $v
  q["start_time"] = $startTime
  q["end_time"] = $endTime
  for v in sortOrder: q["sort_order"] = $v
  let res = await client.httpGET("/accounts/{account_id}/realtime/kit/{app_id}/livestreams", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdRealtimeKitAppIdLivestreamsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdRealtimeKitAppIdLivestreams*(client: CloudflareClient,
                                                       body: PostAccountsAccountIdRealtimeKitAppIdLivestreamsRequest): Future[PostAccountsAccountIdRealtimeKitAppIdLivestreamsResponse] {.async.} =
  ## Creates a livestream for the given App ID and returns ingest server, stream key,
  ## and playback URL. You can pass custom input to the ingest server and stream key,
  ## and freely distribute the content using the playback URL on any player that
  ## supports HLS/LHLS.

  let res = await client.httpPOST("/accounts/{account_id}/realtime/kit/{app_id}/livestreams", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, PostAccountsAccountIdRealtimeKitAppIdLivestreamsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitAppIdLivestreamsSessionsLivestreamSessionId*(client: CloudflareClient,
                                                                                 accountId: types.RealtimekitAccountIdentifier,
                                                                                 appId: types.RealtimekitAppId,
                                                                                 livestreamSessionId: string): Future[GetAccountsAccountIdRealtimeKitAppIdLivestreamsSessionsLivestreamSessionIdResponse] {.async.} =
  ## Returns livestream session details for the given livestream session ID. Retrieve
  ## the `livestream_session_id`using the `Fetch livestream session details using a
  ## session ID` API.

  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/{appId}/livestreams/sessions/{livestreamSessionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdRealtimeKitAppIdLivestreamsSessionsLivestreamSessionIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitAppIdLivestreamsLivestreamId*(client: CloudflareClient,
                                                                  accountId: types.RealtimekitAccountIdentifier,
                                                                  appId: types.RealtimekitAppId,
                                                                  pageNo: int64 = default(int64),
                                                                  perPage: int64 = default(int64),
                                                                  livestreamId: string): Future[GetAccountsAccountIdRealtimeKitAppIdLivestreamsLivestreamIdResponse] {.async.} =
  ## Returns details of a livestream with sessions for the given livestream ID.
  ## Retreive the livestream ID using the `Start livestreaming a meeting` API.

  var q = initOrderedTable[string, string]()
  q["page_no"] = $pageNo
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/{appId}/livestreams/{livestreamId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdRealtimeKitAppIdLivestreamsLivestreamIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitAppIdLivestreamsLivestreamIdActiveLivestreamSession*(client: CloudflareClient,
                                                                                         accountId: types.RealtimekitAccountIdentifier,
                                                                                         appId: types.RealtimekitAppId,
                                                                                         livestreamId: string): Future[GetAccountsAccountIdRealtimeKitAppIdLivestreamsLivestreamIdActiveLivestreamSessionResponse] {.async.} =
  ## Returns details of all active livestreams for the given livestream ID. Retreive
  ## the livestream ID using the `Start livestreaming a meeting` API.

  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/{appId}/livestreams/{livestreamId}/active-livestream-session")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdRealtimeKitAppIdLivestreamsLivestreamIdActiveLivestreamSessionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveLivestream*(client: CloudflareClient,
                                                                            meetingId: string): Future[GetAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveLivestreamResponse] {.async.} =
  ## Returns details of all active livestreams for the given meeting ID.

  let res = await client.httpGET(fmt"/accounts/{account_id}/realtime/kit/{app_id}/meetings/{meetingId}/active-livestream")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveLivestreamResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveLivestreamStop*(client: CloudflareClient,
                                                                                 meetingId: string): Future[PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveLivestreamStopResponse] {.async.} =
  ## Stops the active livestream of a meeting associated with the given meeting ID.
  ## Retreive the meeting ID using the `Create a meeting` API.

  let res = await client.httpPOST(fmt"/accounts/{account_id}/realtime/kit/{app_id}/meetings/{meetingId}/active-livestream/stop")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveLivestreamStopResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdLivestream*(client: CloudflareClient,
                                                                      pageNo: int64 = default(int64),
                                                                      perPage: int64 = default(int64),
                                                                      meetingId: string): Future[GetAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdLivestreamResponse] {.async.} =
  ## Returns livestream session details for the given meeting ID. Retreive the
  ## meeting ID using the `Create a meeting` API.

  var q = initOrderedTable[string, string]()
  q["page_no"] = $pageNo
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{account_id}/realtime/kit/{app_id}/meetings/{meetingId}/livestream", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdLivestreamResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdLivestreams*(client: CloudflareClient,
                                                                        meetingId: string,
                                                                        body: PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdLivestreamsRequest): Future[PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdLivestreamsResponse] {.async.} =
  ## Starts livestream of a meeting associated with the given meeting ID. Retreive
  ## the meeting ID using the `Create a meeting` API.

  let res = await client.httpPOST(fmt"/accounts/{account_id}/realtime/kit/{app_id}/meetings/{meetingId}/livestreams", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdLivestreamsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitAppIdSessionsSessionIdLivestreamSessions*(client: CloudflareClient,
                                                                              accountId: types.RealtimekitAccountIdentifier,
                                                                              appId: types.RealtimekitAppId,
                                                                              perPage: float64 = default(float64),
                                                                              pageNo: float64 = default(float64),
                                                                              sessionId: string): Future[GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdLivestreamSessionsResponse] {.async.} =
  ## Returns livestream session details for the given session ID. Retreive the
  ## session ID using the `Fetch all sessions of an App` API.

  var q = initOrderedTable[string, string]()
  q["per_page"] = $perPage
  q["page_no"] = $pageNo
  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/{appId}/sessions/{sessionId}/livestream-sessions", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdRealtimeKitAppIdSessionsSessionIdLivestreamSessionsResponse)
  else:
    raise newException(CloudflareClientError, body)
