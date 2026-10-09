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
    errors: types.CloudflareK2WorkersK2Messages
    messages: types.CloudflareK2WorkersK2Messages
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
  ## Create a new K2 stream. HTTP is disabled when `http` is omitted. Enabled HTTP
  ## requires authentication and allows all origins unless `authentication` or `cors`
  ## say otherwise. At least one input must be enabled.

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
  ## `cors`, keep their current values. Disabling HTTP keeps them, so enabling HTTP
  ## again restores them. At least one input must remain enabled.

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

proc postProduce*(client: CloudflareClient,
                  body: types.CloudflareK2K2ProduceRequest): Future[types.CloudflareK2K2ProduceResponse] {.async.} =
  ## Appends a batch of records to the stream. The batch is written atomically, so
  ## either every record is stored or none are. Requests are limited to 5 MB,
  ## compressed and decompressed, and each record to 1 MB. Gzip bodies are accepted
  ## when `Content-Encoding` is `gzip`. Requires an API token with K2 produce
  ## permission unless the stream's HTTP input sets `authentication` to false. Errors
  ## use a `success` and `error` body instead of the `errors` array.

  let res = await client.httpPOST("/produce", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudflareK2K2ProduceResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postSubscriptions*(client: CloudflareClient,
                        body: types.CloudflareK2CreateK2SubscriptionRequest): Future[types.CloudflareK2K2SubscriptionIdResponse] {.async.} =
  ## Create a subscription, which reads the stream from its own position. Creating a
  ## subscription with an existing name returns the existing subscription. A stream
  ## can have up to 100 subscriptions. Requires an API token with K2 consume
  ## permission.

  let res = await client.httpPOST("/subscriptions", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudflareK2K2SubscriptionIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getSubscriptionsSubscriptionId*(client: CloudflareClient,
                                     subscriptionId: types.CloudflareK2WorkersK2SubscriptionId): Future[types.CloudflareK2K2SubscriptionResponse] {.async.} =
  ## Get a subscription. Requires an API token with K2 consume permission.

  let res = await client.httpGET(fmt"/subscriptions/{subscriptionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudflareK2K2SubscriptionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteSubscriptionsSubscriptionId*(client: CloudflareClient,
                                        subscriptionId: types.CloudflareK2WorkersK2SubscriptionId): Future[types.CloudflareK2K2SubscriptionIdResponse] {.async.} =
  ## Delete a subscription and its position in the stream. Requires an API token with
  ## K2 consume permission.

  let res = await client.httpDELETE(fmt"/subscriptions/{subscriptionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudflareK2K2SubscriptionIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postSubscriptionsSubscriptionIdBatchesBatchIdAck*(client: CloudflareClient,
                                                       subscriptionId: types.CloudflareK2WorkersK2SubscriptionId,
                                                       batchId: types.CloudflareK2WorkersK2BatchId,
                                                       body: types.CloudflareK2K2BatchRequest): Future[types.CloudflareK2K2EmptyResponse] {.async.} =
  ## Confirm that the worker processed a batch, so K2 does not deliver it again.
  ## Acknowledging an unknown, already acknowledged, or reassigned batch also
  ## succeeds. Requires an API token with K2 consume permission.

  let res = await client.httpPOST(fmt"/subscriptions/{subscriptionId}/batches/{batchId}/ack", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudflareK2K2EmptyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postSubscriptionsSubscriptionIdBatchesBatchIdExtend*(client: CloudflareClient,
                                                          subscriptionId: types.CloudflareK2WorkersK2SubscriptionId,
                                                          batchId: types.CloudflareK2WorkersK2BatchId,
                                                          body: types.CloudflareK2K2BatchRequest): Future[types.CloudflareK2K2ExtendResponse] {.async.} =
  ## Extend the lease on a batch the worker still holds to 5 minutes from now.
  ## Returns 409 with code 10218 when the worker no longer holds the lease; stop
  ## processing the batch and call Consume again. Requires an API token with K2
  ## consume permission.

  let res = await client.httpPOST(fmt"/subscriptions/{subscriptionId}/batches/{batchId}/extend", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudflareK2K2ExtendResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postSubscriptionsSubscriptionIdBatchesBatchIdNack*(client: CloudflareClient,
                                                        subscriptionId: types.CloudflareK2WorkersK2SubscriptionId,
                                                        batchId: types.CloudflareK2WorkersK2BatchId,
                                                        body: types.CloudflareK2K2BatchRequest): Future[types.CloudflareK2K2EmptyResponse] {.async.} =
  ## Returns a batch to the subscription for redelivery. The next Consume request
  ## from any worker receives them under a new `batch_id`. Releasing an unknown or
  ## already settled batch also succeeds. Requires an API token with K2 consume
  ## permission.

  let res = await client.httpPOST(fmt"/subscriptions/{subscriptionId}/batches/{batchId}/nack", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudflareK2K2EmptyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postSubscriptionsSubscriptionIdConsume*(client: CloudflareClient,
                                             subscriptionId: types.CloudflareK2WorkersK2SubscriptionId,
                                             body: types.CloudflareK2K2ConsumeRequest): Future[types.CloudflareK2K2ConsumeResponse] {.async.} =
  ## Returns the next batch of records and leases it to the worker for 5 minutes. ACK
  ## the batch after processing it, NACK it to have it redelivered, or extend the
  ## lease if processing takes longer. When no records are available, the response
  ## has no records and a null `batch_id`. Returns 429 with code 10216 when every
  ## parallel read slot for the subscription is leased, and 409 with code 10217 while
  ## this worker has a read in progress; retry both. Requires an API token with K2
  ## consume permission.

  let res = await client.httpPOST(fmt"/subscriptions/{subscriptionId}/consume", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudflareK2K2ConsumeResponse)
  else:
    raise newException(CloudflareClientError, body)
