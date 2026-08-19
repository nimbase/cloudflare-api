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
  PostAccountsAccountIdBulkSubscriptionsRequest = object
    coupon_code: Option[string]
    payment_hold_id: Option[int64]
    subscriptions: Option[seq[types.BillSubsApiSubscriptionV2]]
    user_is_on_session: Option[bool]

proc postAccountsAccountIdBulkSubscriptions*(client: CloudflareClient,
                                             accountId: types.BillSubsApiIdentifier,
                                             idempKey: string = default(string),
                                             body: PostAccountsAccountIdBulkSubscriptionsRequest): Future[types.BillSubsApiBulkAccountSubscriptionResponse] {.async.} =
  ## Creates multiple subscriptions for an account in a single request.

  var q = initOrderedTable[string, string]()
  q["idemp_key"] = $idempKey
  let res = await client.httpPOST(fmt"/accounts/{accountId}/bulk/subscriptions", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiBulkAccountSubscriptionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSubscriptions*(client: CloudflareClient,
                                        accountId: types.BillSubsApiIdentifier): Future[types.BillSubsApiAccountSubscriptionResponseCollection] {.async.} =
  ## Lists all of an account's subscriptions.

  let res = await client.httpGET(fmt"/accounts/{accountId}/subscriptions")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiAccountSubscriptionResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdSubscriptions*(client: CloudflareClient,
                                         accountId: types.BillSubsApiIdentifier,
                                         body: types.BillSubsApiSubscriptionV2): Future[types.BillSubsApiAccountSubscriptionResponseSingle] {.async.} =
  ## Creates an account subscription.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/subscriptions", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiAccountSubscriptionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdSubscriptionsSubscriptionIdentifier*(client: CloudflareClient,
                                                              subscriptionIdentifier: types.BillSubsApiSchemasIdentifier,
                                                              accountId: types.BillSubsApiIdentifier,
                                                              body: types.BillSubsApiSubscriptionV2): Future[types.BillSubsApiAccountSubscriptionResponseSingle] {.async.} =
  ## Updates an account subscription.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/subscriptions/{subscriptionIdentifier}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiAccountSubscriptionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdSubscriptionsSubscriptionIdentifier*(client: CloudflareClient,
                                                                 subscriptionIdentifier: types.BillSubsApiSchemasIdentifier,
                                                                 accountId: types.BillSubsApiIdentifier): Future[JsonNode] {.async.} =
  ## Deletes an account's subscription.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/subscriptions/{subscriptionIdentifier}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdSubscriptionsSubscriptionIdentifierActionAppend*(client: CloudflareClient,
                                                                           subscriptionIdentifier: types.BillSubsApiSchemasIdentifier,
                                                                           accountId: types.BillSubsApiIdentifier,
                                                                           body: types.BillSubsApiSubscriptionV2): Future[types.BillSubsApiAccountSubscriptionResponseSingle] {.async.} =
  ## Smartly applies the incoming subscription into the lifecycle of the
  ## subscription.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/subscriptions/{subscriptionIdentifier}/action/append", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiAccountSubscriptionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
