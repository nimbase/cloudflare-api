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
  GetAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionResponse* = object
    data: types.RealtimekitActiveSession
    success: bool
  PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionKickRequest = object
    custom_participant_ids: seq[string]
    participant_ids: seq[string]
  PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionKickResponse* = object
    data: JsonNode
    success: bool
  PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionKickAllResponse* = object
    data: JsonNode
    success: bool
  PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionMuteRequest = object
    custom_participant_ids: seq[string]
    participant_ids: seq[string]
  PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionMuteResponse* = object
    data: JsonNode
    success: bool
  PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionMuteAllRequest = object
    allow_unmute: bool
  PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionMuteAllResponse* = object
    data: JsonNode
    success: bool
  PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionPollRequest = object
    anonymous: Option[bool]
    hide_votes: Option[bool]
    options: seq[string]
    question: string
  PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionPollResponse* = object
    data: JsonNode
    success: bool

proc getAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSession*(client: CloudflareClient,
                                                                         meetingId: string): Future[GetAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionResponse] {.async.} =
  ## Returns details of an ongoing active session for the given meeting ID.

  let res = await client.httpGET(fmt"/accounts/{account_id}/realtime/kit/{app_id}/meetings/{meetingId}/active-session")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionKick*(client: CloudflareClient,
                                                                              accountId: types.RealtimekitAccountIdentifier,
                                                                              appId: types.RealtimekitAppId,
                                                                              meetingId: string,
                                                                              body: PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionKickRequest): Future[PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionKickResponse] {.async.} =
  ## Kicks one or more participants from an active session using user ID or custom
  ## participant ID.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/realtime/kit/{appId}/meetings/{meetingId}/active-session/kick", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionKickResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionKickAll*(client: CloudflareClient,
                                                                                 accountId: types.RealtimekitAccountIdentifier,
                                                                                 appId: types.RealtimekitAppId,
                                                                                 meetingId: string): Future[PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionKickAllResponse] {.async.} =
  ## Kicks all participants from an active session for the given meeting ID.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/realtime/kit/{appId}/meetings/{meetingId}/active-session/kick-all")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionKickAllResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionMute*(client: CloudflareClient,
                                                                              accountId: types.RealtimekitAccountIdentifier,
                                                                              appId: types.RealtimekitAppId,
                                                                              meetingId: string,
                                                                              body: PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionMuteRequest): Future[PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionMuteResponse] {.async.} =
  ## Mutes one or more participants from an active session using user ID or custom
  ## participant ID.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/realtime/kit/{appId}/meetings/{meetingId}/active-session/mute", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionMuteResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionMuteAll*(client: CloudflareClient,
                                                                                 accountId: types.RealtimekitAccountIdentifier,
                                                                                 appId: types.RealtimekitAppId,
                                                                                 meetingId: string,
                                                                                 body: PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionMuteAllRequest): Future[PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionMuteAllResponse] {.async.} =
  ## Mutes all participants of an active session for the given meeting ID.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/realtime/kit/{appId}/meetings/{meetingId}/active-session/mute-all", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionMuteAllResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionPoll*(client: CloudflareClient,
                                                                              accountId: types.RealtimekitAccountIdentifier,
                                                                              appId: types.RealtimekitAppId,
                                                                              meetingId: string,
                                                                              body: PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionPollRequest): Future[PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionPollResponse] {.async.} =
  ## Creates a new poll in an active session for the given meeting ID.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/realtime/kit/{appId}/meetings/{meetingId}/active-session/poll", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, PostAccountsAccountIdRealtimeKitAppIdMeetingsMeetingIdActiveSessionPollResponse)
  else:
    raise newException(CloudflareClientError, body)
