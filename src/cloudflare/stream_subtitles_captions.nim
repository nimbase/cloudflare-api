# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdStreamIdentifierCaptions*(client: CloudflareClient,
                                                   identifier: types.StreamIdentifier,
                                                   accountId: types.StreamIdentifier2): Future[types.StreamLanguageResponseCollection] {.async.} =
  ## Lists the available captions or subtitles for a specific video.

  let res = await client.httpGET(fmt"/accounts/{accountId}/stream/{identifier}/captions")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamLanguageResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdStreamIdentifierCaptionsLanguage*(client: CloudflareClient,
                                                           language: types.StreamLanguage,
                                                           identifier: types.StreamIdentifier,
                                                           accountId: types.StreamIdentifier2): Future[types.StreamLanguageResponseSingle] {.async.} =
  ## Lists the captions or subtitles for provided language.

  let res = await client.httpGET(fmt"/accounts/{accountId}/stream/{identifier}/captions/{language}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamLanguageResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdStreamIdentifierCaptionsLanguage*(client: CloudflareClient,
                                                           language: types.StreamLanguage,
                                                           identifier: types.StreamIdentifier,
                                                           accountId: types.StreamIdentifier2): Future[types.StreamLanguageResponseSingle] {.async.} =
  ## Uploads the caption or subtitle file to the endpoint for a specific BCP47
  ## language. One caption or subtitle file per language is allowed.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/stream/{identifier}/captions/{language}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamLanguageResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdStreamIdentifierCaptionsLanguage*(client: CloudflareClient,
                                                              language: types.StreamLanguage,
                                                              identifier: types.StreamIdentifier,
                                                              accountId: types.StreamIdentifier2): Future[JsonNode] {.async.} =
  ## Removes the captions or subtitles from a video.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/stream/{identifier}/captions/{language}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdStreamIdentifierCaptionsLanguageGenerate*(client: CloudflareClient,
                                                                    language: types.StreamLanguage,
                                                                    identifier: types.StreamIdentifier,
                                                                    accountId: types.StreamIdentifier2): Future[types.StreamLanguageResponseSingle] {.async.} =
  ## Generate captions or subtitles for provided language via AI.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/stream/{identifier}/captions/{language}/generate")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamLanguageResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdStreamIdentifierCaptionsLanguageVtt*(client: CloudflareClient,
                                                              language: types.StreamLanguage,
                                                              identifier: types.StreamIdentifier,
                                                              accountId: types.StreamIdentifier2): Future[AsyncResponse] {.async.} =
  ## Return WebVTT captions for a provided language.

  let res = await client.httpGET(fmt"/accounts/{accountId}/stream/{identifier}/captions/{language}/vtt")
  return res
