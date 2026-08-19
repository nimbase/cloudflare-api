# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc postAccountsAccountIdStreamClip*(client: CloudflareClient,
                                      accountId: types.StreamAccountIdentifier,
                                      body: types.StreamVideoClipStandard): Future[types.StreamClipResponseSingle] {.async.} =
  ## Clips a video based on the specified start and end times provided in seconds.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/stream/clip", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamClipResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
