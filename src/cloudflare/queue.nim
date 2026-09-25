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
    jurisdiction: Option[types.MqJurisdiction]
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
                                                          order: QueueOrderOption = orderName,
                                                          direction: QueueDirectionOption = directionAsc): Future[JsonNode] {.async.} =
  ## Returns a paginated list of Queue event subscriptions with optional sorting and
  ## filtering.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
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
  ## Creates an event subscription for a Queue.

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
  ## Returns an existing Queue event subscription.

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
  ## Deletes an existing Queue event subscription.

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
  ## Updates an existing Queue event subscription.

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
  ## Creates a Queue in the account.

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
  ## Returns details about a specific Queue.

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
  ## Replaces a Queue's configuration with the supplied configuration. This endpoint
  ## does not support partial updates.

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
  ## Deletes a Queue.

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
  ## Updates part of a Queue's configuration.

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
  ## Returns the consumers configured for a Queue.

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
  ## Creates a consumer for a Queue.

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
  ## Returns a Queue consumer by identifier.

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
  ## Replaces a Queue consumer, or creates it if it does not exist.

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
  ## Deletes a consumer from a Queue.

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
  ## Pushes a message to a Queue.

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
  ## Acknowledges successfully processed Queue messages and retries messages that
  ## were not processed successfully.

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
  ## Pushes a batch of messages to a Queue.

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
  ## Extends message leases without incrementing the messages' `attempts` counters.
  ## Each message receives a new lease identifier.

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
  ## Peek messages from a Queue without leasing them. Each message includes a ref
  ## that can be passed to the purge endpoint, and remains available for subsequent
  ## peek or pull operations until it is purged.

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
  ## Preview messages from a Queue without leasing them. This deprecated route is
  ## retained for compatibility; use the peek endpoint for new integrations.

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
  ## Delete messages returned by the legacy preview endpoint. This deprecated route
  ## is retained for compatibility; use the peek and purge endpoints for new
  ## integrations. Deleting messages this way does not count as delivery and does not
  ## affect metrics.

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
  ## Pulls a batch of messages from a Queue for an HTTP pull consumer.

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
  ## Delete messages from a Queue by using refs returned by the peek endpoint.
  ## Purging messages does not count as delivery and does not affect metrics.

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
  ## Returns best-effort metrics for a Queue. Values may be approximate due to the
  ## distributed nature of Queues.

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
  ## Returns the status of a Queue purge operation.

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
  ## Starts a purge that deletes all messages from a Queue.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/queues/{queueId}/purge", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
