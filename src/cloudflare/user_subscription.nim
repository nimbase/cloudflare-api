# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types

type
  DeleteUserSubscriptionsIdentifierResponse* = object
    subscription_id: types.BillSubsApiSchemasIdentifier

proc getUserSubscriptions*(client: CloudflareClient): Future[types.BillSubsApiUserSubscriptionResponseCollection] {.async.} =
  ## Lists all of a user's subscriptions.

  let res = await client.httpGET("/user/subscriptions")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiUserSubscriptionResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postUserSubscriptions*(client: CloudflareClient,
                            body: types.BillSubsApiSubscriptionV2): Future[types.BillSubsApiUserSubscriptionResponseSingle] {.async.} =
  ## Creates a user subscription.

  let res = await client.httpPOST("/user/subscriptions", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiUserSubscriptionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putUserSubscriptionsIdentifier*(client: CloudflareClient,
                                     identifier: types.BillSubsApiSchemasIdentifier,
                                     body: types.BillSubsApiSubscriptionV2): Future[types.BillSubsApiUserSubscriptionResponseSingle] {.async.} =
  ## Updates a user's subscriptions.

  let res = await client.httpPUT(fmt"/user/subscriptions/{identifier}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiUserSubscriptionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteUserSubscriptionsIdentifier*(client: CloudflareClient,
                                        identifier: types.BillSubsApiSchemasIdentifier): Future[DeleteUserSubscriptionsIdentifierResponse] {.async.} =
  ## Deletes a user's subscription.

  let res = await client.httpDELETE(fmt"/user/subscriptions/{identifier}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteUserSubscriptionsIdentifierResponse)
  else:
    raise newException(CloudflareClientError, body)
