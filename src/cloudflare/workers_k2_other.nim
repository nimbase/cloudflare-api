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
  DeleteAccountsAccountIdK2StreamsStreamIdResponse* = object
    result: JsonNode
    success: types.CloudflareK2WorkersK2CommonSuccess

proc getAccountsAccountIdK2Streams*(client: CloudflareClient,
                                    accountId: types.CloudflareK2WorkersK2AccountId,
                                    name: string = default(string),
                                    page: int64 = 1, perPage: int64 = 25): Future[types.CloudflareK2K2StreamListResponse] {.async.} =
  ## List or filter K2 streams in an account.

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/k2/streams", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudflareK2K2StreamListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdK2Streams*(client: CloudflareClient,
                                     accountId: types.CloudflareK2WorkersK2AccountId,
                                     body: types.CloudflareK2CreateK2StreamRequest): Future[types.CloudflareK2K2StreamResponse] {.async.} =
  ## Create a new K2 stream.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/k2/streams", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudflareK2K2StreamResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdK2StreamsStreamId*(client: CloudflareClient,
                                            accountId: types.CloudflareK2WorkersK2AccountId,
                                            streamId: types.CloudflareK2WorkersK2StreamId): Future[types.CloudflareK2K2StreamResponse] {.async.} =
  ## Get K2 stream details.

  let res = await client.httpGET(fmt"/accounts/{accountId}/k2/streams/{streamId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudflareK2K2StreamResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdK2StreamsStreamId*(client: CloudflareClient,
                                               accountId: types.CloudflareK2WorkersK2AccountId,
                                               streamId: types.CloudflareK2WorkersK2StreamId): Future[DeleteAccountsAccountIdK2StreamsStreamIdResponse] {.async.} =
  ## Delete a K2 stream in an account. Deleting a stream that does not exist also
  ## succeeds.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/k2/streams/{streamId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdK2StreamsStreamIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdK2StreamsStreamId*(client: CloudflareClient,
                                              accountId: types.CloudflareK2WorkersK2AccountId,
                                              streamId: types.CloudflareK2WorkersK2StreamId,
                                              body: types.CloudflareK2UpdateK2StreamRequest): Future[types.CloudflareK2K2StreamResponse] {.async.} =
  ## Update a K2 stream. Omitted `http` settings, such as `authentication` and
  ## `cors`, keep their current values while HTTP stays enabled. Disabling HTTP
  ## clears its settings. At least one input must remain enabled.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/k2/streams/{streamId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudflareK2K2StreamResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdK2StreamsStreamIdSubscriptions*(client: CloudflareClient,
                                                         accountId: types.CloudflareK2WorkersK2AccountId,
                                                         streamId: types.CloudflareK2WorkersK2StreamId): Future[types.CloudflareK2K2MonitoredSubscriptionListResponse] {.async.} =
  ## Lists every subscription on one stream, oldest first. Lag uses committed
  ## positions, not reserved read positions. A failed tail observation preserves
  ## subscription metadata and returns unavailable lag.

  let res = await client.httpGET(fmt"/accounts/{accountId}/k2/streams/{streamId}/subscriptions")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudflareK2K2MonitoredSubscriptionListResponse)
  else:
    raise newException(CloudflareClientError, body)
