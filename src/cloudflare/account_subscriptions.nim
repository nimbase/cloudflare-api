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
    subscriptions: Option[seq[types.BillSubsSubscriptionV2]]
    user_is_on_session: Option[bool]
  PostAccountsAccountIdSubscriptionsCancelDowngradeRequest = object
    subscription_ids: Option[seq[string]]

proc postAccountsAccountIdBulkSubscriptions*(client: CloudflareClient,
                                             accountId: types.BillSubsIdentifier,
                                             idempKey: string = default(string),
                                             body: PostAccountsAccountIdBulkSubscriptionsRequest): Future[types.BillSubsBulkAccountSubscriptionResponse] {.async.} =
  ## Creates multiple subscriptions for an account in a single request.

  var q = initOrderedTable[string, string]()
  q["idemp_key"] = $idempKey
  let res = await client.httpPOST(fmt"/accounts/{accountId}/bulk/subscriptions", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsBulkAccountSubscriptionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSubscriptions*(client: CloudflareClient,
                                        accountId: types.BillSubsIdentifier): Future[types.BillSubsAccountSubscriptionResponseCollection] {.async.} =
  ## Lists all of an account's subscriptions.

  let res = await client.httpGET(fmt"/accounts/{accountId}/subscriptions")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsAccountSubscriptionResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdSubscriptions*(client: CloudflareClient,
                                         accountId: types.BillSubsIdentifier,
                                         body: types.BillSubsSubscriptionV2): Future[types.BillSubsAccountSubscriptionResponseSingle] {.async.} =
  ## Creates an account subscription.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/subscriptions", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsAccountSubscriptionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdSubscriptionsCancelDowngrade*(client: CloudflareClient,
                                                        accountId: types.BillSubsIdentifier,
                                                        body: PostAccountsAccountIdSubscriptionsCancelDowngradeRequest): Future[types.BillSubsApiResponseSingle] {.async.} =
  ## Cancels pending delayed downgrades for the specified subscriptions.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/subscriptions/cancel-downgrade", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSubscriptionsSubscriptionIdentifier*(client: CloudflareClient,
                                                              subscriptionIdentifier: types.BillSubsSchemasIdentifier,
                                                              accountId: types.BillSubsIdentifier): Future[types.BillSubsAccountSubscriptionResponseSingle] {.async.} =
  ## Gets an account subscription by identifier.

  let res = await client.httpGET(fmt"/accounts/{accountId}/subscriptions/{subscriptionIdentifier}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsAccountSubscriptionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdSubscriptionsSubscriptionIdentifier*(client: CloudflareClient,
                                                              subscriptionIdentifier: types.BillSubsSchemasIdentifier,
                                                              accountId: types.BillSubsIdentifier,
                                                              body: types.BillSubsSubscriptionV2): Future[types.BillSubsAccountSubscriptionResponseSingle] {.async.} =
  ## Updates an account subscription.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/subscriptions/{subscriptionIdentifier}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsAccountSubscriptionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdSubscriptionsSubscriptionIdentifier*(client: CloudflareClient,
                                                                 subscriptionIdentifier: types.BillSubsSchemasIdentifier,
                                                                 accountId: types.BillSubsIdentifier): Future[JsonNode] {.async.} =
  ## Deletes an account's subscription.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/subscriptions/{subscriptionIdentifier}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdSubscriptionsSubscriptionIdentifierActionAppend*(client: CloudflareClient,
                                                                           subscriptionIdentifier: types.BillSubsSchemasIdentifier,
                                                                           accountId: types.BillSubsIdentifier,
                                                                           body: types.BillSubsSubscriptionV2): Future[types.BillSubsAccountSubscriptionResponseSingle] {.async.} =
  ## Smartly applies the incoming subscription into the lifecycle of the
  ## subscription.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/subscriptions/{subscriptionIdentifier}/action/append", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsAccountSubscriptionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSubscriptionsSubscriptionIdentifierCancelReason*(client: CloudflareClient,
                                                                          subscriptionIdentifier: types.BillSubsSchemasIdentifier,
                                                                          accountId: types.BillSubsIdentifier): Future[types.BillSubsCancelReasonResponseSingle] {.async.} =
  ## Gets the cancellation reason for an account subscription.

  let res = await client.httpGET(fmt"/accounts/{accountId}/subscriptions/{subscriptionIdentifier}/cancel-reason")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsCancelReasonResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdSubscriptionsSubscriptionIdentifierCancelReason*(client: CloudflareClient,
                                                                           subscriptionIdentifier: types.BillSubsSchemasIdentifier,
                                                                           accountId: types.BillSubsIdentifier,
                                                                           body: types.BillSubsCancelReasonRequest): Future[types.BillSubsCancelReasonResponseSingle] {.async.} =
  ## Records a cancellation reason for an account subscription.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/subscriptions/{subscriptionIdentifier}/cancel-reason", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsCancelReasonResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountOrZoneAccountOrZoneIdSubscriptions*(client: CloudflareClient,
                                                   accountOrZone: AccountOrZone,
                                                   accountOrZoneId: types.BillSubsIdentifier): Future[types.BillSubsAccountSubscriptionResponseCollection] {.async.} =
  ## Lists all of an account or zone's subscriptions.

  let res = await client.httpGET(fmt"/{accountOrZone}/{accountOrZoneId}/subscriptions")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsAccountSubscriptionResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountOrZoneAccountOrZoneIdSubscriptions*(client: CloudflareClient,
                                                    accountOrZone: AccountOrZone,
                                                    accountOrZoneId: types.BillSubsIdentifier,
                                                    body: types.BillSubsSubscriptionV2): Future[types.BillSubsAccountSubscriptionResponseSingle] {.async.} =
  ## Creates an account or zone subscription.

  let res = await client.httpPOST(fmt"/{accountOrZone}/{accountOrZoneId}/subscriptions", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsAccountSubscriptionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
