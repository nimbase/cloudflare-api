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
  PostAccountsAccountIdEventSubscriptionsSubscriptionsRequest = object
    destination: Option[types.MqEventDestination]
    enabled: Option[bool]
    events: Option[seq[string]]
    name: Option[string]
    source: Option[types.MqEventSource]
  PatchAccountsAccountIdEventSubscriptionsSubscriptionsSubscriptionIdRequest = object
    destination: Option[types.MqEventDestination]
    enabled: Option[bool]
    events: Option[seq[string]]
    name: Option[string]
  PostAccountsAccountIdQueuesRequest = object
    queue_name: types.MqQueueName
  PostAccountsAccountIdQueuesQueueIdMessagesAckRequest = object
    acks: Option[seq[JsonNode]]
    retries: Option[seq[JsonNode]]
  PostAccountsAccountIdQueuesQueueIdMessagesExtendRequest = object
    extend: Option[seq[JsonNode]]
    visibility_timeout_ms: Option[types.MqVisibilityTimeout]
  PostAccountsAccountIdQueuesQueueIdMessagesPeekRequest = object
    batch_size: Option[types.MqBatchSize]
  PostAccountsAccountIdQueuesQueueIdMessagesPreviewRequest = object
    batch_size: Option[types.MqBatchSize]
  PostAccountsAccountIdQueuesQueueIdMessagesPreviewAckRequest = object
    acks: Option[seq[JsonNode]]
    retries: Option[seq[JsonNode]]
  PostAccountsAccountIdQueuesQueueIdMessagesPullRequest = object
    batch_size: Option[types.MqBatchSize]
    visibility_timeout_ms: Option[types.MqVisibilityTimeout]
  PostAccountsAccountIdQueuesQueueIdMessagesPurgeRequest = object
    refs: seq[JsonNode]
  PostAccountsAccountIdQueuesQueueIdPurgeRequest = object
    delete_messages_permanently: Option[bool]
  QueueOrderOption* = enum
    orderCreatedAt = "created_at"
    orderName = "name"
    orderEnabled = "enabled"
    orderSource = "source"

  QueueDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdEventSubscriptionsSubscriptions*(client: CloudflareClient,
                                                          accountId: types.MqIdentifier,
                                                          page: int64 = 1,
                                                          perPage: int64 = 20,
                                                          order: string = "name",
                                                          direction: string = "asc"): Future[JsonNode] {.async.} =
  ## Get a paginated list of event subscriptions with optional sorting and filtering

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  for v in order: q["order"] = $v
  for v in direction: q["direction"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/event_subscriptions/subscriptions", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEventSubscriptionsSubscriptions*(client: CloudflareClient,
                                                           accountId: types.MqIdentifier,
                                                           body: PostAccountsAccountIdEventSubscriptionsSubscriptionsRequest): Future[JsonNode] {.async.} =
  ## Create a new event subscription for a queue

  let res = await client.httpPOST(fmt"/accounts/{accountId}/event_subscriptions/subscriptions", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEventSubscriptionsSubscriptionsSubscriptionId*(client: CloudflareClient,
                                                                        accountId: types.MqIdentifier,
                                                                        subscriptionId: types.MqIdentifier): Future[JsonNode] {.async.} =
  ## Get details about an existing event subscription

  let res = await client.httpGET(fmt"/accounts/{accountId}/event_subscriptions/subscriptions/{subscriptionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdEventSubscriptionsSubscriptionsSubscriptionId*(client: CloudflareClient,
                                                                           accountId: types.MqIdentifier,
                                                                           subscriptionId: types.MqIdentifier): Future[JsonNode] {.async.} =
  ## Delete an existing event subscription

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/event_subscriptions/subscriptions/{subscriptionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdEventSubscriptionsSubscriptionsSubscriptionId*(client: CloudflareClient,
                                                                          accountId: types.MqIdentifier,
                                                                          subscriptionId: types.MqIdentifier,
                                                                          body: PatchAccountsAccountIdEventSubscriptionsSubscriptionsSubscriptionIdRequest): Future[JsonNode] {.async.} =
  ## Update an existing event subscription

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/event_subscriptions/subscriptions/{subscriptionId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdQueues*(client: CloudflareClient,
                                 accountId: types.MqIdentifier): Future[JsonNode] {.async.} =
  ## Returns the queues owned by an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/queues")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdQueues*(client: CloudflareClient,
                                  accountId: types.MqIdentifier,
                                  body: PostAccountsAccountIdQueuesRequest): Future[JsonNode] {.async.} =
  ## Create a new queue

  let res = await client.httpPOST(fmt"/accounts/{accountId}/queues", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdQueuesQueueId*(client: CloudflareClient,
                                        queueId: types.MqIdentifier,
                                        accountId: types.MqIdentifier): Future[JsonNode] {.async.} =
  ## Get details about a specific queue.

  let res = await client.httpGET(fmt"/accounts/{accountId}/queues/{queueId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdQueuesQueueId*(client: CloudflareClient,
                                        queueId: types.MqIdentifier,
                                        accountId: types.MqIdentifier,
                                        body: types.MqQueue): Future[JsonNode] {.async.} =
  ## Updates a Queue. Note that this endpoint does not support partial updates. If
  ## successful, the Queue's configuration is overwritten with the supplied
  ## configuration.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/queues/{queueId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdQueuesQueueId*(client: CloudflareClient,
                                           queueId: types.MqIdentifier,
                                           accountId: types.MqIdentifier): Future[types.MqApiV4Success] {.async.} =
  ## Deletes a queue

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/queues/{queueId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MqApiV4Success)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdQueuesQueueId*(client: CloudflareClient,
                                          queueId: types.MqIdentifier,
                                          accountId: types.MqIdentifier,
                                          body: types.MqQueue): Future[JsonNode] {.async.} =
  ## Updates a Queue.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/queues/{queueId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdQueuesQueueIdConsumers*(client: CloudflareClient,
                                                 queueId: types.MqIdentifier,
                                                 accountId: types.MqIdentifier): Future[JsonNode] {.async.} =
  ## Returns the consumers for a Queue

  let res = await client.httpGET(fmt"/accounts/{accountId}/queues/{queueId}/consumers")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdQueuesQueueIdConsumers*(client: CloudflareClient,
                                                  queueId: types.MqIdentifier,
                                                  accountId: types.MqIdentifier,
                                                  body: types.MqConsumerRequest): Future[JsonNode] {.async.} =
  ## Creates a new consumer for a Queue

  let res = await client.httpPOST(fmt"/accounts/{accountId}/queues/{queueId}/consumers", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdQueuesQueueIdConsumersConsumerId*(client: CloudflareClient,
                                                           consumerId: types.MqIdentifier,
                                                           queueId: types.MqIdentifier,
                                                           accountId: types.MqIdentifier): Future[JsonNode] {.async.} =
  ## Fetches the consumer for a queue by consumer id

  let res = await client.httpGET(fmt"/accounts/{accountId}/queues/{queueId}/consumers/{consumerId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdQueuesQueueIdConsumersConsumerId*(client: CloudflareClient,
                                                           consumerId: types.MqIdentifier,
                                                           queueId: types.MqIdentifier,
                                                           accountId: types.MqIdentifier,
                                                           body: types.MqConsumerRequest): Future[JsonNode] {.async.} =
  ## Updates the consumer for a queue, or creates one if it does not exist.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/queues/{queueId}/consumers/{consumerId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdQueuesQueueIdConsumersConsumerId*(client: CloudflareClient,
                                                              consumerId: types.MqIdentifier,
                                                              queueId: types.MqIdentifier,
                                                              accountId: types.MqIdentifier): Future[types.MqApiV4Success] {.async.} =
  ## Deletes the consumer for a queue.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/queues/{queueId}/consumers/{consumerId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MqApiV4Success)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdQueuesQueueIdMessages*(client: CloudflareClient,
                                                 queueId: types.MqIdentifier,
                                                 accountId: types.MqIdentifier,
                                                 body: types.MqQueueMessage): Future[JsonNode] {.async.} =
  ## Push a message to a Queue

  let res = await client.httpPOST(fmt"/accounts/{accountId}/queues/{queueId}/messages", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdQueuesQueueIdMessagesAck*(client: CloudflareClient,
                                                    queueId: types.MqIdentifier,
                                                    accountId: types.MqIdentifier,
                                                    body: PostAccountsAccountIdQueuesQueueIdMessagesAckRequest): Future[JsonNode] {.async.} =
  ## Acknowledge + Retry messages from a Queue

  let res = await client.httpPOST(fmt"/accounts/{accountId}/queues/{queueId}/messages/ack", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdQueuesQueueIdMessagesBatch*(client: CloudflareClient,
                                                      queueId: types.MqIdentifier,
                                                      accountId: types.MqIdentifier,
                                                      body: types.MqQueueBatch): Future[JsonNode] {.async.} =
  ## Push a batch of message to a Queue

  let res = await client.httpPOST(fmt"/accounts/{accountId}/queues/{queueId}/messages/batch", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdQueuesQueueIdMessagesExtend*(client: CloudflareClient,
                                                       queueId: types.MqIdentifier,
                                                       accountId: types.MqIdentifier,
                                                       body: PostAccountsAccountIdQueuesQueueIdMessagesExtendRequest): Future[JsonNode] {.async.} =
  ## Extend the lease on a message. This creates a new lease ID on your message
  ## without incrementing the message's `attempts` counter.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/queues/{queueId}/messages/extend", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdQueuesQueueIdMessagesPeek*(client: CloudflareClient,
                                                     queueId: types.MqIdentifier,
                                                     accountId: types.MqIdentifier,
                                                     body: PostAccountsAccountIdQueuesQueueIdMessagesPeekRequest): Future[JsonNode] {.async.} =
  ## Peek messages from a Queue without leasing them. Messages remain available for
  ## subsequent peek or pull operations.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/queues/{queueId}/messages/peek", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdQueuesQueueIdMessagesPreview*(client: CloudflareClient,
                                                        queueId: types.MqIdentifier,
                                                        accountId: types.MqIdentifier,
                                                        body: PostAccountsAccountIdQueuesQueueIdMessagesPreviewRequest): Future[JsonNode] {.async.} =
  ## Preview messages from a Queue without leasing them. Messages remain available
  ## for subsequent preview or pull operations.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/queues/{queueId}/messages/preview", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdQueuesQueueIdMessagesPreviewAck*(client: CloudflareClient,
                                                           queueId: types.MqIdentifier,
                                                           accountId: types.MqIdentifier,
                                                           body: PostAccountsAccountIdQueuesQueueIdMessagesPreviewAckRequest): Future[JsonNode] {.async.} =
  ## Delete previewed messages from a Queue. Note that messages acknowledged this way
  ## aren't considered delivered, they are instantly deleted from this queue and do
  ## not affect metrics.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/queues/{queueId}/messages/preview/ack", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdQueuesQueueIdMessagesPull*(client: CloudflareClient,
                                                     queueId: types.MqIdentifier,
                                                     accountId: types.MqIdentifier,
                                                     body: PostAccountsAccountIdQueuesQueueIdMessagesPullRequest): Future[JsonNode] {.async.} =
  ## Pull a batch of messages from a Queue

  let res = await client.httpPOST(fmt"/accounts/{accountId}/queues/{queueId}/messages/pull", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdQueuesQueueIdMessagesPurge*(client: CloudflareClient,
                                                      queueId: types.MqIdentifier,
                                                      accountId: types.MqIdentifier,
                                                      body: PostAccountsAccountIdQueuesQueueIdMessagesPurgeRequest): Future[JsonNode] {.async.} =
  ## Delete peeked messages from a Queue by their ref. Purged messages aren't
  ## considered delivered, they are instantly deleted from this queue and do not
  ## affect metrics.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/queues/{queueId}/messages/purge", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdQueuesQueueIdMetrics*(client: CloudflareClient,
                                               queueId: types.MqIdentifier,
                                               accountId: types.MqIdentifier): Future[JsonNode] {.async.} =
  ## Return best-effort metrics for a queue. Values may be approximate due to the
  ## distributed nature of queues.

  let res = await client.httpGET(fmt"/accounts/{accountId}/queues/{queueId}/metrics")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdQueuesQueueIdPurge*(client: CloudflareClient,
                                             queueId: types.MqIdentifier,
                                             accountId: types.MqIdentifier): Future[JsonNode] {.async.} =
  ## Get details about a Queue's purge status.

  let res = await client.httpGET(fmt"/accounts/{accountId}/queues/{queueId}/purge")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdQueuesQueueIdPurge*(client: CloudflareClient,
                                              queueId: types.MqIdentifier,
                                              accountId: types.MqIdentifier,
                                              body: PostAccountsAccountIdQueuesQueueIdPurgeRequest): Future[JsonNode] {.async.} =
  ## Deletes all messages from the Queue.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/queues/{queueId}/purge", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
