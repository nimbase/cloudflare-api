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
  PostAccountsAccountIdRealtimeKitAppIdMeetingsRequest = object
    ai_config: Option[types.RealtimekitAIConfig]
    live_stream_on_start: Option[bool]
    persist_chat: Option[bool]
    record_on_start: Option[bool]
    recording_config: Option[types.RealtimekitRecordingConfig]
    session_keep_alive_time_in_secs: Option[float64]
    summarize_on_end: Option[bool]
    title: Option[string]
    transcribe_on_end: Option[bool]
  PutAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdRequest = object
    ai_config: Option[types.RealtimekitAIConfig]
    live_stream_on_start: Option[bool]
    persist_chat: Option[bool]
    record_on_start: Option[bool]
    recording_config: Option[types.RealtimekitRecordingConfig]
    session_keep_alive_time_in_secs: Option[float64]
    summarize_on_end: Option[bool]
    title: Option[string]
    transcribe_on_end: Option[bool]
  PatchAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdRequest = object
    ai_config: Option[types.RealtimekitAIConfig]
    live_stream_on_start: Option[bool]
    persist_chat: Option[bool]
    record_on_start: Option[bool]
    recording_config: Option[types.RealtimekitRecordingConfig]
    session_keep_alive_time_in_secs: Option[float64]
    status: Option[string]
    summarize_on_end: Option[bool]
    title: Option[string]
    transcribe_on_end: Option[bool]
  PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdParticipantsRequest = object
    custom_participant_id: string
    name: Option[string]
    picture: Option[string]
    preset_name: string
  PutAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdParticipantsParticipantIdRequest = object
    custom_participant_id: string
    name: Option[string]
    picture: Option[string]
    preset_name: string
  PatchAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdParticipantsParticipantIdRequest = object
    name: Option[string]
    picture: Option[string]
    preset_name: Option[string]
  MeetingStatusOption* = enum
    statusACTIVE = "ACTIVE"
    statusINACTIVE = "INACTIVE"


proc getAccountsAccountIdRealtimeKitAppIdMeetings*(client: CloudflareClient,
                                                   accountId: types.RealtimekitAccountIdentifier,
                                                   appId: types.RealtimekitAppId,
                                                   pageNo: float64 = default(float64),
                                                   perPage: float64 = default(float64),
                                                   startTime: string = default(string),
                                                   endTime: string = default(string),
                                                   search: string = default(string),
                                                   status: set[MeetingStatusOption] = {}): Future[JsonNode] {.async.} =
  ## Returns all meetings for the given App ID.

  var q = initOrderedTable[string, string]()
  q["page_no"] = $pageNo
  q["per_page"] = $perPage
  q["start_time"] = $startTime
  q["end_time"] = $endTime
  q["search"] = $search
  for v in status: q["status"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/{appId}/meetings", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdRealtimeKitAppIdMeetings*(client: CloudflareClient,
                                                    accountId: types.RealtimekitAccountIdentifier,
                                                    appId: types.RealtimekitAppId,
                                                    body: PostAccountsAccountIdRealtimeKitAppIdMeetingsRequest): Future[JsonNode] {.async.} =
  ## Create a meeting for the given App ID.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/realtime/kit/{appId}/meetings", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitAppIdMeetingsMeetingId*(client: CloudflareClient,
                                                            name: string = default(string),
                                                            meetingId: string): Future[JsonNode] {.async.} =
  ## Returns a meeting details in an App for the given meeting ID.

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  let res = await client.httpGET(fmt"/accounts/{account_id}/realtime/kit/{app_id}/meetings/{meetingId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdRealtimeKitAppIdMeetingsMeetingId*(client: CloudflareClient,
                                                            meetingId: string,
                                                            body: PutAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdRequest): Future[JsonNode] {.async.} =
  ## Replaces all the details for the given meeting ID.

  let res = await client.httpPUT(fmt"/accounts/{account_id}/realtime/kit/{app_id}/meetings/{meetingId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdRealtimeKitAppIdMeetingsMeetingId*(client: CloudflareClient,
                                                              meetingId: string,
                                                              body: PatchAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdRequest): Future[JsonNode] {.async.} =
  ## Updates a meeting in an App for the given meeting ID.

  let res = await client.httpPATCH(fmt"/accounts/{account_id}/realtime/kit/{app_id}/meetings/{meetingId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdParticipants*(client: CloudflareClient,
                                                                        accountId: types.RealtimekitAccountIdentifier,
                                                                        appId: types.RealtimekitAppId,
                                                                        pageNo: float64 = default(float64),
                                                                        perPage: float64 = default(float64),
                                                                        meetingId: string): Future[JsonNode] {.async.} =
  ## Returns all participants detail for the given meeting ID.

  var q = initOrderedTable[string, string]()
  q["page_no"] = $pageNo
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/{appId}/meetings/{meetingId}/participants", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdParticipants*(client: CloudflareClient,
                                                                         accountId: types.RealtimekitAccountIdentifier,
                                                                         appId: types.RealtimekitAppId,
                                                                         meetingId: string,
                                                                         body: PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdParticipantsRequest): Future[JsonNode] {.async.} =
  ## Adds a participant to the given meeting ID.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/realtime/kit/{appId}/meetings/{meetingId}/participants", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdParticipantsParticipantId*(client: CloudflareClient,
                                                                                     meetingId: string,
                                                                                     participantId: string): Future[JsonNode] {.async.} =
  ## Returns a participant details for the given meeting and participant ID.

  let res = await client.httpGET(fmt"/accounts/{account_id}/realtime/kit/{app_id}/meetings/{meetingId}/participants/{participantId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdParticipantsParticipantId*(client: CloudflareClient,
                                                                                     meetingId: string,
                                                                                     participantId: string,
                                                                                     body: PutAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdParticipantsParticipantIdRequest): Future[JsonNode] {.async.} =
  ## Replaces a participant's details for the given meeting and participant ID.

  let res = await client.httpPUT(fmt"/accounts/{account_id}/realtime/kit/{app_id}/meetings/{meetingId}/participants/{participantId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdParticipantsParticipantId*(client: CloudflareClient,
                                                                                        meetingId: string,
                                                                                        participantId: string): Future[JsonNode] {.async.} =
  ## Deletes a participant for the given meeting and participant ID.

  let res = await client.httpDELETE(fmt"/accounts/{account_id}/realtime/kit/{app_id}/meetings/{meetingId}/participants/{participantId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdParticipantsParticipantId*(client: CloudflareClient,
                                                                                       meetingId: string,
                                                                                       participantId: string,
                                                                                       body: PatchAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdParticipantsParticipantIdRequest): Future[JsonNode] {.async.} =
  ## Updates a participant's details for the given meeting and participant ID.

  let res = await client.httpPATCH(fmt"/accounts/{account_id}/realtime/kit/{app_id}/meetings/{meetingId}/participants/{participantId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdParticipantsParticipantIdToken*(client: CloudflareClient,
                                                                                           accountId: types.RealtimekitAccountIdentifier,
                                                                                           appId: types.RealtimekitAppId,
                                                                                           meetingId: string,
                                                                                           participantId: string): Future[JsonNode] {.async.} =
  ## Regenerates participant's authentication token for the given meeting and
  ## participant ID.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/realtime/kit/{appId}/meetings/{meetingId}/participants/{participantId}/token")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
