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
  PostAccountsAccountIdRealtimeKitAppIdRecordingsRequest = object
    allow_multiple_recordings: Option[bool]
    audio_config: Option[types.RealtimekitAudioConfig]
    file_name_prefix: Option[string]
    interactive_config: Option[types.RealtimekitInteractiveConfig]
    max_seconds: Option[int64]
    meeting_id: string
    realtimekit_bucket_config: Option[types.RealtimekitRealtimekitBucketConfig]
    rtmp_out_config: Option[types.RealtimekitLivestreamingConfig]
    storage_config: Option[types.RealtimekitStorageConfig]
    url: Option[string]
    video_config: Option[types.RealtimekitVideoConfig]
  PostAccountsAccountIdRealtimeKitAppIdRecordingsTrackRequest = object
    layers: Option[JsonNode]
    meeting_id: string
    user_ids: Option[seq[string]]
  PutAccountsAccountIdRealtimeKitAppIdRecordingsRecordingIdRequest = object
    action: string
  RecordingSortByOption* = enum
    sortByInvokedTime = "invokedTime"

  RecordingSortOrderOption* = enum
    sortOrderASC = "ASC"
    sortOrderDESC = "DESC"


proc getAccountsAccountIdRealtimeKitAppIdRecordings*(client: CloudflareClient,
                                                     accountId: types.RealtimekitAccountIdentifier,
                                                     appId: types.RealtimekitAppId,
                                                     meetingId: string = default(string),
                                                     pageNo: float64 = default(float64),
                                                     perPage: float64 = default(float64),
                                                     expired: bool = default(bool),
                                                     search: string = default(string),
                                                     sortBy: RecordingSortByOption,
                                                     sortOrder: RecordingSortOrderOption,
                                                     startTime: string = default(string),
                                                     endTime: string = default(string),
                                                     status: seq[string] = default(seq[string])): Future[JsonNode] {.async.} =
  ## Returns all recordings for an App. If the `meeting_id` parameter is passed,
  ## returns all recordings for the given meeting ID.

  var q = initOrderedTable[string, string]()
  q["meeting_id"] = $meetingId
  q["page_no"] = $pageNo
  q["per_page"] = $perPage
  q["expired"] = $expired
  q["search"] = $search
  q["sort_by"] = $sortBy
  q["sort_order"] = $sortOrder
  q["start_time"] = $startTime
  q["end_time"] = $endTime
  q["status"] = $status
  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/{appId}/recordings", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdRealtimeKitAppIdRecordings*(client: CloudflareClient,
                                                      accountId: types.RealtimekitAccountIdentifier,
                                                      appId: types.RealtimekitAppId,
                                                      body: PostAccountsAccountIdRealtimeKitAppIdRecordingsRequest): Future[JsonNode] {.async.} =
  ## Starts recording a meeting. The meeting can be started by an App admin directly,
  ## or a participant with permissions to start a recording, based on the type of
  ## authorization used.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/realtime/kit/{appId}/recordings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitAppIdRecordingsActiveRecordingMeetingId*(client: CloudflareClient,
                                                                             accountId: types.RealtimekitAccountIdentifier,
                                                                             appId: types.RealtimekitAppId,
                                                                             meetingId: string): Future[JsonNode] {.async.} =
  ## Returns the active recording details for the given meeting ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/{appId}/recordings/active-recording/{meetingId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdRealtimeKitAppIdRecordingsTrack*(client: CloudflareClient,
                                                           accountId: types.RealtimekitAccountIdentifier,
                                                           appId: types.RealtimekitAppId,
                                                           body: PostAccountsAccountIdRealtimeKitAppIdRecordingsTrackRequest): Future[JsonNode] {.async.} =
  ## Starts track recording for a meeting. Track recording currently records separate
  ## participant audio tracks as WebM files in the RealtimeKit bucket. Video track
  ## recording is in development. For more information, refer to [Track
  ## recording](/realtime/realtimekit/recording-guide/track-recording/).

  let res = await client.httpPOST(fmt"/accounts/{accountId}/realtime/kit/{appId}/recordings/track", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitAppIdRecordingsRecordingId*(client: CloudflareClient,
                                                                accountId: types.RealtimekitAccountIdentifier,
                                                                appId: types.RealtimekitAppId,
                                                                recordingId: string): Future[JsonNode] {.async.} =
  ## Returns details of a recording for the given recording ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/{appId}/recordings/{recordingId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdRealtimeKitAppIdRecordingsRecordingId*(client: CloudflareClient,
                                                                accountId: types.RealtimekitAccountIdentifier,
                                                                appId: string,
                                                                recordingId: string,
                                                                body: PutAccountsAccountIdRealtimeKitAppIdRecordingsRecordingIdRequest): Future[JsonNode] {.async.} =
  ## Pause/Resume/Stop a given recording ID.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/realtime/kit/{appId}/recordings/{recordingId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
