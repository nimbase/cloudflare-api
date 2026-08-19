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
  PostAccountsAccountIdStreamWatermarksRequest = object
    name: Option[types.StreamName]
    opacity: Option[types.StreamOpacity]
    padding: Option[types.StreamPadding]
    position: Option[types.StreamPosition]
    scale: Option[types.StreamScale]
    url: Option[string]

proc getAccountsAccountIdStreamWatermarks*(client: CloudflareClient,
                                           accountId: types.StreamAccountIdentifier): Future[types.StreamWatermarkResponseCollection] {.async.} =
  ## Lists all watermark profiles for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/stream/watermarks")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamWatermarkResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdStreamWatermarks*(client: CloudflareClient,
                                            accountId: types.StreamAccountIdentifier,
                                            body: PostAccountsAccountIdStreamWatermarksRequest): Future[types.StreamWatermarkResponseSingle] {.async.} =
  ## Creates watermark profiles using a single `HTTP POST multipart/form-data`
  ## request.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/stream/watermarks", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamWatermarkResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdStreamWatermarksIdentifier*(client: CloudflareClient,
                                                     identifier: types.StreamWatermarkIdentifier,
                                                     accountId: types.StreamAccountIdentifier): Future[types.StreamWatermarkResponseSingle] {.async.} =
  ## Retrieves details for a single watermark profile.

  let res = await client.httpGET(fmt"/accounts/{accountId}/stream/watermarks/{identifier}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamWatermarkResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdStreamWatermarksIdentifier*(client: CloudflareClient,
                                                        identifier: types.StreamWatermarkIdentifier,
                                                        accountId: types.StreamAccountIdentifier): Future[JsonNode] {.async.} =
  ## Deletes a watermark profile.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/stream/watermarks/{identifier}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
