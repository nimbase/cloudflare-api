# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdStreamIdentifierAudio*(client: CloudflareClient,
                                                accountId: types.StreamAccountIdentifier,
                                                identifier: types.StreamIdentifier): Future[types.StreamListAudioTrackResponse] {.async.} =
  ## Lists additional audio tracks on a video. Note this API will not return
  ## information for audio attached to the video upload.

  let res = await client.httpGET(fmt"/accounts/{accountId}/stream/{identifier}/audio")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamListAudioTrackResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdStreamIdentifierAudioCopy*(client: CloudflareClient,
                                                     accountId: types.StreamAccountIdentifier,
                                                     identifier: types.StreamIdentifier,
                                                     body: types.StreamCopyAudioTrack): Future[types.StreamAddAudioTrackResponse] {.async.} =
  ## Adds an additional audio track to a video using the provided audio track URL.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/stream/{identifier}/audio/copy", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamAddAudioTrackResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdStreamIdentifierAudioAudioIdentifier*(client: CloudflareClient,
                                                                  accountId: types.StreamAccountIdentifier,
                                                                  identifier: types.StreamIdentifier,
                                                                  audioIdentifier: types.StreamAudioIdentifier): Future[types.StreamDeletedResponse] {.async.} =
  ## Deletes additional audio tracks on a video. Deleting a default audio track is
  ## not allowed. You must assign another audio track as default prior to deletion.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/stream/{identifier}/audio/{audioIdentifier}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamDeletedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdStreamIdentifierAudioAudioIdentifier*(client: CloudflareClient,
                                                                 accountId: types.StreamAccountIdentifier,
                                                                 identifier: types.StreamIdentifier,
                                                                 audioIdentifier: types.StreamAudioIdentifier,
                                                                 body: types.StreamEditAudioTrack): Future[types.StreamAddAudioTrackResponse] {.async.} =
  ## Edits additional audio tracks on a video. Editing the default status of an audio
  ## track to `true` will mark all other audio tracks on the video default status to
  ## `false`.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/stream/{identifier}/audio/{audioIdentifier}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamAddAudioTrackResponse)
  else:
    raise newException(CloudflareClientError, body)
